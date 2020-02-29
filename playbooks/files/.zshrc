# Exports
export ZSH="/Users/mauodias/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  ansible
  brew
  copybuffer
  docker
  emoji
  gitignore
  httpie
  python
  terraform
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

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"      ]]  && bindkey   "${key[Up]}"       up-line-or-beginning-search
[[ -n "${key[Down]}"    ]]  && bindkey   "${key[Down]}"    down-line-or-beginning-search

# Fix PS1 not updating for virtualenv and direnv
show_virtual_env() {
    if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
        echo "($(basename $VIRTUAL_ENV)) "
    fi
}
PS1='$(show_virtual_env)'$PS1

# Extensions

eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
