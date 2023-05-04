class Unrar < Formula
  desc "Extract, view, and test RAR archives"
  homepage "https://www.rarlab.com/"
  if Hardware::CPU.arm?
    url "https://www.rarlab.com/rar/rarmacos-arm-621.tar.gz"
  else
    url "https://www.rarlab.com/rar/rarmacos-x64-621.tar.gz"
  end

  
  #sha256 :no_check
  version "2.1.0"

  def install
    bin.install "./unrar"
  
  end

end

