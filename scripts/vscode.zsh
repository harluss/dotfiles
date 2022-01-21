#!/usr/bin/env zsh

# Install VS Code extensions
for ext in $(cat apps/vscode/extensions/extensions.list); do
  code --install-extension ${ext} --force
done