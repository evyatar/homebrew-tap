cask "quick-json-viewer" do
  version "1.0.0"
  sha256 "705c29af4b6cf68029877966e0247676ac2ab85c51991a2303cb5dff840ab35d"

  url "https://github.com/evyatar/quick-json-viewer/releases/download/v#{version}/quick-json-viewer-v#{version}.zip"
  name "Quick JSON Viewer"
  desc "Fast, native macOS JSON viewer"
  homepage "https://github.com/evyatar/quick-json-viewer"

  app "quick-json-viewer.app"

  zap trash: [
    "~/Library/Application Support/com.evyatar.quick-json-viewer",
    "~/Library/Preferences/com.evyatar.quick-json-viewer.plist",
  ]
end
