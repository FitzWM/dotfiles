; hotkeys.ahk
; This script sets up several keyboard shorcuts to boost productivity.

#MaxHotkeysPerInterval 1000
#NoEnv
#SingleInstance, Force

SendMode Input
SetTitleMatchMode, 3                ; Forces complete matches for window titles.
SetWorkingDir %A_ScriptDir%         ; Sets consistent working directory.

; Rebind Caps Lock to Ctrl and Shift+RCtrl to Caps Lock.
+RCtrl::Capslock
Capslock::Ctrl

; Open or focus Windows Terminal.
!`::
Process, Exist, WindowsTerminal.exe
if !ErrorLevel
{
    Run "C:\utilities\shortcuts\Terminal.lnk"
}
WinActivate, ahk_exe WindowsTerminal.exe
Return

; Bind mousewheel to volume controls.
!+WheelUp::Send {Volume_Up}
!+WheelDown::Send {Volume_Down}
!+MButton::Send {Volume_Mute}

; Set active window to be always on top.
^+Space::Winset, AlwaysOnTop, , A


; Reload script.
+^`::Reload
