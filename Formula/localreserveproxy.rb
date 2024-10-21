class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.7"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.7.zip"
  sha256 "4dcafdc63271d7df16cf48309e06c668eeb95f9717e7f80f923bfe005e6b8608"

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
