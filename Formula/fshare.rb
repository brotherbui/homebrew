class Fshare < Formula
  desc "Overkill Fshare downloader"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.0"

  on_intel do
    url "https://phongblack.me/media/fshare-intel.tar.gz"
    sha256 "fdb62c11fa7dedbdf286279d8b3262cdaf37195b60a970e8365e0b9ca18ddb4b"
  end

  on_arm do
    url "https://phongblack.me/media/fshare.tar.gz"
    sha256 "6890fca2d16d62e7a63d49e82e42894f2177d3f113baab807e30f56f759af515"
  end

  depends_on "aria2"

  def install
    bin.install "./fshare"
  end

  service do
    if Hardware::CPU.arm?
      run ["/opt/homebrew/bin/aria2c", "--enable-rpc=true", "--rpc-secret=welovephongblack", "--rpc-allow-origin-all=true", "--rpc-listen-all=true", "--rpc-listen-port=6800"]
    else
      run ["/usr/local/bin/aria2c", "--enable-rpc=true", "--rpc-secret=welovephongblack", "--rpc-allow-origin-all=true", "--rpc-listen-all=true", "--rpc-listen-port=6800"]
    end
    keep_alive true
  end
end