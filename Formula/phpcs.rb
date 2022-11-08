class Phpcs < Formula
  version "latest"
  desc "PHP CodeSniffer"
  homepage "https://github.com/squizlabs/PHP_CodeSniffer"
  url "https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar"
  #sha256 :no_check # required as upstream package is updated in-place
  license "MIT"


  def install
    bin.install "phpcs.phar" => "phpcs"
  end
end