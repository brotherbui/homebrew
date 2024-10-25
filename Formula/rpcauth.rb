class Rpcauth < Formula
  desc "Bitcoin RPC auth generation. From Phong Black with 🍑🍌🍑 "
  homepage "https://phongblack.me/"
  license "CC0-1.0"
  version "1.0.0"

  on_macos do
    url "https://github.com/brotherbui/public/releases/download/rpcauth/rpcauth-1.0.0-macos.tgz"
    sha256 "7d8ee5d50a8114d193c0ffa8324e9b1ea285f1d433c0b8f23f8885327e4ca693"

  end

  on_linux do
    url "https://github.com/brotherbui/public/releases/download/rpcauth/rpcauth-1.0.0-linux.tgz"
    sha256 "9c1a046a6c6d1397652e390e42307195b90ccd0b972cbef44de4d0232c9e89b0"
  end

  def install
    bin.install "./rpcauth"
  end

end
