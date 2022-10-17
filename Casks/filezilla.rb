cask "filezilla" do
  version "3.61.0"
  sha256 :no_check # required as upstream package is updated in-place

  url "https://dl2.cdn.filezilla-project.org/client/FileZilla_#{version}_macosx-x86.app.tar.bz2?h=IItpPhL-eAnVAjMfFUK9_g&x=1666001729"
  name "FileZilla"
  desc "FileZilla®, the free FTP solution"
  homepage "https://filezilla-project.org"

  auto_updates true

  app "FileZilla.app"

  zap trash: [
    "~/Library/Application Support/FileZilla",
  ]
end