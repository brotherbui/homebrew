class Fshare < Formula
  desc "Overkill Fshare downloader"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.1.0"


  on_macos do
    on_arm do
        url "https://github.com/brotherbui/public/releases/download/fshare/fshare.tgz"
        sha256 "d8fa2701b9c9bc33fea82c5d48c981455f4fe2d60bb94346c164c532fe88457d"
    end
    on_intel do
        url "https://github.com/brotherbui/public/releases/download/fshare/fshare-intel.tgz"
        sha256 "de040d7325894db03453b9575e76f12e9c04b901fceaf8dd0176a2d0413f0b1e"
    end
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
