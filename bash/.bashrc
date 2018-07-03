#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

TZ='American/Los_Angeles'; export TZ

alias ls='ls --color=auto -X -h --group-directories-first'
alias fstr='grep -rnw $0 -e $1'
alias la='ls -a'

PS1='[\u@\h \W]\$ '

export QSYS_ROOTDIR="/home/hdt/intelFPGA_lite/17.1/quartus/sopc_builder/bin"

export PATH=$PATH:/home/hdt/intelFPGA_lite/17.1/quartus/bin:/opt/ti/mspgcc/bin
