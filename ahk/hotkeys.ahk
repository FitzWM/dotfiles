; hotkeys.ahk
; This script sets up several keyboard shorcuts to boost productivity. Note 
; that it is designed for a Windows 10 (1607+) machine running WSL and MinTTY.

#MaxHotkeysPerInterval 1000
#NoEnv
#SingleInstance, Force

SendMode Input
SetTitleMatchMode, 3                ; Forces complete matches for window titles.
SetWorkingDir %A_ScriptDir%         ; Sets consistent working directory.

Run, audio-switcher.ahk

; Rebind Caps Lock to Ctrl and Shift+RCtrl to Caps Lock.
+RCtrl::Capslock
Capslock::Ctrl

; Rebind Rwin to the Application key. Fixes problem with KBP V80 keyboard.
RWin::AppsKey

; Bind mousewheel to volume controls.
!+WheelUp::Send {Volume_Up}
!+WheelDown::Send {Volume_Down}
!+MButton::Send {Volume_Mute}

; Open, focus, and resize wsl-terminal.
;!`::
;Process, Exist, mintty.exe
;if !ErrorLevel
;{
;	Run "C:\utilities\wsl-terminal\open-wsl.exe"
;}
;;Send ^+2
;WinWaitActive, ahk_class mintty
;WinMove, ahk_class mintty, , 0, 0, 1280, 720
;WinSet, Style, -0xC00000, ahk_class mintty
;Return

; Set active window to be always on top.
;^+Space::Winset, AlwaysOnTop, , A


; Reload script.
+^`::Reload