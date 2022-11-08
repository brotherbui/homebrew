class Magerun < Formula
  desc "Magerun"
  homepage "https://magerun.net"
  url "https://files.magerun.net/n98-magerun.phar"
  sha256 :no_check # required as upstream package is updated in-place
  license "MIT"


  def install
    bin.install "n98-magerun.phar" => "magerun"
  end
end