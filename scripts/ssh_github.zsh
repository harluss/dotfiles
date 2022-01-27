#!/usr/bin/env zsh

SSH_KEY_FILE=~/.ssh/id_ed25519_github

_generate_ssh_keys() {
    local GITHUB_USER_EMAIL=$(git config --get user.email)
    ssh-keygen -t ed25519 -C ${GITHUB_USER_EMAIL} -f ${SSH_KEY_FILE} && echo "Generated new SSH key: ${SSH_KEY_FILE}"

    eval "$(ssh-agent -s)"

    ssh-add --apple-use-keychain ${SSH_KEY_FILE} && echo "Added SSH private key to ssh-agent"
}

_setup_github_cli() {
  echo "Select ${SSH_KEY_FILE#*.ssh/} when asked to Upload your SSH public key."
  gh auth login
  gh config set editor "code --wait"
}

_switch_remote_url_https_to_ssh() {
  local REMOTE_URL=$(git config --get remote.origin.url)

  if [[ ${REMOTE_URL} == http* ]]; then
    git remote set-url origin "git@github.com:${REMOTE_URL#*github.com/}"
    git remote -v
  fi
}

_test_ssh() {
  ssh -T git@github.com
}

if [[ ! -f ${SSH_KEY_FILE} ]]; then
  _generate_ssh_keys
fi

_setup_github_cli
_switch_remote_url_https_to_ssh
_test_ssh
