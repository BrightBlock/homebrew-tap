# typed: false
# frozen_string_literal: true

class Hyprlayer < Formula
  desc "CLI tool for Hyprlayer"
  homepage "https://github.com/BrightBlock/hyprlayer-cli"
  version "1.6.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-apple-darwin"
      sha256 "4f9e135923e94d576fa1c38022d5f0c043c5d0688781406860d73df38fb50506"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-aarch64-unknown-linux-gnu"
      sha256 "884c6b367ed91e8b31019aad02506b47fdd511fc07baee08840b157781223407"
    end

    on_intel do
      url "https://github.com/BrightBlock/hyprlayer-cli/releases/download/v#{version}/hyprlayer-x86_64-unknown-linux-gnu"
      sha256 "e2fddc5f97262e40d3379aeb268dbc67fb8fe45709bf3b0e8964f7342a12d325"
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
