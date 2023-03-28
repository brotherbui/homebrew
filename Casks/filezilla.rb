cask "filezilla" do
  version "3.63.0"
  sha256 :no_check # required as upstream package is updated in-place

  url "https://dl3.cdn.filezilla-project.org/client/FileZilla_3.63.2.1_macosx-x86.app.tar.bz2?h=Yw2zkgIhxdCb0Bt4Kbq53w&x=1680050447"
  name "FileZilla"
  desc "FileZilla®, the free FTP solution"
  homepage "https://filezilla-project.org"

  auto_updates true

  app "FileZilla.app"

  zap trash: [
    "~/Library/Application Support/FileZilla",
  ]
end