class Aws < Formula
  desc "AWS Command Line Interface"
  homepage "https://aws.amazon.com/cli/"
  url "https://awscli.amazonaws.com/awscli.tar.gz"
  version "2.17.56"

  bottle do
    root_url "https://github.com/brotherbui/homebrew/releases/download/aws-v2.17.56"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "459cd0daf5c9b42394f6a3bf8db766d60a62fac94fe04d8f43c4a3d1524fea65"
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
