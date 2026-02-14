# typed: false
# frozen_string_literal: true

class Hyprlayer < Formula
  desc "CLI tool for Hyprlayer"
  homepage "https://github.com/BrightBlock/hyprlayer-cli"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-apple-darwin",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "PLACEHOLDER_MACOS_ARM64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end

    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-x86_64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "PLACEHOLDER_LINUX_X86_64"
    end
  end

  def install
    binary = Dir["hyprlayer*"].first
    bin.install binary => "hyprlayer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hyprlayer --version")
  end
end
