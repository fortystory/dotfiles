# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
source ~/.local/bin/bashmarks.sh
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\A \[\033[01;35m\]\# \[\033[01;36m\]\W \[\033[00m\]'
PS1='`a=$?;if [ $a -ne 0 ]; then a="  "$a; echo -ne "\[\e[s\e[1A\e[$((COLUMNS-2))G\e[31m\e[1;41m${a:(-3)}\e[u\]\[\e[0m\e[7m\e[2m\]"; fi`\[\e[1;32m\]\A \[\033[01;35m\]\# \[\e[0m\e[1;36m\]\W\[\e[1;34m\] \[\e[0m\]'
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
