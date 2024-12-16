class Fshare < Formula
  desc "Overkill Fshare downloader"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.9"


  on_macos do
    on_arm do
        url "https://github.com/brotherbui/public/releases/download/fshare/fshare.tgz"
        sha256 "c531a257939b8cf9c43f9d699ef6258af194a402fb9154d4ecc1eaea5ff69e8b"
    end
    on_intel do
        url "https://github.com/brotherbui/public/releases/download/fshare/fshare-intel.tgz"
        sha256 "c0fb830ebfbe459ac1b39763ff4c5d3dba3976f0720732ee6ae5ff5bec208206"
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
