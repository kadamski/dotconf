zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/k/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
bindkey -e

bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
setopt noautomenu
setopt share_history
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
