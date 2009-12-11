# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
alias cman='man -M /usr/share/man/zh_CN.UTF-8/ '
alias chromium="LC_CTYPE=en_US.UTF-8 chromium"

PATH=$PATH:/sbin:/usr/sbin
export PATH

genpasswd() {
		local l=$1
	       	[ "$l" == "" ] && l=20
	      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
