class Setapp < Formula
  desc "Overkill Setapp Subscribe Utility. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.3"
  url "https://github.com/brotherbui/public/raw/main/setapp.zip"
  sha256 "6f7fde51c28f54224d66935adfdf590622b2d577416e5e3d67d2252274e1f9a8"


  def install
    bin.install "./sapp"
  end
end