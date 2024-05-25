cask "medium" do
  version "1.1.68"
  sha256 "848e1f7f7ec8e9cb61c5bf42f7950b29a977e6125f710cd504e434c38e067fe1"

  url "https://github.com/brotherbui/public/raw/main/medium-readable.zip"
  name "Medium Readable"
  desc "Medium Memeber-only Unlocker"
  homepage "https://phongblack.me"

  auto_updates true

  app "Medium Readable.app"

  zap trash: [
    "~/Library/Application Support/Medium Readable",
  ]
end