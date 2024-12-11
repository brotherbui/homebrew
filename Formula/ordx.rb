class Ordx < Formula
  desc "Index, block explorer, and command-line wallet. From Phong Black with 🍑🍌🍑 "
  homepage "https://ordinals.com/"
  license "CC0-1.0"
  version "0.22.0"

  on_macos do
    on_arm do
      url "https://github.com/brotherbui/public/releases/download/ord/ord.tgz"
      sha256 "3305fe98b3aaa8c0072d1e9b4a01c3097c147217332341994ef3b0bbf15ca12a"
    end
    on_intel do
      url "https://github.com/brotherbui/public/releases/download/ord/ord.tgz"
      sha256 "3305fe98b3aaa8c0072d1e9b4a01c3097c147217332341994ef3b0bbf15ca12a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/brotherbui/public/releases/download/ord/ord-linux.tgz"
      sha256 "28be1a3481208fab02891dfa4b9ba263e9828a4432f2173286b7e6b443d1f82e"
    elsif Hardware::CPU.arm?
      url "https://github.com/brotherbui/public/releases/download/ord/ord-linux.tgz"
      sha256 "28be1a3481208fab02891dfa4b9ba263e9828a4432f2173286b7e6b443d1f82e"
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
