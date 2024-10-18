class Localproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.1"
  url "https://github.com/brotherbui/public/raw/main/localproxy.zip"
  sha256 "e40f579a94af68c24e502d44d0499e59cfe6a9a955aad275aa2c79e98253244c"

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
