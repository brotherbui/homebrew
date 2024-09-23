class Go < Formula
  desc "Open source programming language to build simple/reliable/efficient software"
  homepage "https://go.dev/"
  url "https://go.dev/dl/go1.23.1.src.tar.gz"
  mirror "https://fossies.org/linux/misc/go1.23.1.src.tar.gz"
  sha256 "6ee44e298379d146a5e5aa6b1c5b5d5f5d0a3365eabdd70741e6e21340ec3b0d"
  license "BSD-3-Clause"
  head "https://go.googlesource.com/go.git", branch: "master"

  bottle do
    root_url "https://github.com/brotherbui/homebrew/releases/download/go-v1.23.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d6dd04d9546d25136b416f5a86176fc330492929e128b2db3409dcc9621f5a2b"
  end

  def install
    inreplace "go.env", /^GOTOOLCHAIN=.*$/, "GOTOOLCHAIN=local"

    libexec.install Dir["*"]
    bin.install_symlink Dir[libexec/"bin/go*"]

    system bin/"go", "install", "std", "cmd"
  end

  def caveats
    <<~EOS
      Homebrew's Go toolchain is configured with
        GOTOOLCHAIN=local
      per Homebrew policy on tools that update themselves.
    EOS
  end

  test do
    assert_equal "local", shell_output("#{bin}/go env GOTOOLCHAIN").strip

    (testpath/"hello.go").write <<~EOS
      package main

      import "fmt"

      func main() {
          fmt.Println("Hello World")
      }
    EOS

    # Run go fmt check for no errors then run the program.
    # This is a a bare minimum of go working as it uses fmt, build, and run.
    system bin/"go", "fmt", "hello.go"
    assert_equal "Hello World\n", shell_output("#{bin}/go run hello.go")

    with_env(GOOS: "freebsd", GOARCH: "amd64") do
      system bin/"go", "build", "hello.go"
    end

    (testpath/"hello_cgo.go").write <<~EOS
      package main

      /*
      #include <stdlib.h>
      #include <stdio.h>
      void hello() { printf("%s\\n", "Hello from cgo!"); fflush(stdout); }
      */
      import "C"

      func main() {
          C.hello()
      }
    EOS

    # Try running a sample using cgo without CC or CXX set to ensure that the
    # toolchain's default choice of compilers work
    with_env(CC: nil, CXX: nil) do
      assert_equal "Hello from cgo!\n", shell_output("#{bin}/go run hello_cgo.go")
    end
  end
end
