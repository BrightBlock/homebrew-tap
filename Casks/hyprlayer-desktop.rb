cask "hyprlayer-desktop" do
  version "0.8.12"
  sha256 "265863a71b0bcb3254ad8c3dcd717badd9bbe355f0b9969c2d93f5bf4f9d7d25"

  url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
