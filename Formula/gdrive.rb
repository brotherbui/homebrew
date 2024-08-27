class Gdrive < Formula
  desc "Google Drive CLI Client"
  homepage "https://github.com/glotlabs/gdrive"
  url "https://github.com/brotherbui/public/raw/main/gdrive.zip"
  sha256 "e0ee80cb260e95ac88279470cde9c0d41a588acbf98b524652eaa2a14778c82a"
  license "MIT"
  head "https://github.com/glotlabs/gdrive.git", branch: "main"

  def install
    bin.install "./gdrive"
  end

 
end
