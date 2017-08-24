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

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
