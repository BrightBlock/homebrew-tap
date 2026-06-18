cask "hyprlayer-desktop" do
  version "0.1.6"
  sha256 "d3731eb7eb8bca8656e7c468b310f5e99cb43bea80fa63a08406a3f9f2a36283"

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
