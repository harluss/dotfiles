#!/usr/bin/env zsh

source scripts/utils.zsh

# TODO: Replace this with "mas account" check, to request credentials only when user is not logged in.
# Sign in would be triggered on initial system setup and would be automatically skipped on subsequent runs.
# Currently there's an issue with "mas account" on Monterey and the "account" and "signin" commands are disabled.
ask_for_confirmation "App Store - sign in is required for MAS CLI. Open App Store, so you can sign in?" \
'open_app_and_wait "App Store" "Sign in and quit the app to continue..."'
