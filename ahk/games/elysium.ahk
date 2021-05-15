; elysium.ahk
; J. Braden Chancellor
; 
; This script provides better keybindings for the game Disco Elysium, as the game does not allow key remapping.

#MaxHotkeysPerInterval 1000     ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.

SendMode Input                  ; Faster, more reliable than Send.
SetTitleMatchMode, 3            ; Forces exact matches for window titles.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.

#IfWinActive ahk_exe disco.exe
b::Send i
g::Send j
v::Send m