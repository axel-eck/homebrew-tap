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

  zap trash: [
    "~/Library/Preferences/com.luccasoftware.Jayson.plist",
    "~/Library/Saved Application State/com.luccasoftware.Jayson.savedState",
  ]

  caveats <<~EOS
    Jayson is not notarized with an Apple Developer ID yet, so Gatekeeper will
    refuse to open it the first time. Either remove the quarantine flag:

      xattr -dr com.apple.quarantine "#{appdir}/Jayson.app"

    or right-click Jayson.app in #{appdir} and choose Open once.
  EOS
end
