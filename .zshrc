export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="wilovy"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# ------------------------------------------
#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# [ bin path ]
PATH=~/.local/bin:$PATH

alias lf-pick="~/.local/bin/lf-pick.sh"

# [ console ninja env ]
PATH=~/.console-ninja/.bin:$PATH

# [ go env ]
PATH=~/go/bin/:$PATH

# [ cargo env ]
PATH=~/.cargo/bin/:$PATH

# [ superfile env | spf ]
PATH=~/superfile/bin:$PATH

# [ homebrew env ]
PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

# [ eza better ls ]
#alias ls="eza --tree --level=1 --color=always"

# [ gols better ls ]
alias ls="~/go/bin/GoLS -tree -emoji"

# [ helix abbreviation ]
alias hx="helix"

# [ kitten icat ]
alias icat="kitten icat"

# [ fzf configs ]
if [[ -n "$PS1" ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi
bindkey '^f' fzf-file-widget

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
