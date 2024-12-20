class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.22.0"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0.tgz"
      sha256 "fe29a7648431a03f2fe056b80ee62e3acac15a953c6b8bfd52da0acc59431139"
    end
    on_intel do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0.tgz"
      sha256 "fe29a7648431a03f2fe056b80ee62e3acac15a953c6b8bfd52da0acc59431139"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0-linux.tgz"
      sha256 "a6e7b74838d5c3c209259ff5e8b478f1ef1fb4007731a4d88e3fb917da82f2b8"
    elsif Hardware::CPU.arm?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0-linux.tgz"
      sha256 "a6e7b74838d5c3c209259ff5e8b478f1ef1fb4007731a4d88e3fb917da82f2b8"
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
