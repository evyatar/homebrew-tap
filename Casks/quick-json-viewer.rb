cask "quick-json-viewer" do
  version "1.2.2"
  sha256 "57105e7386e93b807e1efa743af0bc6c7160b5826cc2a425ca3e74e5ec2c4863"

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
