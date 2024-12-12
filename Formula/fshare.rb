class Fshare < Formula
  desc "Overkill Fshare downloader"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.8"


  on_macos do
    on_arm do
        url "https://github.com/brotherbui/public/releases/download/fshare/fshare.tgz"
        sha256 "c4f39da7dde1485a81dcec6032aa623c34d08c0c136d5422e93c674421e9cfa4"
    end
    on_intel do
        url "https://github.com/brotherbui/public/releases/download/fshare/fshare-intel.tgz"
        sha256 "df5d2b9f8c61d56b7478a377828bea6adc8d808d6300dbab5bb61e1f476c7cfd"
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
