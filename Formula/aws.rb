class Aws < Formula
  desc "AWS Command Line Interface"
  homepage "https://aws.amazon.com/cli/"
  url "https://awscli.amazonaws.com/awscli.tar.gz"
  

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
