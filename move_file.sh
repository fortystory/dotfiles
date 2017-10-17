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
mkdir $HOME/.back
echo "这个目录存放的是替换文件的备份,无用可删除" > $HOME/.back/readme.md

if [ -f "$HOME/.vimrc" ];then
	mv $HOME/.vimrc $HOME/.back/.vimrc
fi

if [ -f "$HOME/.vim/" ];then
	mv -f $HOME/.vim/ $HOME/.back/.vim/
fi
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/vim/ $HOME/.vim
