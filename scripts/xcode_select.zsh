#!/usr/bin/env zsh

# Note: xcode-select is required for Git and Homebrew

if command_exists xcode-select; then
  echo "Skipping install of xcode-select. It's already installed."
else
  xcode-select --install
fi
