class SetappService < Formula
  desc "Overkill Setapp Subscribe Utility. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  version "1.0.0"
  url "https://github.com/brotherbui/public/releases/download/setapp-service/setapp-service.txz"
  sha256 "5f103613b54c593c4c79d760cdf38222eace3d296fefaa41b39fe193edce68c5"

  def install
    bin.install "setapp-service"

    # Create required directories
    (var/"log/setapp-service").mkpath
    (var/"setapp-service").mkpath
  end

  service do
    run [opt_bin/"setapp-service"]
    keep_alive false
    interval 3600 # Run every hour
    log_path var/"log/setapp-service/service.log"
    error_log_path var/"log/setapp-service/error.log"
    working_dir HOMEBREW_PREFIX
    environment_variables HOMEBREW_PREFIX: HOMEBREW_PREFIX
  end
end
