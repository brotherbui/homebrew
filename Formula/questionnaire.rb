class Questionnaire < Formula
  desc "Questionnaire Generator. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.1.3"
  url "https://github.com/brotherbui/public/raw/main/questionnaire.xz"
  sha256 "e9bc45ca230027ebc7cd57c0f090dd89609f4c22a7e3ba22f6cbe20a5b55794d"
  

  def install
    bin.install "./questionnaire"
  end

end