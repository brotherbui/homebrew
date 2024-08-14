class Go < Formula
  desc "Open source programming language to build simple/reliable/efficient software"
  homepage "https://go.dev/"
  url "https://go.dev/dl/go1.23.0.darwin-arm64.tar.gz"
  sha256 "b770812aef17d7b2ea406588e2b97689e9557aac7e646fe76218b216e2c51406"
  license "BSD-3-Clause"



  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir[libexec/"bin/go*"]

  end
end
