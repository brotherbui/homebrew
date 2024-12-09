class Sapp < Formula
  desc "Overkill Setapp Subscribe Utility. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.3"

  on_macos do
    on_arm do
        url "https://github.com/brotherbui/public/releases/download/setapp/sapp.tgz"
        sha256 "dbecfbbf5c08f3ba2eabc02dd30e90bce418687972f11f9e92da2f7dd5cb889e"
    end
    on_intel do
        url "https://github.com/brotherbui/public/releases/download/setapp/sapp-intel.tgz"
        sha256 "ed9e04e6a807d10b6c7e57956a986a932bc94b61fced7a911f3154ad7145ad30"
    end
  end

  def install
    bin.install "./sapp"
  end
end
