# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

alias ..="cd .."
alias grep="grep --color"
alias rm="rm -i"
alias ww="echo `whoami`@`hostname`\(`hostname -i`\):`pwd`"
alias jj="jobs -l"
alias ff="fg"

# User specific environment and startup programs
cd_ll()
{
	# 使用‘\’可以调用原始命令
	\cd $1
	# ls -l
	clear
	pwd
	ll
}
# 设置别名
alias cd='cd_ll'
function git_branch {
	branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
	if [ "${branch}" != "" ];then
		if [ "${branch}" = "(no branch)" ];then
			branch="(`git rev-parse --short HEAD`...)"
		fi
		echo -e "[\033[01;34m$branch\033[00m] "
	fi
}
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\A \[\033[01;35m\]\# \[\033[01;36m\]\W\[\033[00m\] $(git_branch)'

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
