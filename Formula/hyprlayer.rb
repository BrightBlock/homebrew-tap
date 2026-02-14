# typed: false
# frozen_string_literal: true

require_relative "../custom_download_strategy"

class Hyprlayer < Formula
  desc "CLI tool for Hyprlayer"
  homepage "https://github.com/BrightBlock/hyprlayer-cli"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-apple-darwin",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "42c63a132b35c292a916b93b8f105e59066247b53e7dab38d264d5e9d975c702"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "3228f26c3f36d1bbb9eba413cdd57f02f347289ffe8396383fd11a806fb7db56"
    end

    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-x86_64-unknown-linux-gnu",
          using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "2831b5545fbcdbcb4f361738c6747e0ee911f7379a4a7929641957450cc877ea"
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
