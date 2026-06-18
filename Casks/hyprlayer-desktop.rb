cask "hyprlayer-desktop" do
  version "0.1.3"
  sha256 "1d44d55c94ddcdc54db167f6101743cc3275f1dc8cdd98876b3617a93dcf5e30"

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
