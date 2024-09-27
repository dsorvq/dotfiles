export ZSH="$HOME/.oh-my-zsh"
path+=('/home/dsorvq/.cargo/bin')
export PATH

ZSH_THEME="minimal"
# Components on the left prompt
MNML_PROMPT=('mnml_cwd 3 0' mnml_ssh mnml_pyenv mnml_status mnml_keymap)
# Components on the right prompt
MNML_RPROMPT=(mnml_git)
# Components shown on info line
MNML_INFOLN=()
MNML_MAGICENTER=()

zstyle ':omz:update' mode disabled  # disable automatic updates

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  fzf
  zsh-autosuggestions
)

# TODO: Better mapping? 
bindkey '^I ' autosuggest-accept

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

