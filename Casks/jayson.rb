cask "jayson" do
  version "0.3.0"
  sha256 "21319f1b10053607427a898314538456952ee6a90f1d73a34a29868000c33dba"

  url "https://github.com/axel-eck/jayson/releases/download/v#{version}/Jayson-#{version}.zip"
  name "Jayson"
  desc "JSON viewer and editor with JSONPath search and JSON Schema validation"
  homepage "https://github.com/axel-eck/jayson"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Jayson.app"

  # Not notarized: drop the quarantine flag so the app opens without a right-click > Open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Jayson.app"]
  end

  zap trash: [
    "~/Library/Preferences/fr.axel-eck.Jayson.plist",
    "~/Library/Saved Application State/fr.axel-eck.Jayson.savedState",
  ]
end
