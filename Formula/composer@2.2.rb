class ComposerAT22 < Formula
  desc "Dependency Manager for PHP 7"
  homepage "https://getcomposer.org/"
  url "https://getcomposer.org/download/2.2.18/composer.phar"
  sha256 "28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
  license "MIT"

  livecheck do
    url "https://getcomposer.org/download/"
    regex(%r{href=.*?/v?2\.2\.(\d+(?:\.\d+)+)/composer\.phar}i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
    sha256 cellar: :any_skip_relocation, ventura:        "28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
    sha256 cellar: :any_skip_relocation, monterey:       "28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
    sha256 cellar: :any_skip_relocation, big_sur:        "28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "28a8d9740d615137a8c01d32aef9184db16f543fca36db038501a294d8e95b24"
  end

  depends_on "php@7.4"

  # Keg-relocation breaks the formula when it replaces `/usr/local` with a non-default prefix
  on_macos do
    on_intel do
      pour_bottle? only_if: :default_prefix
    end
  end

  def install
    bin.install "composer.phar" => "composer@2.2"
  end


end
