# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]> \A \[\033[01;35m\]\# \[\033[01;36m\]\W \[\033[00m\]'
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
