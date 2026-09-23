cask "jayson" do
  version "0.1.0"
  sha256 "b58fcdc1324f5a2fd775e0f15303d097ad854e9ee5a63bab99909f4ac2b943ef"

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
    "~/Library/Preferences/com.luccasoftware.Jayson.plist",
    "~/Library/Saved Application State/com.luccasoftware.Jayson.savedState",
  ]
end
