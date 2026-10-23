cask "hyprlayer-desktop" do
  version "0.8.16"
  sha256 "c6630f93d0ab16467774ea7f22c28edc1caa801dd7d50ad99f61f2452d8f6849"

  url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"
end
