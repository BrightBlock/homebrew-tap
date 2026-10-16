cask "hyprlayer-desktop" do
  version "0.8.15"
  sha256 "9fc44d2d193bcc5e682bf46f47af84d6fe39d81b5a8a7ffe7c9cd0e5745577c2"

  url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
