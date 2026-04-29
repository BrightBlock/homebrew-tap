# typed: false
# frozen_string_literal: true

class Hyprlayer < Formula
  desc "CLI tool for Hyprlayer"
  homepage "https://github.com/BrightBlock/hyprlayer-cli"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-apple-darwin"
      sha256 "7b0ce24b24fc0cd8b7f3441f0280bd88b82961f2d412f5e373b69f17340802bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-unknown-linux-gnu"
      sha256 "d4c4ea5319045837e11312408b9c15a8e799ef8a91aa668b9683e1283c3ac260"
    end

    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-x86_64-unknown-linux-gnu"
      sha256 "d950963faf048e96bae350b0560a0bc2aed4baf312c7b98ad4d0fde732900153"
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
