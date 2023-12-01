class Fshare < Formula
  desc "Overkill Fshare downloader"
  homepage "https://phongblack.me"
  url "https://phongblack.me/media/fshare.tar.gz"
  sha256 "6e47d89151148b325425076c829e855d4b44de45e6345da11821b641a4a831c4"
  license "EPL-2.0"
  version "1.0"
  depends_on "aria2"

  def install
    bin.install "./fshare"
  end

  service do
    run [bin/"aria2c", "--enable-rpc=true", "--rpc-secret=@1nonmihcn0@", "--rpc-allow-origin-all=true", "--rpc-listen-all=true", "--rpc-listen-port=6800"]
    keep_alive true
  end
end