class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.3"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.4.zip"
  sha256 "1b77f89f9cd0bf3afd577163e7fcdb83c2a9e5e01a484d4ce4bf2755a4fd60c8"

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
