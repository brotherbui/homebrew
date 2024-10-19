class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.0"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.0.zip"
  sha256 "cb5ddef58e18e7c1eece44dffbe7ce8b1ff147193328268f1ca675850be184e5"

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
