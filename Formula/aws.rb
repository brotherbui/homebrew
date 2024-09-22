class Aws < Formula
  desc "AWS Command Line Interface"
  homepage "https://aws.amazon.com/cli/"
  url "https://awscli.amazonaws.com/awscli.tar.gz"
  version "2.7.56"

  bottle do
    root_url "https://github.com/brotherbui/homebrew/releases/download/v2.7.56"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5c4615a93a27d76df9d73dc9d813dcff1c826ca6ffa5de4f4bc07d424d2ebe8c"
  end
  
  def install
    system "./configure", "--with-download-deps",
                          "--with-install-type=portable-exe",
                          "--prefix=#{prefix}",
                          "--libdir=#{lib}",
                          "--bindir=#{bin}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/aws", "--version"
  end
end
