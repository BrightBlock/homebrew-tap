cask "hyprlayer-desktop" do
  version "0.9.0"
  sha256 "08105293eebcd5917c88fb1c2a905f720ed2fc9f1c5113ba4bbf1527b905e16a"

  url "https://github.com/BrightBlock/hyprlayer-app/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
