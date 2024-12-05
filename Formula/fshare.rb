class Fshare < Formula
  desc "Overkill Fshare downloader"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.6"
  url "https://github.com/brotherbui/public/releases/download/fshare/fshare.tgz"
  sha256 "6fb98ebfb4fe24943416fb78779be5d8b5bc41690a5f667afa3472e080eae25e"

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
