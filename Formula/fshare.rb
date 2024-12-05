class Fshare < Formula
  desc "Overkill Fshare downloader"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.7"


  on_macos do
    on_arm do
        url "https://github.com/brotherbui/public/releases/download/fshare/fshare.tgz"
        sha256 "6fb98ebfb4fe24943416fb78779be5d8b5bc41690a5f667afa3472e080eae25e"
    end
    on_intel do
        url "https://github.com/brotherbui/public/releases/download/fshare/fshare-intel.tgz"
        sha256 "f595942db202e179e2732a6c91bf0e1579dfe7008a3dae65dbb887060db574df"
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
