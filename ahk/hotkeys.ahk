; hotkeys.ahk
; This script sets up several keyboard shorcuts to boost productivity. Note 
; that it is designed for a Windows 10 (1607+) machine running WSL and MinTTY.

#MaxHotkeysPerInterval 1000
#NoEnv
#SingleInstance, Force

SendMode Input
SetTitleMatchMode, 3                ; Forces complete matches for window titles.
SetWorkingDir %A_ScriptDir%         ; Sets consistent working directory.

; Rebind Caps Lock to Ctrl and Shift+RCtrl to Caps Lock.
Capslock::Ctrl
+RCtrl::Capslock

; Rebind Rwin to the Application key. Fixes problem with KBP V80 keyboard.
RWin::AppsKey

; Bind mousewheel to volume and browser media controls.
!+WheelUp::Send {Volume_Up}
!+WheelDown::Send {Volume_Down}
!+MButton::Send {Volume_Mute}
^!MButton::Send ^+{Up}

; Open, focus, and resize wsl-terminal.
!`::
Process, Exist, mintty.exe
if !ErrorLevel
{
	Run "C:\utilities\wsl-terminal\wsl-terminal.lnk"
}
;Send ^+2
WinWaitActive, ahk_class mintty
WinMove, ahk_class mintty, , 0, 0, 1280, 720
WinSet, Style, -0xC00000, ahk_class mintty
Return

; Keep active window on top. Press again to disable.
^+Space::Winset, AlwaysOnTop, , A

; Reload script.
+^`::Reload
