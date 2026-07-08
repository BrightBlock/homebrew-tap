cask "hyprlayer-desktop" do
  version "0.4.19"
  sha256 "2f64f1e2f4bf3911183e0e3dba7bfa5048a2f4f5a7675aa1de4890de0bcf20f1"

  url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
