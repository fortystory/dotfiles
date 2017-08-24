#! /bin/bash

#备份原有配置
:<<xxx
mkdir ~/.old_setting
mv ~/.vimrc ~/.old_setting/.vimrc
mv ~/.bashrc ~/.old_setting/.bashrc
mv ~/.bash_profile ~/.old_setting/.bash_profile
mv ~/.inputrc ~/.old_setting/.inputrc

link() {
    if [ ! -h $HOME/.$1 ]; then
       ln -s "`pwd`/$1" "$HOME/.$1"
    fi
}



echo "复制文件到家目录"
link bashrc
link bash_profile 
link inputrc 
link vimrc 
xxx
