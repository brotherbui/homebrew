class Setapp < Formula
  desc "Overkill Setapp Subscribe Utility. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.2"
  url "https://github.com/brotherbui/public/raw/main/sapp.zip"
  sha256 "06adfe54af572acbe6dae220ccfc49812a7de5b963bb0d6cec777760a542a76c"


  def install
    bin.install "./sapp"
  end
end