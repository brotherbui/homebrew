class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.22.0"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0.txz"
      sha256 "bae03108ca154035ba8a26e14c9c0e4ba0e7f1d53cc65f109d16033bd596bc00"
    end
    on_intel do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0.txz"
      sha256 "bae03108ca154035ba8a26e14c9c0e4ba0e7f1d53cc65f109d16033bd596bc00"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0-linux.txz"
      sha256 "25d0baab0c3043ca249fc2b87eb79f223ae2fdf87fb892eeaae8bb0eeba812d5"
    elsif Hardware::CPU.arm?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0-linux.txz"
      sha256 "25d0baab0c3043ca249fc2b87eb79f223ae2fdf87fb892eeaae8bb0eeba812d5"
    end
  end


  def install
    bin.install "ord" => "ordx"
  end

  test do
    output = shell_output("#{bin}/ordx list xx:xx 2>&1", 2)
    assert_match "invalid value 'xx:xx' for '<OUTPOINT>': error parsing TXID", output

    assert_match "ordx #{version}", shell_output("#{bin}/ordx --version")
  end
end
