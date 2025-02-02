class SetappService < Formula
  desc "Overkill Setapp Subscribe Utility. From Phong Black with 🍑🍌🍑"
  homepage "https://phongblack.me"
  version "1.0.0"
  url "https://github.com/brotherbui/public/releases/download/setapp-service/setapp-service.txz"
  sha256 "5f103613b54c593c4c79d760cdf38222eace3d296fefaa41b39fe193edce68c5"

  def install
    # Install binary to Homebrew's bin directory
    bin.install "setapp-service"

    # Set executable permissions explicitly
    chmod 0755, bin/"setapp-service"

    # Create directories with proper ownership
    (var/"log/setapp-service").mkpath
    (var/"setapp-service").mkpath

    # Ensure write permissions for logs
    chmod 0777, var/"log/setapp-service"
  end

  service do
    run [opt_bin/"setapp-service"]  # Use opt_bin instead of bin (critical fix)

    # Configuration
    keep_alive false
    interval 3600  # Translates to StartInterval=3600 in plist
    working_dir var/"setapp-service"  # Safer than HOMEBREW_PREFIX

    # Log paths
    log_path var/"log/setapp-service/service.log"
    error_log_path var/"log/setapp-service/error.log"

    # Environment
    environment_variables PATH: "#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin",
                          HOMEBREW_PREFIX: HOMEBREW_PREFIX.to_s

    # Uncomment for system-wide root execution (if needed)
    # require_root: true
  end
end
