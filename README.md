# wsl 相关配置

----------------------

## 安装wsl
	
直接在应用商店索搜Ubuntu即可

## 安装wsl-terminal

[wsl-terminal](https://goreliu.github.io/wsl-terminal/README.zh_CN.html)用于 Windows Subsystem for Linux (WSL) 的终端模拟器，基于 [mintty](http://mintty.github.io/) 和 [wslbridge](https://github.com/rprichard/wslbridge)。

[下载wsl-terminal](https://github.com/goreliu/wsl-terminal/releases),解压即可

## 配置wsl-terminal (1)

在wsl-terminal安装目录下的 etc/wsl-terminal.conf 文件,修改下列变量:

```
	[config]
	title="        "
	shell=zsh
	use_tmux=1 ;使用tmux
```


## 安装zsh

[oh my zsh](http://ohmyz.sh/)官网
	
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```


## 配置wsl

克隆我的dotfile
```
git clone https://github.com/fortystory/dotfiles
```

执行

```
./move_file.sh
```

## 安装power-line字体

```
git clone https://github.com/powerline/fonts.git --depth=1
```

在windows进入`fonts`目录,执行`install.ps1`文件.
wsl中下载执行`install.sh`

### 安装python
```./configure  --prefix=${HOME} --enable-shared --enable-loadable-sqlite-extensions ```

或者
```
#安装pip
#在https://pypi.org/project/pip/#files下载
wget https://files.pythonhosted.org/packages/ae/e8/2340d46ecadb1692a1e455f13f75e596d4eab3d11a57446f08259dee8f02/pip-10.0.1.tar.gz
tar -xf pip-10.0.1.tar.gz
cd pip-10.0.1
#ImportError: No module named 'setuptools' 用下面这句
sudo apt-get install python3-setuptools
sudo python3 setup.py install
sudo pip install powerline-status 
```
找到安装位置,修改tmux.conf中对应的配置

## 配置wsl-terminal (2)

在wsl-terminal中右键=>首选项:
- 窗口=>滚动条:`无`
- 终端=>终端类型:选择`xterm-256color`
- 终端=>响铃:可以全部选`无`,复选框全部`取消`勾选
- 文本=>字体:`ProFont for Powerline`,12pt

## vim配置

- vim升级到8.0以上
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

- 安装插件(如果失败,重新安装[Vundle](https://github.com/VundleVim/Vundle.vim),直接使用vim配置即可)
```
:PluginInstall
```

## 修改配置

修改`.zshrc`中`cmdtool`等别名.

## 修改默认创建文件,文件夹权限 
```
sudo vim /etc/porfile 
```
添加 
```
umask 022
```
