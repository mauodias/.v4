# Exports
export ZSH="/Users/mauodias/.oh-my-zsh"
export PATH=$PATH:$HOME/.tools
export PYTHONDONTWRITEBYTECODE=1
ZSH_THEME="classyTouch"
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
  zsh-docker-aliases
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

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
      print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
      print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG=''

  #Adds the new line and ➜ as the start character.
  printf "\n> ";
}

# Setup repo CLIs
if [[ -f $HOME/.github_token ]]
then
    export GITHUB_TOKEN=$(cat $HOME/.github_token)
fi

if [[ -f $HOME/.gitlab_token ]]
then
    export GITLAB_API_PRIVATE_TOKEN=$(cat $HOME/.gitlab_token)
fi
export GITLAB_API_ENDPOINT="https://gitlab.com/api/v4"

# Custom functions

for f in $HOME/.tools/functions/*; do
  source $f
done

# Create vim swapfiles folder
mkdir -p $HOME/.vim/swap

# Extensions

eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
