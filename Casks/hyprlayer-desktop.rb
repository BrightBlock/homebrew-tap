cask "hyprlayer-desktop" do
  version "0.3.16"
  sha256 "5120e879d79cb7840f1e60c192f19e124b0a3b92231f3afa8fba6164c56359ee"

  url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
