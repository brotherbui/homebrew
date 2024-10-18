class Localproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.2"
  url "https://github.com/brotherbui/public/raw/main/localproxy-1.0.2.zip"
  sha256 "46334552d6abd3af4d287fd712b0b2d6055cdc5700a238c2f136a9ca3405a40e"

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
