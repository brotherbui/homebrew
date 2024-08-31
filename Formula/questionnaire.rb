class Questionnaire < Formula
  desc "Questionnaire Generator. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.1.3"
  url "https://github.com/brotherbui/public/raw/main/questionnaire.xz"
  sha256 "91b3de408513ad645b3f1c8253341955f20a88d2d2d1035601f5a699a5ec9f05"
  

  def install
    bin.install "./questionnaire"
  end

end