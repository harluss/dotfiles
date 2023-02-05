#!/usr/bin/env zsh

_install_python() {
  asdf plugin-add python
  asdf install python latest
  asdf global python latest
}

# TODO: when adding profiles, add optional installation based on profile
_install_python
