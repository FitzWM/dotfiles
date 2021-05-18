; taskbar.ahk 
; This script works with VirtuaWin to enable Mac-style virtual desktops. The
; hotkeys run their application if it's not running, switch to the appropriate
; virtual desktop, and focus the window. 

#MaxHotkeysPerInterval 1000     ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.

SendMode Input                  ; Faster, more reliable than Send.
SetTitleMatchMode, 3            ; Forces exact matches for window titles.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.

; VirtuaWin configuration. Provides Mac-style virtual desktop functionality
; by opening the window when the process doesn't exist and focusing it when 
; it does.

#1::
Process, Exist, xplorer2.exe
if !ErrorLevel
{
	Run "C:\Program Files\zabkat\xplorer2\xplorer2_64.exe"
}
Send ^+1
Sleep, 100
WinRestore, ahk_exe xplorer2.exe
WinActivate, ahk_exe xplorer2.exe
Return

#2::
Process, Exist, chrome.exe
if !ErrorLevel
{
	Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
}
Send ^+2
Sleep, 100
if !WinExist("ahk_exe chrome.exe")
{
	WinRestore, ahk_exe chrome.exe
}
WinActivate, ahk_exe chrome.exe
Return

#3::
Process, Exist, steam.exe
if !ErrorLevel
{
	Run "C:\playing\steam\Steam.exe"
}
Send ^+4
Sleep, 100
WinRestore, ahk_exe steam.exe 
WinActivate, ahk_exe steam.exe
Return

#4::
Process, Exist, mumble.exe
if !ErrorLevel
{
	Run "C:\Program Files\Mumble\mumble.exe"
}
Send ^+2
Sleep, 100
WinRestore, ahk_exe mumble.exe
WinActivate, ahk_exe mumble.exe
Return
