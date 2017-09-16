;修改本脚本的图标
IfExist, icon.ico
{
Menu, Tray, Icon, icon.ico
}
GroupAdd, SH, ahk_exe Xshell.exe
GroupAdd, SH, ahk_exe ConEmu64.exe
GroupAdd, SH, ahk_exe powershell.exe
GroupAdd, SH, ahk_exe SLES-12.exe
return

;显示title
::ahktitle::
WinGetActiveTitle, Title
MsgBox, %Title%
return

;=============== 双击 三击 ctrl 切换虚拟桌面 ======;
;Windows 10 虚拟桌面自动切换
/*
#Persistent
$ctrl::
if ctrl_presses > 0 ; SetTimer 已经启动，所以我们记录按键。
{
ctrl_presses += 1
return
}
;否则，这是新一系列按键的首次按键。将计数设为 1 并启动定时器：
ctrl_presses = 1
SetTimer, Keyctrl, 500 ;在 500 毫秒内等待更多的按键。
return
Keyctrl:
SetTimer, Keyctrl, off
if ctrl_presses = 1 ;该键已按过一次。
{
Gosub singleClick
}
else if ctrl_presses = 2 ;该键已按过两次。
{
Gosub doubleClick
}
else if ctrl_presses = 3
{
Gosub trebleClick
}
;不论上面哪个动作被触发，将计数复位以备下一系列的按键：

ctrl_presses = 0
return
singleClick:
send {ctrl}
return

doubleClick:
send #^{left}
return

trebleClick:
send #^{right}
return

;不论上面哪个动作被触发，将计数复位以备下一系列的按键：
SPACE_presses = 0
return
singleClick2:
send {SPACE}
return

doubleClick2:
send {enter}
return
*/
;==============  双击 三击 ctrl 切换虚拟桌面 end ========;


;==================== 选中复制 中键粘贴 =================;
; $*MButton::

; Hotkey, $*MButton Up, MButtonup, off
; KeyWait, MButton, T0.15
; If ErrorLevel = 1
; {
;     Hotkey, $*MButton Up, MButtonup, on
;     MouseGetPos, ox, oy
;     SetTimer, WatchTheMouse, 1
;     SystemCursor("Toggle")
; }
; Else
; {
;     IfInString, Title, Xshell
;     {

;     }
;     Else
;     {
;     Send {LButton}
;     SendInput ^v
;     }
; }
; return

; MButtonup:
; Hotkey, $*MButton Up, MButtonup, off
; SetTimer, WatchTheMouse, off
; SystemCursor("Toggle")
; return

; WatchTheMouse:
; MouseGetPos, nx, ny
; dy := ny-oy
; dx := nx-ox
; If (dx**2 > 0 and dx**2>dy**2) ;edit 4 for sensitivity (changes sensitivity to movement)
; {
;     times := Abs(dy)/1 ;edit 1 for sensitivity (changes frequency of scroll signal)
;     Loop, %times%
;     {
;         If (dx > 0)
;             Click WheelRight
;         Else
;             Click WheelLeft
;     }
; }
; If (dy**2 > 0 and dy**2>dx**2) ;edit 0 for sensitivity (changes sensitivity to movement)
; {
;     times := Abs(dy)/1 ;edit 1 for sensitivity (changes frequency of scroll signal)
;     Loop, %times%
;     {
;         If (dy > 0)
;             Click WheelDown
;         Else
;             Click WheelUp
;     }
; }
; MouseMove ox, oy
; return

