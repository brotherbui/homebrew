class SetappService < Formula
  desc "Overkill Setapp Subscribe Utility. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  version "1.0.2"
  url "https://github.com/brotherbui/public/releases/download/setapp-service/setapp-service-1.0.2.txz"
  sha256 "1ad429e4df05540f7234a3e87f98f004473588de61a8a8b70070aa8da4532529"

  def install
    # Install binary to Homebrew's bin directory
    bin.install "setapp-service"

    # Set executable permissions explicitly
    # chmod 0755, bin/"setapp-service"

    # Create directories with proper ownership
    (var/"log/setapp-service").mkpath
    (var/"setapp-service").mkpath

    # Ensure write permissions for logs
    # chmod 0777, var/"log/setapp-service"
  end

  service do
    run [opt_bin/"setapp-service"]

    # Configuration
    keep_alive false
    run_type :interval
    interval 3600
    working_dir HOMEBREW_PREFIX
    environment_variables HOMEBREW_PREFIX: HOMEBREW_PREFIX

    # Log paths
    log_path var/"log/setapp-service/service.log"
    error_log_path var/"log/setapp-service/error.log"


    # Uncomment for system-wide root execution (if needed)
    # require_root: true
  end
end
