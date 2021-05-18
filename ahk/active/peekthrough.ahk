; peekthrough.ahk
; This script enables adjustable transparency for windows.

#MaxHotkeysPerInterval 1000
#SingleInstance Force
#NoEnv

SendMode Input
SetWorkingDir %A_ScriptDir%  ; Sets consistent starting directory.

TLevel = 190

#^Esc::
	WinGet, CurrentTLevel, Transparent, A
	If (CurrentTLevel = OFF) {
		WinSet, Transparent, %TLevel%, A
	} Else {
		WinSet, Transparent, OFF, A
	}
return

SetTransparency:
	WinGet, CurrentTLevel, Transparent, A
	WinSet, Transparent, %TLevel%, A
return


#^=::
	TLevel += 10
	If TLevel >= 255
	{
		TLevel = 255
	}

	Gosub, SetTransparency
return

#^-::
	TLevel -= 10
	If TLevel <= 0
	{
		TLevel = 0
	}

	Gosub, SetTransparency
return
