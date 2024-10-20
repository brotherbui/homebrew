class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.3"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.3.zip"
  sha256 "0c6182134409b921981231396421d7620d9338e350646ea740c69615a6386e67"

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
