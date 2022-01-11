#!/usr/bin/env zsh

if command_exists brew; then
  echo "Skipping install of Homebrew. It's already installed."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew analytics off

# TODO: Keep an eye out for a different `--no-quarantine` solution.
# It's currently exported in zshrc:
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474
brew bundle #--verbose
