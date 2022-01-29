#!/usr/bin/env zsh

for ext in $(cat apps/vscode/extensions/extensions.list); do
  code --install-extension ${ext} --force
done