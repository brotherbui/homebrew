class Gdrive < Formula
  desc "Gdrive utility"
  homepage "https://drive.google.com/"
  if Hardware::CPU.arm?
    url "https://phongblack.me/homebrew/gdrive.tar.gz"
  else
    url "https://github.com/glotlabs/gdrive/releases/download/3.9.0/gdrive_macos-x64.tar.gz"
  end

  
  #sha256 :no_check
  version "3.9.0"

  def install
    bin.install "./gdrive"
  
  end

end

