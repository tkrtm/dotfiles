# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all # settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

alias term='xfce4-terminal'

pj_top=~/xarina_sdk
#TOOLS_PATH=$(cd $pj_top/tools/gnu/gnu-tools/xarina-latest/x86-linux2/bin && pwd)
#TOOLS_WRAPPER_PATH=$(cd $pj_top/tools/gnu/sysroot/xarina-latest/x86-linux2 && pwd)
#MKIMG_PATH=$(cd $pj_top/dev/cpu0/boot/bootloader/tools && pwd)
#LZOP_PATH=$(cd $pj_top/tools/lzop/lzop-1.03/bin && pwd)
export PATH=~/bin:$PATH

export TERM=xterm-256color
export PS1="\[\e[1;32m\]\t\[\e[0;37m\]@\h:\w\\$ "
#export PS1="${USER}@${HOST}:${PWD}> "

export EDITOR=vim

alias ls='ls --color'
alias cb='xsel --clipboard --input'

export erdir=~/xarina/xarina_e/release/ain1e/dev/cpu0/xarinasamples/eventrec/src
export tappdir=~/xarina/xarina_e/release/ain1e/dev/cpu0/tutorial/src/tappd

#export PATH=$PATH:/home/takeru/HP_Fortify/HP_Fortify_SCA_and_Apps_4.21/bin
#export PATH="$PATH:/home/takeru/HP_Fortify/HP_Fortify_SCA_and_Apps_4.30/bin"
#export PATH=$PATH:/home/takeru/HP_Fortify/HP_Fortify_SCA_and_Apps_3.90/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/home/takeru/.sdkman"
#[[ -s "/home/takeru/.sdkman/bin/sdkman-init.sh" ]] && source "/home/takeru/.sdkman/bin/sdkman-init.sh"


export GRADLE_HOME=/usr/local/gradle
export PATH="$PATH:$GRADLE_HOME/bin"

alias pip="pip --proxy=proxy.hq-other.sony.co.jp:10080"

function pushd2link() {
	cmd=`readlink -f $1`
	pushd $cmd
}
alias pdl=pushd2link


#function execvim() {
#	PWD=`pwd`
#	if [ `echo ${PWD} | grep 'xarina'` ]; then
#		export GTAGSLIBPATH=${GTAGSLIBPATH}:/usr/local/poky1.8/sysroots/armv6-vfp-poky-linux-gnueabi/usr/include
#	else
#		export GTAGSLIBPATH=${GTASGLIBPATH}:/usr/include
#	fi
#	vim $@
#}
#alias vim=execvim

