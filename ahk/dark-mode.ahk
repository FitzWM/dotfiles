; dark-mode.ahk
; This script sets the Windows theme to a custom Dark theme, powered by UXStyle,
; and then closes the Themes window.
 
#MaxHotkeysPerInterval 1000
#NoEnv
#SingleInstance, Force

SendMode Input
SetTitleMatchMode, 3                ; Forces complete matches for window titles.
SetWorkingDir %A_ScriptDir%         ; Sets consistent working directory.

Run "C:\Users\braden\AppData\Local\Microsoft\Windows\Themes\Dark.theme"
WinWait, Personalization
Sleep, 750
WinClose, Personalization
