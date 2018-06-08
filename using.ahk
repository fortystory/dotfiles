;修改本脚本的图标
IfExist, icon.ico
{
Menu, Tray, Icon, icon.ico
}
GroupAdd, SH, ahk_exe Xshell.exe
GroupAdd, SH, ahk_exe ConEmu64.exe
; GroupAdd, SH, ahk_exe powershell.exe
GroupAdd, SH, ahk_exe SLES-12.exe
GroupAdd, SH, ahk_exe Hyper.exe
GroupAdd, SH, ahk_exe Terminus.exe
GroupAdd, SH, ahk_exe bash.exe
GroupAdd, SH, ahk_exe ubuntu.exe
GroupAdd, SH, ahk_exe mintty.exe
GroupAdd, MINTTY, ahk_exe mintty.exe
GroupAdd, BROWSER, ahk_exe firefox.exe
GroupAdd, BROWSER, ahk_class MozillaWindowClass
GroupAdd, UWP, ahk_class ApplicationFrameWindow
GroupAdd, UWP, ahk_exe ApplicationFrameHost.exe
return

::va::
send,echo "<pre>";var_dump($);die;{left}{left}{left}{left}{left}{left}
return
::al::
send,alert();{left}{left}
return


::lo::
send,log_message('error',__METHOD__.'::'.__LINE__.':: data is : '.var_export($,true));{esc}F$a
;; send,log_message('error',__METHOD__.'::'.__LINE__.':: data is : '.var_export($,true));{left}{left}{left}{left}{left}{left}{left}{left}
;; send,log_sys_message('log', __METHOD__.'->'.__LINE__.' '.var_export($,true), 'xiuwei');{esc}F$a
return

^!T::
d = %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%
;获得系统时间比如今天的时间：2011-09-16。如果需要“年”的话请替换上面的“-”。
;clipboard = %d%
;把 d 的值发送到剪贴板，变量是不用声明的，想引用变量的值，就在变量的前后加“%”。第二行的变量是 AHK 自带的变量。
Send %d%
return

; #x::
; ;;Send, ^+9  ;;切换输入法到英文  需要配置好快捷键
; IfWinExist,ahk_exe Xshell.exe
; {
; 	;;切换到xshell
;     WinActivate
; }
; else
; {
; 	;;启动xshell,等待xshell启动,切换到xshell
;     Run "C:\Program Files (x86)\NetSarang\Xshell 5\Xshell.exe"
;     WinWait ahk_exe Xshell.exe
;     WinActivate
; }
; return

#s::
;;Send, ^+9  ;;切换输入法到英文
IfWinExist,ahk_exe sublime_text.exe
{
    WinActivate
}
else
{
    Run "C:\tools\sublime text build 3083\sublime_text.exe"
    WinWait ahk_exe sublime_text.exe
    WinActivate
}
return

#f::
;;Send, ^+8  ;;切换输入法到中文
IfWinExist,ahk_exe firefox.exe
{
    WinActivate
}
else
{
    Run "C:\tools\firefox\firefox.exe"
    WinWait ahk_exe firefox.exe
    WinActivate
}
return

#c::
;;Send, ^+8
IfWinExist,ahk_class OrpheusBrowserHost
{
    WinActivate
}
else
{
    Run "C:\Program Files (x86)\Netease\CloudMusic\cloudmusic.exe"
    WinWait ahk_exe cloudmusic.exe
    WinActivate
}
return



#1::
IfWinExist,ahk_exe ONENOTE.EXE
{
    WinActivate
}
else
{
    Run "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
    WinWait ahk_exe ONENOTE.EXE
    WinActivate
}
return

#2::
IfWinExist,ahk_exe OUTLOOK.EXE
{
    WinActivate
}
else
{
    Run "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
    WinWait ahk_exe OUTLOOK.EXE
    WinActivate
}
return

#3::
IfWinExist,ahk_exe WINWORD.EXE
{
    WinActivate
}
else
{
    Run "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"
    WinWait ahk_exe WINWORD.EXE
    WinActivate
}
return

#4::
IfWinExist,ahk_exe EXCEL.EXE
{
    WinActivate
}
else
{
    Run "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"
    WinWait ahk_exe EXCEL.EXE
    WinActivate
}
return


;;左手已经满了 = _=
#x::   
;;Send, ^+9  ;;切换输入法到英文  需要配置好快捷键
IfWinExist,ahk_exe mintty.exe
{
	WinActivate
}
else
{
    Run "C:\tools\wsl-terminal\open-wsl.exe",
    ; Run %comspec% "C:\tools\wsl-terminal\open-wsl.exe" -C "/home/xiuwei" -B "-h err",
    WinWait ahk_exe mintty.exe
    WinActivate
}
return

;;占用的是原来的windows link 的快捷键
;;修改成呼出微信的快捷键
#w::
Send, ^+!{F11}     ;;ctrl + shift + alt + F11
return

;;最小化一个窗口
;;如果 WinTitle 为字母 A 且其他三个窗口参数（WinText、ExcludeTitle 和 ExcludeText）都为空或省略，则使用活动窗口。
id := WinExist("A") 
; #Up::WinMaximize, A  ;;最大化
#Esc::WinMinimize, A   ;;最小化
return

;;将shift + 空格 切换全角字符屏蔽 
+Space::
return

;;模拟linux ctrl + u的效果  删除本行
;;#IfWinNotActive ahk_exe Xshell.exe  ;;不在xshell上执行下面的脚本
#IfWinNotActive,ahk_group SH
^u::  
    send +{Home}{BackSpace}
return

;todo 判断是不是在 SH组中  如果是 发送 chrl + insert 
;                          不是 发送 ^v
#IfWinActive,ahk_group SH
^v::
    send +{Ins}
return

; 在非wsl-erminal中使用ctrl-b 直接激活wsl-terminal
#IfWinNotActive,ahk_group MINTTY 
^b::
	IfWinExist,ahk_exe mintty.exe
	{
		WinActivate
		send ^b
	}
	else
	{
		Run "C:\tools\wsl-terminal\open-wsl.exe",
		; Run %comspec% "C:\tools\wsl-terminal\open-wsl.exe" -C "/home/xiuwei" -B "-h err",
		WinWait ahk_exe mintty.exe
		WinActivate
	}
return

;;火狐中修改历史快捷键
#IfWinActive,ahk_group BROWSER
^h::  
    send ^+h
return
;; qq的快捷键  需要求设置
#q::
Send, !^+{F2}
return

;;这条不起作用
#IfWinActive,ahk_group UWP
{XButton1}::
	send #{BackSpace}
return
