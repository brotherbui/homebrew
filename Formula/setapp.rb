class Setapp < Formula
  desc "Overkill Setapp Subscribe Utility"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.0"
  url "https://github.com/brotherbui/public/raw/main/setapp.zip"
  sha256 "e0eec9eddaadf6a8b61b404bd3b5bfcf1343ec76add74c47e0f4f6be90a0ed17"


  def install
    bin.install "./setapp"
  end
end