class Fshare < Formula
  desc "Overkill Fshare downloader"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.0"

  on_intel do
    url "https://phongblack.me/media/fshare-intel.tar.gz"
    sha256 "e1a4916b85797db584aadbed75015aad38342e035b134aea2249a7280e90c44f"
  end

  on_arm do
    url "https://phongblack.me/media/fshare.tar.gz"
    sha256 "90f486224e52d4c83be1a649dbb67c589dccc01ccad1a508267c5b12a8cbf0e8"
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