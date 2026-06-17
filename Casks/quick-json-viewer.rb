cask "quick-json-viewer" do
  version "1.0.5"
  sha256 "36b12a51db5fca7f518e61755fb110a90e6d753c8182215589f0e6a1e06286bb"

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
