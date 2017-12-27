#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

TZ='American/Los_Angeles'; export TZ

alias ls='ls --color=auto -X -h --group-directories-first -A'
alias fstr='grep -rnw $0 -e $1'

PS1='[\u@\h \W]\$ '
