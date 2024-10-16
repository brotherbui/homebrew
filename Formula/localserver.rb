class Localserver < Formula
  desc "Overkill local server to act as proxy"
  homepage "https://phongblack.me"
  license "EPL-2.0"
  version "1.0.0"
  url "https://github.com/brotherbui/public/raw/main/localserver.zip"
  sha256 "7e4f93ef3dd07453406837df370e3e707721b409b3d63fa8305da1899ae78a15"

  def install
    bin.install "./localserver"
  end

  service do
    run [bin/"localserver"]
    keep_alive true
    log_path var/"log/localserver.log"
    error_log_path var/"log/localserver.error.log"
  end
end
