#!/bin/sh

#这是一个用来使dotfiles 生效的脚本.
#
# 1 替换文件
# 1.1 保存原有文件

HOME=${HOME}
PWD=`pwd`
#https://github.com/tankywoo/dotfiles/blob/master/setup.sh
#1
#1.1 
if [ ! -d $HOME/.back ];then
mkdir $HOME/.back
else
	echo ".back 已经存在"
fi
echo "这个目录存放的是替换文件的备份,无用可删除" > $HOME/.back/readme.md

if [ -f "$HOME/.vimrc" ];then
	mv $HOME/.vimrc $HOME/.back/.vimrc
fi

if [ -f "$HOME/.vim/" ];then
	mv -f $HOME/.vim/ $HOME/.back/.vim/
fi

if [ -f "$HOME/.zshrc" ];then
	mv $HOME/.zshrc $HOME/.back/.zshrc
fi

if [ -f "$HOME/.tmux.conf" ];then
	mv $HOME/.zshrc $HOME/.back/.zshrc
fi

if [ -f "$HOME/.tmux.conf" ];then
	mv $HOME/.gitconfig $HOME/.back/.gitconfig
fi

ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/vim/ $HOME/.vim
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/gitconfig $HOME/.gitconfig
