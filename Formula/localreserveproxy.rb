class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.8"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.8.zip"
  sha256 "c266d12b6233921593ad5fa34657310342c9acc165a192ff1d683189235f56cf"

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
