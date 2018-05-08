# ZSH CONFIGURATION

# Autoload 
setopt nomatch correct hist_ignore_all_dups hist_ignore_space appendhistory \
	extendedglob
unsetopt autocd beep correctall
FPATH=~/.zsh/zfunction:$FPATH
PATH=~/.bin:$PATH
autoload -Uz compinit && compinit -u
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook    # Recent dirs list
autoload -Uz ffmpeg-2d ffmpeg-2d-720p ffmpeg-film ffmpeg-film-720p \
	inaudible m4afix pennberley-rsync server-sync
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/chpwd-recent-dirs"
zstyle :compinstall filename '~/.zshrc'

# System
PS1="[%m] %2~ %# "
HISTFILE=~/.zsh/zhistory
HISTSIZE=10000
SAVEHIST=10000
export EDITOR=vim
export LANG=en_US.UTF-8
export SHELL=zsh
tabs -4
umask 022

# Source files
if [ -f ~/.zsh/zalias ] ; then
	source ~/.zsh/zalias
fi

if [ -f ~/.zsh/zlocal ] ; then
	source ~/.zsh/zalias
fi

if [ -f ~/.zsh/zlogin ] ; then
	source ~/.zsh/zlogin
fi

# Auto-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ":completion:warnings:*" format "No matches."

## vim mode
# Default keybindings
bindkey -v

# Quick Emacs-style shortcuts 
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Mode indicator
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Quicker mode switch
export KEYTIMEOUT=1
