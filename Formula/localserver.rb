class Localserver < Formula
  desc "Overkill local server to act as proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.0"
  url "https://github.com/brotherbui/public/raw/main/localserver.zip"
  sha256 "b2cffea43d670eaeba16956958abf881c3115fddc7263b73505c5ba8eb64fb55"

  def install
    bin.install "./localserver"
  end

  service do
    run [opt_bin/"localserver"]
    keep_alive true
    log_path var/"log/localserver.log"
    error_log_path var/"log/localserver.error.log"
  end
end
