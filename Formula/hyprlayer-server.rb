# Formula, not a cask: this is a CLI-shaped binary, not an .app bundle.
# Lives in BrightBlock/homebrew-tap. The version, both sha256 values and the
# launchd plist body are substituted by scripts/release-local.sh, which takes
# the plist from packaging/launchd/ so the two can never drift. Placeholders
# are spelled only where they are substituted, never in prose -- a mention in
# a comment would be rewritten too.
# ASCII only: Tailwind v4's oxide Ruby pre-processor aborts on a non-ASCII .rb.
class HyprlayerServer < Formula
  desc "Hyprlayer runtime as a headless server, reached over a local socket or SSH"
  homepage "https://brightblock.ai/hyprlayer"
  version "0.8.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/server-v#{version}/hyprlayer-server-aarch64-apple-darwin"
      sha256 "53ccdd6dbec3e1174a2a5042442ebdb8b053527ad11f99c3f5f219a2a979d068"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-releases/releases/download/server-v#{version}/hyprlayer-server-x86_64-unknown-linux-gnu"
      sha256 "8af4c7a2b83ba430fce03a6acce56b97759963ad7838cd2a09a6967d8244146b"
    end
  end

  AGENT_PLIST = <<~PLIST
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>ai.brightblock.hyprlayer.server</string>

      <!-- @BIN@ is the absolute path to hyprlayer-server. There is no correct
           default (/opt/homebrew/bin, /usr/local/bin and /usr/bin are all real
           install prefixes), so the consumer substitutes it: the Homebrew formula
           renders it at install time, and a hand install edits it. -->

      <!-- A LaunchAgent in ~/Library/LaunchAgents, never a LaunchDaemon: the
           relocated Keychain lookup shells `security find-generic-password`, which
           needs an unlocked login keychain that only a user session has (ADR-0009). -->
      <key>ProgramArguments</key>
      <array>
        <string>@BIN@</string>
        <string>serve</string>
      </array>

      <!-- Restart on a crash, but let `hyprlayer-server stop` stay stopped --
           the launchd equivalent of Restart=on-failure. -->
      <key>KeepAlive</key>
      <dict>
        <key>SuccessfulExit</key>
        <false/>
      </dict>

      <key>RunAtLoad</key>
      <false/>

      <key>StandardOutPath</key>
      <string>/tmp/hyprlayer-server.out.log</string>
      <key>StandardErrorPath</key>
      <string>/tmp/hyprlayer-server.err.log</string>
    </dict>
    </plist>
  PLIST

  def install
    bin.install Dir["hyprlayer-server-*"].first => "hyprlayer-server"
    # Placed, never loaded. The caveats tell the user how, because installing
    # must not start a server: one server owns the profile, and the desktop
    # starts its own.
    # OS.mac?, not an on_macos block: that DSL is class-level only.
    if OS.mac?
      (prefix/"ai.brightblock.hyprlayer.server.plist")
        .write(AGENT_PLIST.gsub("@BIN@", (opt_bin/"hyprlayer-server").to_s))
    end
  end

  # Deliberately no `service` block. ADR-0009 requires a LaunchAgent in the
  # user's session -- `security find-generic-password` needs an unlocked login
  # keychain, which a brew-managed daemon does not have.
  def caveats
    <<~EOS
      hyprlayer-server is installed but not running, by design.

      Run it directly:
        hyprlayer-server serve

      Or load it as a user agent (never a LaunchDaemon -- the Keychain lookup
      needs an unlocked login keychain):
        cp #{opt_prefix}/ai.brightblock.hyprlayer.server.plist ~/Library/LaunchAgents/
        launchctl load ~/Library/LaunchAgents/ai.brightblock.hyprlayer.server.plist

      The desktop app ships its own copy and starts it for you; this package is
      for a machine you reach over SSH.
    EOS
  end

  test do
    assert_match "usage: hyprlayer-server", shell_output("#{bin}/hyprlayer-server bogus 2>&1", 2)
  end
end
