class ComposerAT22 < Formula
  desc "Dependency Manager for PHP 7"
  homepage "https://getcomposer.org/"
  url "https://getcomposer.org/download/2.2.18/composer.phar"
  license "MIT"

  def install
    bin.install "composer.phar" => "composer@2.2"
  end


end
