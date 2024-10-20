class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.2"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.2.zip"
  sha256 "1c6d04ea11e0a93e7c8085874af28aaf4b1ae5acc332550772e3dfcfc9201843"

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
