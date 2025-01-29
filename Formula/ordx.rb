class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.22.2"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/ord/ord-0.22.2.txz"
      sha256 "13e412fc9eef1ab0d248f545f9886943ce00d2aeca99705ca9a06d5cc2e658c1"
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
