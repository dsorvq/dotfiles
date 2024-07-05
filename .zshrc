export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"
# Components on the left prompt
MNML_PROMPT=('mnml_cwd 2 0' mnml_ssh mnml_pyenv mnml_status mnml_keymap)
# Components on the right prompt
MNML_RPROMPT=(mnml_git)
# Components shown on info line
MNML_INFOLN=()
MNML_MAGICENTER=()

zstyle ':omz:update' mode disabled  # disable automatic updates

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

