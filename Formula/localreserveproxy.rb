class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.9"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.9.zip"
  sha256 "dafea20ceda422748e758b91f5ab9fe8334974bac8b9800cab9386fed2f4ffa8"

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
