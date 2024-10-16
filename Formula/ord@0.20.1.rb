class OrdAT0201 < Formula
  desc "Index, block explorer, and command-line wallet"
  homepage "https://ordinals.com/"
  url "https://github.com/ordinals/ord/releases/download/0.20.1/ord-0.20.1-aarch64-apple-darwin.tar.gz"
  sha256 "5b4a2c1fac21281fa8ebd563c6b00403ba169045d2fd3b80226dc1788cddc115"
  license "CC0-1.0"
  version "0.20.1"

  def install
    bin.install "ord" => "ord20"
  end

  test do
    output = shell_output("#{bin}/ord20 list xx:xx 2>&1", 2)
    assert_match "invalid value 'xx:xx' for '<OUTPOINT>': error parsing TXID", output

    assert_match "ord20 #{version}", shell_output("#{bin}/ord20 --version")
  end
end
