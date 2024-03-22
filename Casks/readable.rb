cask "readable" do
  version "1.1.68"
  sha256 "603e1437a53774dc0cce92ad264cea4240720b9b22a1efd8a2a4db3722551264"

  url "https://phongblack.me/media/Readable.zip"
  name "Readable"
  desc "Medium Unlock"
  homepage "https://chromewebstore.google.com/detail/readable/babnnfmbjokkeieobamoifmeapbbfhje"

  auto_updates true

  app "Readable.app"

  zap trash: [
    "~/Library/Application Support/Readable",
  ]
end