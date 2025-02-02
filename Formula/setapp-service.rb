class SetappService < Formula
  desc "Overkill Setapp Subscribe Utility. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  version "1.0.1"
  url "https://github.com/brotherbui/public/releases/download/setapp-service/setapp-service.txz"
  sha256 "5bc42aa7d084b6d3a9f3ce1c927d80f67026f08009109e5000d0f4b8f173a28a"

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
