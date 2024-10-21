class Localreserveproxy < Formula
  desc "Overkill local reserve proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.6"
  url "https://github.com/brotherbui/public/raw/main/localreserveproxy-1.0.6.zip"
  sha256 "3fb2262f54a9234073d7373fe73464b343e826659ef9533aa1cf6a3aa5b814ea"

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
