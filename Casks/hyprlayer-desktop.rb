cask "hyprlayer-desktop" do
  version "0.2.2"
  sha256 "baef8c1021844bded8bb97cc3037161f7b46fdf629fbf30823311fda3153b887"

  url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/v#{version}/Hyprlayer_#{version}_aarch64.dmg"
  name "Hyprlayer"
  desc "Native desktop app for spec-driven development"
  homepage "https://brightblock.ai/hyprlayer/"

  # The app ships its own signed in-app updater (Tauri), so Homebrew shouldn't
  # treat a self-updated copy as outdated.
  auto_updates true

  app "Hyprlayer.app"

  caveats <<~CAVEATS
    Hyprlayer is not yet notarized by Apple, so on first launch macOS may block
    it with "Apple cannot check it for malicious software." To allow it:

      xattr -dr com.apple.quarantine "/Applications/Hyprlayer.app"

    or install without quarantine up front:

      brew install --cask --no-quarantine hyprlayer-desktop
  CAVEATS
end
