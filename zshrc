# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/dev/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
go env -w GOSUMDB="sum.golang.google.cn"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerline"
ZSH_THEME="robbyrussell"
#修改 ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
#local ret_status="%(?:%{$fg_bold[black]%}$HOST %{$fg_bold[green]%}➜:%{$fg_bold[black]%}$HOST %{$fg_bold[red]%}➜)"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm-dd-yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG="zh_CN.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# powerline_conf_path
#powerline_conf=(
#/usr/local/lib/python3.5/dist-packages/powerline/bindings/tmux/powerline.conf
#${HOME}/lib/python3.6/site-packages/powerline/bindings/tmux/powerline.conf
#)

#powerline_conf=(
#[0]=/usr/local/lib/python3.5/dist-packages/powerline/bindings/tmux/powerline.conf
#[1]=${HOME}/lib/python3.6/site-packages/powerline/bindings/tmux/powerline.conf
#)
#zsh不支持这种方式定义数组

#echo ${#powerline_conf[@]};
for conf in ${powerline_conf[@]}; do
	if [ -e $conf ];then
		export POWERLINE_CONF_PATH=$conf
		break
	fi
done
# open-terminal
#[[ -z "$TMUX" && -n "$USE_TMUX" ]] && {
    #[[ -n "$ATTACH_ONLY" ]] && { tmux a 2>/dev/null || { cd && exec tmux }
		#exit
	#}
	#tmux new-window -c "$PWD" 2>/dev/null && exec tmux a 
	#exec tmux
#}

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias -s php=vim
#alias -s c=vim
#alias -s h=vim
#alias -s sh=vim
#alias -s cpp=vim
#alias -s html=vim
alias vimrc="vim ~/.vimrc"
alias ww="echo `whoami`@`hostname`\(`hostname -i`\):`pwd`"
alias now="date +%F' '%T"

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

if [ -f "$HOME/.myalias.sh" ];then
	source $HOME/.myalias.sh
else
	echo "提示:没有'.myalias.sh文件'"
fi
#eval $(thefuck --alias FUCK)
#eval $(thefuck --alias)
if [[ -e /dev/lxss ]] {
	#创建硬链接
	#ln -s /mnt/c/Users/forty/OneDrive/ ~/onedrive
	#ln -s /mnt/c/Users/forty/Desktop ~/desktop
	alias cmdtool='/mnt/c/tools/wsl-terminal/cmdtool'
	alias cw='/mnt/c/tools/wsl-terminal/cmdtool wstartex'
	alias cmd='/init /mnt/c/Windows/System32/cmd.exe'
	alias ipconfig='cmd /c ipconfig | ucat'
	alias tl='cmd /c tasklist'
	alias tlg='cmd /c tasklist | grep'
	#alias netstat='cmd /c netstat'^c后还会有内容输出... 
	alias ps1='cmd /c powershell'
	#控制windows播放器
	alias ns='cmdtool wstartex ~/onedrive/script/ahk/media/ns.ahk'
	alias prevsong='cmdtool wstartex ~/onedrive/script/ahk/media/ps.ahk'
	alias pp='cmdtool wstartex ~/onedrive/script/ahk/media/pp.ahk'
	#alias sn='cmdtool wstartex /mnt/c/tools/snipaste/Snipaste.exe snip' #Snipaste别名
	#alias snip='cmdtool wstartex /mnt/c/tools/snipaste/Snipaste.exe'
}
#显示日历
#ccal -u 2> /dev/null
#自定义函数
#g++编译.cpp文件 参数为cpp文件名
function cg()
{
	g++ $1 -o ${1%.*} -std=c++11
}


#function cd_ll()
#{
  # 使用‘\’可以调用原始命令
#  \cd $1
  # ls -l
#  ll
#}
# 设置别名
#alias cd='cd_ll'

#用于显示gui窗口
#export DISPLAY=127.0.0.1:0.0
`cat /etc/resolv.conf | grep nameserver | awk '{print "export DISPLAY="$2":0"}'`
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8

umask 022

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#if [ $(ps -ax | grep dbus-daemon | wc -l) -eq 1 ]; then
  #eval `dbus-launch fcitx > /dev/null 2>&1`
#fi
#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
