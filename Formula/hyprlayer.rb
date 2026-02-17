# typed: false
# frozen_string_literal: true

require_relative "../custom_download_strategy"

class Hyprlayer < Formula
  desc "CLI tool for Hyprlayer"
  homepage "https://github.com/BrightBlock/hyprlayer-cli"
  version "1.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-apple-darwin",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "409fbd251f3aa13f479909725b37a30691e6ce226effba9a4b8cda720f903a96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "7a42d7c8e2d3f912292dfd000f451d1e16c1a9bbf37216d828b0b4cf3c71cadc"
    end

    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-x86_64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "d80299e21f41ad8f1f8f09af00e1ede09c9b811b89085605ba32020546fd9618"
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
