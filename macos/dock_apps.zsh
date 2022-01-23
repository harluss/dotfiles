#!/usr/bin/env zsh

local dockutil=$(pwd)/submodules/dockutil/scripts/dockutil
local dockApps=(
  "/System/Library/CoreServices/Finder.app"
  "/Applications/Brave Browser.app"
  "/Applications/Firefox.app"
  "/Applications/Visual Studio Code.app"
  # "/Applications/IntelliJ IDEA.app"
  "/Applications/Postman.app"
  "/Applications/Spotify.app"
  "/Applications/iTerm.app"
  "/Applications/Bear.app"
)

# $dockutil --no-restart --remove all

for app in ${dockApps[@]}; do
  echo ${app}
  # $dockutil --no-restart --add ${app}
done

# $dockutil --no-restart --add "~/Downloads" --view list --display folder --sort dateadded