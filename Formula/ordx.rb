class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.22.1"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.1.txz"
      sha256 "4a324617252d84da5baa426979ee0d726848bb0b355c9145871f75f7b581c11e"
    end
    on_intel do
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.1.txz"
      sha256 "4a324617252d84da5baa426979ee0d726848bb0b355c9145871f75f7b581c11e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.1-linux.txz"
      sha256 "4434ca8e8e13e5f4a701466a70b13049a71be0a790ac21843b7e0a36f61541d3"
    elsif Hardware::CPU.arm?
      url "https://github.com/brotherbui/public/releases/download/ord/ordx-0.22.1-linux.txz"
      sha256 "4434ca8e8e13e5f4a701466a70b13049a71be0a790ac21843b7e0a36f61541d3"
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
