#!/usr/bin/env zsh

source scripts/utils.zsh

yes_no_loop 'open -a "App Store" -W' "App Store sign in is required for MAS cli." "Open App Store?" "Sign in and close the app to continue."
