set -o vi

HISTFILE=$HOME/.ksh_history
HISTSIZE=1000000
export HISTFILE HISTSIZE

alias ll='ls -lhF'
alias la='ls -lahF'

export EDITOR=vim
export VISUAL=vim
export PAGER=less
export CLICOLOR=1

