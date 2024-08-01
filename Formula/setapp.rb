class Setapp < Formula
  desc "Overkill Setapp Subscribe Utility"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.0"
  url "https://github.com/brotherbui/public/raw/main/setapp.zip"
  sha256 "72441641d926d87d314c75b6ba42357627372d2538baefbbb03efef521e28188"
  


  def install
    bin.install "./setapp"
  end

  service do
    [opt_bin/"setapp"]
    keep_alive true
    log_path var/"log/setapp.log"
    error_log_path var/"log/setapp.log"
  end
end