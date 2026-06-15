cask "quick-json-viewer" do
  version "1.0.4"
  sha256 "dc8821145afa6356b1f12b2b92ad426e0d30e27e2d90b23ff476a6ef6cb3946e"

  url "https://github.com/evyatar/quick-json-viewer/releases/download/v#{version}/quick-json-viewer-v#{version}.zip"
  name "Quick JSON Viewer"
  desc "Fast, native macOS JSON viewer"
  homepage "https://github.com/evyatar/quick-json-viewer"

  app "quick-json-viewer.app", target: "Quick JSON Viewer.app"

  postflight do
    # 1. Strip the quarantine attribute
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Quick JSON Viewer.app"],
                   sudo: false

    # 2. Force an Ad-Hoc code-signature
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/Quick JSON Viewer.app"],
                   sudo: false
  end
  
  zap trash: [
    "~/Library/Application Support/com.evyatar.quick-json-viewer",
    "~/Library/Preferences/com.evyatar.quick-json-viewer.plist",
  ]
end
