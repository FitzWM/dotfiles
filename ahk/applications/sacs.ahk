; sacs.ahk
; This script sets various hotkeys to make SACS work more like a modern program.

#MaxHotkeysPerInterval 1000
#NoEnv
#SingleInstance force

SendMode Input
SetTitleMatchMode Regex
SetWorkingDir %A_ScriptDir%

; Allow SACS to mimic Windows Taskbar functionality. Launch if closed and focus
; if open.
#s::
if !WinExist("ahk_exe hMenu.exe")
{
	Run C:\Users\Braden\Documents\work\SACS
	WinWait SACS\ Login
	WinActivate SACS\ Login
}
else
{
	WinActivate ahk_exe hMenu.exe
}
Return

; Create universal SACS shortcuts for Close and Advanced Search.
#IfWinActive ahk_class WindowsForms10\.Window\.8\.app\.0\.141b42a
Esc::Send !{F4}
F2::
Send {Tab}
Send {Space}
Send {F5}
Send {Tab}
Return
Return

; Automatically tab into selection field after searching. Normal Enter otherwise.
#IfWinActive Advanced\ Search
Enter::
presses += 1
if (Mod(presses, 2) != 0)
{
	Send {Enter}
	Send {Tab}
	Send {Tab}
	Send {Tab}
}
else
{
	Send {Enter}
}
Return
Return
