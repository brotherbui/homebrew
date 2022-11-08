class Magerun2 < Formula
  version "latest"
  desc "Magerun2"
  homepage "https://magerun.net"
  url "https://files.magerun.net/n98-magerun2.phar"
  #sha256 :no_check # required as upstream package is updated in-place
  license "Apache"


  def install
    bin.install "n98-magerun2.phar" => "magerun2"
  end
end