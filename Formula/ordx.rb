class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.21.2"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.21.2-macos.tgz"
      sha256 "256618a879ffa46865037d875324e707965b791ee6c3b459bd9c0df7693f977f"
    end
    on_intel do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.21.2-macos.tgz"
      sha256 "256618a879ffa46865037d875324e707965b791ee6c3b459bd9c0df7693f977f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.21.2-linux.tgz"
      sha256 "9932a240d0e242252615f531cfc76aa7ae1cf892454ebfa1ed32387926f0ad4b"
    elsif Hardware::CPU.arm?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.21.2-linux.tgz"
      sha256 "9932a240d0e242252615f531cfc76aa7ae1cf892454ebfa1ed32387926f0ad4b"
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
