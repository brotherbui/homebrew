class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.21.1"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/v0.21.1/ord-0.21.1-macos.tgz"
      sha256 "8d8738e5258ab072837bcec481cc21b89caa74b9b9649a8e9d88b4c3d1601b68"
    end
    on_intel do
      url "https://github.com/brotherbui/public/releases/download/v0.21.1/ord-0.21.1-macos.tgz"
      sha256 "8d8738e5258ab072837bcec481cc21b89caa74b9b9649a8e9d88b4c3d1601b68"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brotherbui/public/releases/download/v0.21.1/ord-0.21.1-linux.tgz"
      sha256 "9e752a44057a3635151fbfe44a0fa874d8f67f9630e36ba806830158bdfc3c58"
    elsif Hardware::CPU.arm?
      url "https://github.com/brotherbui/public/releases/download/v0.21.1/ord-0.21.1-linux.tgz"
      sha256 "9e752a44057a3635151fbfe44a0fa874d8f67f9630e36ba806830158bdfc3c58"
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
