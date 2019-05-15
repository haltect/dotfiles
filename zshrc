# zsh main
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit -d ~/.zsh/dumpfile
autoload -U colors && colors
setopt AUTO_CD
setopt CORRECT
setopt completealiases

# key bindings
autoload zkbd
[[ ! -f ${ZDOTDIR:-$HOME}/.zsh/rxvt-256color-:0.0 ]] && zkbd
source ${ZDOTDIR:-$HOME}/.zsh/rxvt-256color-:0.0
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char


#prompt
PROMPT="
%{$fg_bold[blue]%}%~%{$reset_color%} > "

# exports
export EDITOR="vim"
export PAGER="more" 
export RXVT_SOCKET="/tmp/.urxvtd"
export PATH="$PATH:/home/hlt/bin" 

# irc
export IRCNICK="haltect"
export IRCUSER="hlt"
export IRCNAME="hlt"
export IRCSERVER="irc.freenode.org"

# hlt aliases
alias .="pwd"
alias ..="cd .."
alias ~="cd ~"
alias :q="clear ; exit"
alias ls="ls -hFG --color=auto --group-directories-first --hide '\$RECYCLE.BIN' --hide 'System Volume Information' --hide 'desktop.ini'"
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias tree="tree -dA"
alias df="df -h"
alias grep="grep -Pi --color=auto"
alias xbps-install="sudo xbps-install"
alias xbps-query="sudo xbps-query"
alias su="su -"
alias vi="vim" 
alias clock="tty-clock -c -C 4 -B -D"
alias suspend="sudo pm-suspend"
alias reboot="sudo reboot"
alias exit="clear ; exit"
alias neofetch="neofetch --ascii_distro void_small"

eval $(dircolors -b ~/.zsh/dircolors)

clear ; echo ; echo "$fg_bold[cyan]Void $fg_bold[white]Linux $fg_bold[cyan]($fg[white]$(uname -r)$fg_bold[cyan])" 
