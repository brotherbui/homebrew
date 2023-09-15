cask "filezilla" do
  version "3.65.0"
  sha256 :no_check # required as upstream package is updated in-place

  url "https://dl2.cdn.filezilla-project.org/client/FileZilla_3.65.0_macosx-x86.app.tar.bz2?h=7tupcvMHfl3903M6QLZljg&x=1694762294"
  name "FileZilla"
  desc "FileZilla®, the free FTP solution"
  homepage "https://filezilla-project.org"

  auto_updates true

  app "FileZilla.app"

  zap trash: [
    "~/Library/Application Support/FileZilla",
  ]
end