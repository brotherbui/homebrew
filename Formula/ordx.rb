class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.22.0"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0.tgz"
      sha256 "74141f8a7ed00be8f0834bfb51b81a1b1714c3e2d8d702126bfac90dad86f3e0"
    end
    on_intel do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0.tgz"
      sha256 "74141f8a7ed00be8f0834bfb51b81a1b1714c3e2d8d702126bfac90dad86f3e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0-linux.tgz"
      sha256 "15ba63746fe466e2da9f322cca3cf528bd38e7e13de630c08d6cc5b203168167"
    elsif Hardware::CPU.arm?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.0-linux.tgz"
      sha256 "15ba63746fe466e2da9f322cca3cf528bd38e7e13de630c08d6cc5b203168167"
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
