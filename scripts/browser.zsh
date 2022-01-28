#!/usr/bin/env zsh

source scripts/utils.zsh

NEW_BROWSER=${1:-"Brave Browser"}

ask_for_confirmation "Default browser will be used to sign in to GitHub. Open ${NEW_BROWSER}?" \
'open_app_and_wait ${NEW_BROWSER} "Set ${NEW_BROWSER} as the default browser, turn on sync and quit the app to continue..."'
