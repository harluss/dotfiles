#!/usr/bin/env zsh

_install_nodejs() {
  asdf plugin-add nodejs
  asdf install nodejs lts
  asdf global nodejs lts
}

_install_yarn() {
  asdf plugin-add yarn
  asdf install yarn latest
  asdf global yarn latest
}

# TODO: when adding profiles, add optional installation based on profile
_install_nodejs
_install_yarn