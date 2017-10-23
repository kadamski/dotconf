HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/k/.zshrc'

autoload -Uz compinit
compinit

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

bindkey -e

bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

setopt noautomenu

setopt share_history
setopt appendhistory
setopt hist_ignore_dups

up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history
down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history

bindkey '^[[A' up-line-or-local-history     # Cursor up
bindkey '^[[B' down-line-or-local-history   # Cursor down
bindkey '^[[1;5A' up-line-or-history    # [CTRL] + Cursor up
bindkey '^[[1;5B' down-line-or-history  # [CTRL] + Cursor down

# Stack all cd's
setopt AUTO_PUSHD
# CD into directories without "cd" command
setopt AUTO_CD

# For better ctrl-w
autoload -U select-word-style
select-word-style bash

# Shift-tab undo
bindkey '^[[Z' undo
# Use any key to escape from ctrl-s
unsetopt flow_control
bindkey '^Q' beginning-of-line

export PATH=~/bin/:~/bin/neovim/bin/:$PATH
export EDITOR=nvim
[[ $- = *i* ]] && source ~/dotconf/external/liquidprompt/liquidprompt

alias vim=nvim

export $(gnome-keyring-daemon -s)
