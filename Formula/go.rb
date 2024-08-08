class Go < Formula
  desc "Open source programming language to build simple/reliable/efficient software"
  homepage "https://go.dev/"
  url "https://phongblack.online/go/go1.22.6.zip"
  sha256 "8253710cb451c26f409cc1ed84bfbc83a0e11daf97e25cafa4b861d4d3784e1f"
  license "BSD-3-Clause"



  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir[libexec/"bin/go*"]

  end
end
