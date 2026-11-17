cask "hyprlayer-desktop" do
  version "0.8.24"
  sha256 "438f55f2f180bdfbc28a54dddeced721542ea74e27a90e78c305ebc8c6db4ac0"

  url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
