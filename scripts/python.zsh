#!/usr/bin/env zsh

_install_python() {
  asdf plugin-add python
  asdf install python 3.11.1
  asdf global python 3.11.1
}

# TODO: when adding profiles, add optional installation based on profile
_install_python
