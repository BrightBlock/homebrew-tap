# typed: false
# frozen_string_literal: true

require_relative "../custom_download_strategy"

class Hyprlayer < Formula
  desc "CLI tool for Hyprlayer"
  homepage "https://github.com/BrightBlock/hyprlayer-cli"
  version "1.3.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-apple-darwin",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "79c2aedd4225bb153113fd299af0892ac8422036f00cc2cfa88515720ca91c75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "519efd276a4c58977d8db95632340029e826572cb17adf19955f5d8fcf90a3db"
    end

    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-x86_64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "f0c4fc1f0085c11bb3a19c665cc49ad261396d59f2f5b027771e60f0d1fcfed1"
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
