#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -X --group-directories-first -A'

PS1='[\u@\h \W]\$ '