; SystemCursor(OnOff=1)   ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
; {
;     static AndMask, XorMask, $, h_cursor
;         ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
;         , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
;         , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
;     if (OnOff = "Init" or OnOff = "I" or $ = "")       ; init when requested or at first call
;     {
;         $ = h                                          ; active default cursors
;         VarSetCapacity( h_cursor,4444, 1 )
;         VarSetCapacity( AndMask, 32*4, 0xFF )
;         VarSetCapacity( XorMask, 32*4, 0 )
;         system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
;         StringSplit c, system_cursors, `,
;         Loop %c0%
;         {
;             h_cursor   := DllCall( "LoadCursor", "uint",0, "uint",c%A_Index% )
;             h%A_Index% := DllCall( "CopyImage",  "uint",h_cursor, "uint",2, "int",0, "int",0, "uint",0 )
;             b%A_Index% := DllCall("CreateCursor","uint",0, "int",0, "int",0
;                 , "int",32, "int",32, "uint",&AndMask, "uint",&XorMask )
;         }
;     }
;     if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
;         $ = b  ; use blank cursors
;     else
;         $ = h  ; use the saved cursors

;     Loop %c0%
;     {
;         h_cursor := DllCall( "CopyImage", "uint",%$%%A_Index%, "uint",2, "int",0, "int",0, "uint",0 )
;         DllCall( "SetSystemCursor", "uint",h_cursor, "uint",c%A_Index% )
;     }
; }
; return

; ~LButton::
; cos_mousedrag_treshold := 20 ; pixels
; MouseGetPos, cos_mousedrag_x, cos_mousedrag_y
; win1 := WinActive("A")
; KeyWait LButton
; MouseGetPos, cos_mousedrag_x2, cos_mousedrag_y2
; win2 := WinActive("A")
; WinGetClass cos_class, A
; if(((abs(cos_mousedrag_x2 - cos_mousedrag_x) > cos_mousedrag_treshold
;   or abs(cos_mousedrag_y2 - cos_mousedrag_y) > cos_mousedrag_treshold)) and win1 = win2
;   and cos_class != "ConsoleWindowClass")
; {
;     IfInString, Title, Xshell
;     {

;     }
;     Else
;     {
;     SendInput ^c
;     }
; }
; return

; +MButton::
; Send {MButton}
; return
;==================== 选中复制 中键粘贴 end =============;


; #]::ToolTip,233,100,100
;;====================Feng Ruohang's AHK Script=====================;;
;;==================================================================;;
;;=========================CapsLock's Stuff=========================;;
;;==================================================================;;
SetCapsLockState, AlwaysOff


;;=============================Navigator============================||
;===========================;U = ctrl + z
; CapsLock & u::
; if getkeystate("alt") = 0
; Send, ^z
; else
; Send, +z
; return
; ;===========================;y = ctrl + c
; CapsLock & y::
; if getkeystate("alt") = 0
; Send, ^c
; else
; Send, +c
; return
; ;===========================;p = ctrl + v
; CapsLock & p::
; if getkeystate("alt") = 0
; Send, ^v
; else
; Send, +v
; return
; ;===========================;P = PageDown
; CapsLock & p::
; if getkeystate("alt") = 0
; Send, {PgDn}
; else
; Send, +{PgDn}
; return
;===========================;H = Left
CapsLock & h::
if getkeystate("alt") = 0
Send, {Left}
else
Send, +{Left}
return
;===========================;J = Down
CapsLock & j::
if getkeystate("alt") = 0
Send, {Down}
else
Send, +{Down}
return
;===========================;K = UP
CapsLock & k::
if getkeystate("alt") = 0
Send, {Up}
else
Send, +{Up}
return
;===========================;L = Right
CapsLock & l::
if getkeystate("alt") = 0
Send, {Right}
else
Send, +{Right}
return

; ;;=============================Deletor==============================||
; CapsLock & ,:: Send, {Del}              ; , = Del char after
; CapsLock & .:: Send, ^{Del}             ; . = Del word after
; CapsLock & /:: Send, +{End}{Del}        ; / = Del all  after

; CapsLock & m:: Send, {BS}               ; m = Del char before;
; CapsLock & n:: Send, ^{BS}              ; n = Del word before;
; CapsLock & b:: Send, +{Home}{Del}       ; b = Del all  before;

; ;;============================Special Char==========================||
; CapsLock & ':: Send, =                  ; ' = =
; CapsLock & `;:: Send, {Enter}           ; ; = Enter
; CapsLock & {:: Send, +9                 ; { = (
; CapsLock & }:: Send, +0;                ; } = )
; CapsLock & `:: Send, +``                ; Shift
; CapsLock & 4:: Send, +4
; CapsLock & 5:: Send, +5
; CapsLock & 6:: Send, +6
; CapsLock & 7:: Send, +7
; CapsLock & 8:: Send, +8
; CapsLock & 9:: Send, +9
; CapsLock & 0:: Send, +0
; CapsLock & -:: Send, +-
; CapsLock & =:: Send, +=
; CapsLock & \:: Send, +=
; ;;============================Editor================================||
; CapsLock & z:: Send, ^z                 ; Z = Cancel
; CapsLock & x:: Send, ^x                 ; X = Cut
; CapsLock & c:: Send, ^c                 ; C = Copy
; CapsLock & v:: Send, ^v                 ; V = Paste
; CapsLock & a:: Send, ^a                 ; A = Select All
; CapsLock & y:: Send, ^y                 ; Y = Redo
;;===========================Controller=============================||
; CapsLock & s:: Send, ^{Tab}             ; Switch Tag    S = {Ctr + Tab}
; CapsLock & w:: Send, ^w                 ; Close Tag     W = {Ctr + W}
; CapsLock & q:: Send, !{F4}              ; Close Window  Q = {Alt + F4}
CapsLock::Send, {ESC}                   ; Vimer's love  Capslock = {ESC}
;;=========================Application==============================||
; CapsLock & d:: Send, !d                 ; Dictionary    D = {Alt + D}
; CapsLock & f:: Send, !f                 ; Everything    F = {Alt + F}
; CapsLock & g:: Send, !g                 ; Reversed      G = {Alt + G}
; CapsLock & e:: Run http://cn.bing.com/  ; Run Explore   E = {Explore}
; CapsLock & r:: Run Powershell           ; Run Powersh   R = {Powershell}
; CapsLock & t:: Run C:\Program Files (x86)\Notepad++\notepad++.exe
                    ; Run Notepad++ T = {Text Editor}

;;==================================================================;;
;;=========================CapsLock's Stuff=========================;;
;;==================================================================;;


;;========================test======================================
; ::abc::233  ;;按下abc后接空格 逗号 回车会出现233加空格 逗号 回车
;;#]::send,%clipboard%



;==================== 我的 ==============================;
; ::...::
; send,->
; return
::va::
send,echo "<pre>";var_dump($);die;{left}{left}{left}{left}{left}{left}
return
::al::
send,alert();{left}{left}
return
; ::ff::
; send,win firefox{down}
;return
::lo::
send,log_message('error',__METHOD__.'::'.__LINE__.':: data is : '.var_export($,true));{left}{left}{left}{left}{left}{left}{left}{left}
return


;; ::vi::
;; send,vim -u ~/.vimrc_x{Space}
;; Return

;按F9多次，输出不同的值
f9::
strA:="a-b-c-d-e-sdaf"
a++
send % strsplit(strA,"-")[a]
if(a=strsplit(strA,"-").MaxIndex())
    a=0
return
f8::
send % a
return




; ~LControl::
; if (A_PriorHotkey <> "~LControl" or A_TimeSincePriorHotkey > 200)
; {
;     ; 两次按下时间间隔太长, 所以这不是一个两次按下.
;     KeyWait, RControl
;     return
; }
; MsgBox You double-pressed the right control key.
; return

; ;;按ctrl显示鼠标位置
; ~LControl::
; ;设定时钟为3000ms
; SetTimer, M_Tip, 1500
; ;光标处提示
; ToolTip, \>_</
; return
; M_Tip:
; ;关闭时钟
; SetTimer, M_Tip, Off
; ;关闭提示
; ToolTip
; return ;End



; 示例 #3: 检测热键的单次, 两次和三次按下. 这样允许热键根据您按下次数的多少
; 执行不同的操作：
; ; ~LControl::
; #d::
; if winc_presses > 0 ; SetTimer 已经启动, 所以我们记录键击.
; {
;     winc_presses += 1
;     return
; }
; ; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动 计时器：
; winc_presses = 1
; SetTimer, KeyLcontrol, 400 ; 在 300 毫秒内等待更多的键击.
; return

; KeyLcontrol:
; SetTimer, KeyLcontrol, off
; if winc_presses = 1 ; 此键按下了一次.
; {
;     ; Run, m:\  ; 打开文件夹.
;     ; Send, {Control}
; }
; else if winc_presses = 2 ; 此键按下了两次.
; {
;     ; Run, m:\multimedia  ; 打开不同的文件夹.
;     MsgBox, Two clicks detected.
;     ; Send, ^#{Right}
; }
; else if winc_presses > 2
; {
;     MsgBox, Three or more clicks detected.
;     ; Send, ^#{Left}
; }
; ; 不论触发了上面的哪个动作, 都对 count 进行重置
; ; 为下一个系列的按下做准备:
; winc_presses = 0
; return


; AppsKey & Right::
; Send,^#{Right}
; Return
; AppsKey & Left::
; Send,^#{Left}
; Return
; Right & AppsKey::
; Send,^#{Right}
; Return
; Left & AppsKey::
; Send,^#{Left}
; Return

;;1cliporad 需要在1cliporad配置
#z::
Send, !^+{F12}
return

;==========================================================;

; !s::
; IfWinExist, ahk_class Xshell::MainFrame_0
; {
;     ;WinActivate  ; 自动使用上面找到的窗口.
;     ; WinMaximize  ; 同上
;     Send, !s^+t 
;     return
; }

; IfWinNotExist, ahk_class Xshell::MainFrame_0
; {
; 	Send, !s
; 	return
; }
; return

;==ahk取色脚本
;使用ctrl+Alt+c
; ^!c::
; ;获得鼠标位置x,y
; MouseGetPos, MouseX, MouseY
; ;获得x,y处RGB颜色,以0xRRGGBB格式赋值于color
; PixelGetColor, color, %MouseX%, %MouseY%, RGB
; ;设定时钟为3000ms
; SetTimer, RemoveToolTip, 3000
; ;光标处提示
; ToolTip, %color%
; return
; RemoveToolTip:
; ;关闭时钟
; SetTimer, RemoveToolTip, Off
; ;关闭提示
; ToolTip
; return ;End


;==当前时间 Y-m-d H:i:s
;ctrl+alt+t
^!T::
d = %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%
;获得系统时间比如今天的时间：2011-09-16。如果需要“年”的话请替换上面的“-”。
;clipboard = %d%
;把 d 的值发送到剪贴板，变量是不用声明的，想引用变量的值，就在变量的前后加“%”。第二行的变量是 AHK 自带的变量。
Send %d%
return


; !j::
; Send, !{tab}
; Return

; $ctrl::
; Send, #^{Right}
; return

; $alt::
; Send, #^{Left}
; return

; $AltDown::
; send 233
; return


; !k::
; MsgBox, 4, , Would you like to continue?
; IfMsgBox, No
;     return
; ; 否则, 用户选择了是.
; MsgBox You pressed YES.
; Return




;;------GUI
; !l::
; Gui, Add, Text,, Please enter your name:
; Gui, Add, Edit, vName
; Gui, Show

; gui, add, edit, w600  ; 在窗口的顶部添加一个非常宽的编辑控件.
; gui, add, text, section, First Name:  ; 保存此控件位置并定义一个新控件段.
; gui, add, text,, Last Name:
; gui, add, edit, ys  ; 在此控件段中开始一个新列.
; gui, add, edit
; gui, show
; GuiClose:
; ExitApp
; return

;;;;;;;;;;;;;;练习
;;q & n::   ;;先按下
;;run Notepad
;;return

;;切换到xshell中
;;检查xshell是否在运行
#x::
IfWinExist,ahk_exe Xshell.exe
{
	;;切换到xshell
    WinActivate
}
else
{
	;;启动xshell,等待xshell启动,切换到xshell
    Run "C:\Program Files (x86)\NetSarang\Xshell 5\Xshell.exe"
    WinWait ahk_exe Xshell.exe
    WinActivate
}
return

; #v::
; IfWinExist,ahk_exe ConEmu64.exe
; {
;     ;;切换到xshell
;     WinActivate
; }
; else
; {
;     ;;启动xshell,等待xshell启动,切换到xshell
;     Run "C:\tools\cmder\Cmder.exe"
;     WinWait ahk_exe ConEmu64.exe
;     WinActivate
; }
; return

#s::
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
IfWinExist,ahk_exe cloudmusic.exe
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
    Run "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE"
    WinWait ahk_exe ONENOTE.EXE
    WinActivate
}
return

/*
#g::
IfWinExist,ahk_exe chrome.exe
{
    ;;切换到xshell
    WinActivate
}
else
{
    ;;启动xshell,等待xshell启动,切换到xshell
    Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    WinWait ahk_exe chrome.exe
    WinActivate
}
return

*/

;;占用的是原来的windows link 的快捷键
;;修改成呼出微信的快捷键
#w::
Send, ^+!{F11}     ;;ctrl + shift + alt + F11
return
; #w::
; IfWinExist,ahk_exe WeChat.exe
; {
;     WinActivate
; }
; else
; {
;     Run "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
;     WinWait ahk_exe WeChat.exe
;     WinActivate
; }
; return


;;最小化一个窗口
;;如果 WinTitle 为字母 A 且其他三个窗口参数（WinText、ExcludeTitle 和 ExcludeText）都为空或省略，则使用活动窗口。
id := WinExist("A") 
; #Up::WinMaximize, A  ;;最大化
#Esc::WinMinimize, A   ;;最小化
return




;; 滚轮使用
; ~LControl & WheelUp::  ;; 向左滚动.
; ControlGetFocus, fcontrol, A
; Loop 2  ; <-- 增加这个值来加快滚动速度.
;     SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 0 是 SB_LINELEFT.
; return

; ~LControl & WheelDown::  ; 向右滚动.
; ControlGetFocus, fcontrol, A
; Loop 2  ; <-- 增加这个值来加快滚动速度.
;     SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 是 WM_HSCROLL, 它后面的 1 是 SB_LINERIGHT.
; return


;; 滚轮切换桌面
~LWin & WheelUp::
ControlGetFocus, fcontrol, A
Loop 1  ; <-- 增加这个值来加快滚动速度.
    send ^#{Left}
return

~LWin & WheelDown::
ControlGetFocus, fcontrol, A
Loop 1  ; <-- 增加这个值来加快滚动速度.
    send ^#{right}
return

^!k::
send ^#{right}
Return

^!j::
send ^#{Left}
Return

;;鼠标中建
; ~RButton & MButton::
; send #{tab}
; return

;;将shift + 空格 切换全角字符屏蔽 
+Space::
return

;;模拟linux ctrl + u的效果  删除本行
;;#IfWinNotActive ahk_exe Xshell.exe  ;;不在xshell上执行下面的脚本
#IfWinNotActive,ahk_group SH
^u::  
    send +{Home}{BackSpace}
return


;; qq的快捷键  需要求设置
#q::
Send, !^+{F2}
return


; WheelLeft::send,^#{left}
; WheelRight::send,^#{right}
