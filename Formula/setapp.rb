class Setapp < Formula
  desc "Overkill Setapp Subscribe Utility"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.1"
  url "https://github.com/brotherbui/public/raw/main/setapp.zip"
  sha256 "7f6b50dfe11992d1d6ab83cef3db6136abe44285141a496344202f2b3ddb7eb1"


  def install
    bin.install "./setapp"
  end
end