; games.ahk
; FitzWM
;
; This script includes hotkeys and fixes for various games.

#MaxHotkeysPerInterval 1000     ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.

SendMode Input                  ; Faster, more reliable than Send.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.

; Disco Elysium
#IfWinActive ahk_exe disco.exe
b::Send i
g::Send j
v::Send m

; Dragon Age 3: Inquisition
#IfWinActive, ahk_exe DragonAgeInquisition.exe

~RButton::GoSub, Stop
~LButton Up::GoSub, Stop
~RButton Up::GoSub, Stop
~RButton & LButton::GoSub, Move

Move:
{
    Send, {W Down}
} Return

Stop:
{
    Send, {W Up}
} Return

; Elder Scrolls Online
;IfWinActive, ahk_class EsoClientWndClass
;LShift::
;    if GetKeyState("LShift") ; LShift is logically down. Release it.
;        Send {Blind}{LShift Up}
;    else ; LShift is logically up. Press it.
;        Send {Blind}{LShift Down}
;return