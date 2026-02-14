# Homebrew Tap for Hyprlayer CLI

## Setup

Since `hyprlayer-cli` is a private repository, you need a GitHub token with `repo` scope:

```bash
export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token)
```

Add this export to your shell profile (`~/.zshrc`, `~/.bashrc`, etc.) so it persists across sessions.

## Install

```bash
brew tap brightblock/tap
brew install hyprlayer
```

## Upgrade

```bash
brew upgrade hyprlayer
```

## Uninstall

```bash
brew uninstall hyprlayer
brew untap brightblock/tap
```
