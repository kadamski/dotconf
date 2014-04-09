export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="3den"
ZSH_THEME="intheloop"
ZSH_THEME="frisk"
ZSH_THEME="k"
#ZSH_THEME="random"

# Set this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

plugins=(git, vi-mode)

source $ZSH/oh-my-zsh.sh

#############################################################

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITPR=vim

APPEND_HISTORY="true"
SHARE_HISTORY="true"
KEYTIMEOUT=1

# MODE_INDICATOR="%{$fg_bold[white]%}--N--%{$reset_color%}"

typeset -A key
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^G' what-cursor-position
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a G end-of-buffer-or-history
bindkey '^P' up-history
bindkey '^N' down-history

bindkey $terminfo[kich1]  overwrite-mode
bindkey -a $terminfo[kich1]  overwrite-mode
bindkey $terminfo[kdch1]  delete-char
bindkey -a $terminfo[kdch1]  delete-char

bindkey $terminfo[khome] vi-beginning-of-line
bindkey -a $terminfo[khome] vi-beginning-of-line

bindkey $terminfo[kend] vi-end-of-line
bindkey -a $terminfo[kend] vi-end-of-line

