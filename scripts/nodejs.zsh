#!/usr/bin/env zsh

_install_nodejs() {
  asdf plugin-add nodejs
  asdf install nodejs lts
  asdf global nodejs lts
}

# TODO: when adding profiles, add optional installation based on profile
_install_nodejs
