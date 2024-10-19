class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.1"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.1.zip"
  sha256 "2d506890e32c41ff69d7db37a53d9ba1b20fe8823c29f0a9b5dd32133c27c63a"

  def install
    bin.install "./localreserveproxy"
  end

  service do
    run [bin/"localreserveproxy"]
    keep_alive true
    log_path var/"log/localreserveproxy.log"
    error_log_path var/"log/localreserveproxy.error.log"
    run_type :immediate
  end
end
