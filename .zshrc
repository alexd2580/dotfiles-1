source ~/antigen/antigen.zsh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle robbyrussell/oh-my-zsh lib/
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
# antigen bundle lukechilds/zsh-nvm
# antigen bundle andrewferrier/fzf-z

antigen bundle osx
antigen bundle vi-mode

# Load the theme.
#
ZSH_THEME="powerlevel9k/powerlevel9k".

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
# antigen theme https://gist.github.com/3750104.git agnoster

# Tell antigen that you're done.

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:/usr/local/bin

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'

COMPLETION_WAITING_DOTS="true"

export DEFAULT_USER=`whoami`

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function pythonserve() {
  if [ "$1" != "" ]
    then
      python -m SimpleHTTPServer $1
  else
    python -m SimpleHTTPServer 8000
      fi
}

export KEYTIMEOUT=1

function jira() {
  open "https://jira.ryanair.com:8443/browse/$1?filter=12755"
}

# alias vim="nvim"

#Neovim true color support
export NVIM_TUI_ENABLE_TRUE_COLOR=1
#Neovim cursor shape support
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export TERM='xterm-256color'

source ~/.local.zshrc
export TERMINFO="$HOME/.terminfo"

antigen apply
export PATH="/usr/local/sbin:$PATH"

#Fix ctrl h
#infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
#tic $TERM.ti

function topdf() {
  pandoc --variable mainfont="Charter" --variable monofont="DejaVu Sans Mono" --variable fontsize=14pt --variable geometry:"top=1.5cm, bottom=2.5cm, left=1.5cm, right=1.5cm" --variable geometry:a4paper -f markdown $1  -o $(echo $1 | sed 's/\.md/\.pdf/g')
}
source ~/.functions

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

source ~/.aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
