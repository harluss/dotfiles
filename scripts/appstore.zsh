#!/usr/bin/env zsh

source scripts/utils.zsh

ask_for_confirmation "App Store sign in is required for MAS cli. Open App Store?" \
'open_app_and_wait "App Store" "Sign in and quit the app to continue..."'
