cask "hyprlayer-desktop" do
  version "0.8.20"
  sha256 "f96a64a64d490a6ff13ebb8f1984aee7c301f851bda5b11512d578321e010622"

  url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
