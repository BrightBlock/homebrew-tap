cask "hyprlayer-desktop" do
  version "0.9.1"
  sha256 "16f640e1d30212681a4d7c857793a523b0a1fc86239712cedcfb405b2cfc60d1"

  url "https://github.com/BrightBlock/hyprlayer-app/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
