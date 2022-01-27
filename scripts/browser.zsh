#!/usr/bin/env zsh

source scripts/utils.zsh

NEW_BROWSER=$1

if [[ ! ${NEW_BROWSER} ]]; then
  exit 0
fi

yes_no_loop 'open -a "${NEW_BROWSER}" -W' "Default browser will be used to sign in to GitHub." "Open ${NEW_BROWSER}? If you say no, Safari will remain the default one." "Set ${NEW_BROWSER} as default, turn on sync and quit the browser to continue."
