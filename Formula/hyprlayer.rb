# typed: false
# frozen_string_literal: true

class Hyprlayer < Formula
  desc "CLI tool for Hyprlayer"
  homepage "https://github.com/BrightBlock/hyprlayer-cli"
  version "1.5.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-apple-darwin"
      sha256 "f1139fefd3901408a21f62846fab637a6f137bd0a4640b90254877cb80fd4099"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-unknown-linux-gnu"
      sha256 "970ccae2d42894de0901fcd227690cf7f428c2c105451d046c860996d030e270"
    end

    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-x86_64-unknown-linux-gnu"
      sha256 "5f5b79fbeb6c34ed2f4b86f707a34b04c7b308d57589810c4cfe92e97d9e4de8"
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
