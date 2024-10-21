class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.5"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.5.zip"
  sha256 "579ccbd74a7501c9f06ad094988c4b2ffc4d35e50ef14cd13a134bf3f5c5f31c"

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
