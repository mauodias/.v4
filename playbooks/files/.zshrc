# Exports
export ZSH="/Users/mauodias/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  ansible
  brew
  copybuffer
  docker
  emoji
  gitignore
  python
  terraform
  vi-mode
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration
export HOMEBREW_NO_AUTO_UPDATE=1
export LC_ALL=en_US.UTF-8

alias proj="cd ~/Projects; clear"
alias test2="echo $@ 1234"

dotfiles () {
  loc=""
  cd -P ~/dotfolder/../..;
  sh -c "ansible-playbook -i local.ini playbooks/init.yml"
  cd -
}

# Extensions

eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
