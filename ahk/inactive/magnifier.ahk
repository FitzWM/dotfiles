; magnifier.ahk
; This script allows Windows Magnifier to run without the infuriating options
; menu or floating magnifying glass. It also enables shortcuts for color inver-
; sion and closing the Magnifier. Note that the window disappears after the
; SECOND press, not the first.

#MaxHotkeysPerInterval 1000     ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.

SendMode Input                  ; Faster, more reliable than Send.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.

!#`::Send #{Esc}	; Alt+Win+` to close.
!#1::ZoomOut()		; Alt+Win+1 OR Win+- to zoom out.
 #-::ZoomOut()
!#2::ZoomIn()		; Alt+Win+2 OR Win+= to zoom in.
 #=::ZoomIn()
!#3::Send ^!i		; Alt+Win+3 to invert colors.

ZoomIn()
{
	Critical
	Send, #=
	PostMessage, 0x112, 0xF020,,, ahk_class MagUIClass
	WinHide ahk_class MagUIClass
}

ZoomOut()
{
	Critical
	DetectHiddenWindows, On
	if !WinExist("ahk_class MagUIClass")
		return
	DetectHiddenWindows, Off
	Send, #-
	PostMessage, 0x112, 0xF020,,, ahk_class MagUIClass
	WinHide ahk_class MagUIClass
	;KeyWait, 1, T0.7
	if ErrorLevel
		PostMessage, 0x112, 0xF060,,, ahk_class MagUIClass
	return
}
