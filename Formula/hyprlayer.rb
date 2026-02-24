# typed: false
# frozen_string_literal: true

require_relative "../custom_download_strategy"

class Hyprlayer < Formula
  desc "CLI tool for Hyprlayer"
  homepage "https://github.com/BrightBlock/hyprlayer-cli"
  version "1.3.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-apple-darwin",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "b8b669e92040b3f28f88d107da0e7b657f84ddaa2565c1b214a4449448a5cf3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "c3a693e32d79997b59572c06fd5abaf2eca7fc4a52315c6ebdf9641845952d81"
    end

    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-x86_64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "8f194a6fdde4c2f2b020dc245bf3c02dde1331d1e02f4b3fea5d5e37b8c7fa6f"
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
