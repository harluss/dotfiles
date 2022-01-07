#!/usr/bin/env zsh

if exists brew; then
  echo "Skipping install of Homebrew. It's already installed!"
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew analytics off
# There's no `brew bundle --no-quarantine` option.
# Set in zshrc (export HOMEBREW_CASK_OPTS="--no-quarantine") instead.
brew bundle --verbose
