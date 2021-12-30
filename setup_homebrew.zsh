#!/usr/bin/env zsh

echo "\n=== Starting Homebrew Setup ===\n"

if exists brew; then
  echo "Homebrew already installed!"
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
fi

# There's no `brew bundle --no-quarantine` option.
# Set in zshrc (export HOMEBREW_CASK_OPTS="--no-quarantine") instead.
brew bundle --verbose
