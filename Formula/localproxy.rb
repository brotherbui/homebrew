class Localproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.0"
  url "https://github.com/brotherbui/public/raw/main/localproxy.zip"
  sha256 "00639885f274a00e42323327aac34ef780fe3b798463ac2fccf683b0f9d31c71"

  def install
    bin.install "./localproxy"
  end

  service do
    run [bin/"localproxy"]
    keep_alive true
    log_path var/"log/localproxy.log"
    error_log_path var/"log/localproxy.error.log"
    run_type :immediate
  end
end
