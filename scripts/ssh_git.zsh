#!/usr/bin/env zsh

source scripts/utils.zsh

SSH_KEY_FILE=~/.ssh/id_ed25519_${1:-"github"}
GIT_SERVICE_URL=${2:-"https://github.com/settings/keys"}

_generate_ssh_keys() {
  if [[ -f ${SSH_KEY_FILE} ]]; then
    return 0
  fi

  local GIT_USER_EMAIL=$(git config --get user.email)
  ssh-keygen -t ed25519 -C ${GIT_USER_EMAIL} -f ${SSH_KEY_FILE}

  eval "$(ssh-agent -s)"
  ssh-add --apple-use-keychain ${SSH_KEY_FILE}
}

_setup_github_cli() {
  if command_exists gh; then
    _copy_key_and_paste_in_browser
    return 0
  fi

  echo "Select ${SSH_KEY_FILE#*.ssh/} when asked to Upload your public SSH key."
  gh auth login
}

_copy_key_and_paste_in_browser() {
  pbcopy < ${SSH_KEY_FILE}.pub && echo "Copied the public SSH key to your clipboard."
  ask_for_confirmation "Open browser, so you can add the public SSH key to your account?" 'open ${GIT_SERVICE_URL} && press_enter_to_continue'
}

# TODO: when adding profiles, add option to handle bitbucket
_switch_remote_url_https_to_ssh() {
  local REMOTE_URL=$(git config --get remote.origin.url)

  if [[ ${REMOTE_URL} == http* ]]; then
    git remote set-url origin "git@github.com:${REMOTE_URL#*github.com/}"
  fi

  git remote -v
}

# TODO: when adding profiles, add option to handle bitbucket
_test_ssh() {
  ssh -T git@github.com
}

_setup_ssh_and_gh_cli() {
  _generate_ssh_keys
  _setup_github_cli
  _switch_remote_url_https_to_ssh
  _test_ssh
}

# ask_for_confirmation "Git - Do you want to set up SSH?" _setup_ssh_and_gh_cli
echo "test"