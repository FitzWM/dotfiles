; hotkeys.ahk
; FitzWM
;
; This script sets up several keyboard shorcuts to boost productivity.

#MaxHotkeysPerInterval 10000    ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.
#KeyHistory 0                   ; Disable key history for performance.

SendMode Input                  ; Faster, more reliable than Send.
SetTitleMatchMode, 2            ; Fuzzy window title matching.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.
SetBatchLines -1                ; Prevent per-line 10ms sleep
ListLines Off                   ; Disable line history for performance.
Process, Priority, , A          ; Set AboveNormal process priority.

; Rebind Caps Lock to Ctrl and Shift+RCtrl to Caps Lock.
;+RCtrl::Capslock
;Capslock::Ctrl

; Rebind Scroll Lock to Ctrl+Shift+\. Makes it bindable.
ScrollLock::^+\

; Open or focus Windows Terminal.
;!`::
; Open Windows Terminal if it isn't running.
;Process, Exist, WindowsTerminal.exe
;if !ErrorLevel
;{
;    Run "C:\utilities\shortcuts\Terminal.lnk"
;}

; If Windows Terminal is the active window, minimize it. Else, focus it.
;ifWinActive, ahk_exe WindowsTerminal.exe
;{
;    WinMinimize
;}
;else
;{
;    WinShow, ahk_exe WindowsTerminal.exe
;    WinActivate, ahk_exe WindowsTerminal.exe
;    WinWaitActive, ahk_exe WindowsTerminal.exe
;}
;WinSet, Transparent, 220, A
;Return

; Bind mousewheel to volume controls.
!+WheelUp::Send {Volume_Up}
!+WheelDown::Send {Volume_Down}
!+MButton::Send {Volume_Mute}

; Set active window to be always on top.
^+Space::Winset, AlwaysOnTop, , A

; Reload script.
+^`::Reload

; Include scripts in active directory.
#Include *i active\games.ahk
#Include *i active\peekthrough.ahk
#Include *i active\slack.ahk
