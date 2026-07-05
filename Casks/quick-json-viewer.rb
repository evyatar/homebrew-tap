cask "quick-json-viewer" do
  version "1.0.12"
  sha256 "16881d87f537989e0c80b54724170b325777dc115f6fa9053f36fea8b7f857a3"

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
