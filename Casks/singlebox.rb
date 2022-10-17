cask "singlebox" do
  version "26.2.2"
  sha256 :no_check # required as upstream package is updated in-place

  url "https://cdn-2.webcatalog.io/singlebox/Singlebox-#{version}-universal.dmg"
  name "Singlebox"
  desc "All-in-one messenger"
  homepage "https://singlebox.app/downloads/macos/"

  auto_updates true

  app "Singlebox.app"

  zap trash: [
    "~/Library/Application Support/Singlebox",
  ]
end