class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.21.1"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/v0.21.1/ord-0.21.1-macos.tgz"
      sha256 "8e82a8c371ba3154e301efec6ce69a00ab073cea44846c60123090fd40c219ac"
    end
    on_intel do
      url "https://github.com/brotherbui/public/releases/download/v0.21.1/ord-0.21.1-macos.tgz"
      sha256 "8e82a8c371ba3154e301efec6ce69a00ab073cea44846c60123090fd40c219ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brotherbui/public/releases/download/v0.21.1/ord-0.21.1-linux.tgz"
      sha256 "edb59052db694510e00c88b2939efb36a8c5d0f5e2debd30183ce3e0599441fd"
    elsif Hardware::CPU.arm?
      url "https://github.com/brotherbui/public/releases/download/v0.21.1/ord-0.21.1-linux.tgz"
      sha256 "edb59052db694510e00c88b2939efb36a8c5d0f5e2debd30183ce3e0599441fd"
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
