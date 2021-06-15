#Include VA.ahk
#Persistent		; This keeps the script running permanently.
#SingleInstance	force	; Only allows one instance of the script to run.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Win+A to change Audio Playback Device
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#a::
	device := VA_GetDevice("playback")
	deviceName := VA_GetDeviceName(device)

	if InStr(deviceName, "ZxR")
	{
		Run C:\utilities\nircmd\nircmd setdefaultsounddevice "Klipsch" 1
		Run C:\utilities\nircmd\nircmd setdefaultsounddevice "Klipsch" 2
		audioSwitchBox("Klipsch")
	}
	else if InStr(deviceName, "Klipsch")
	{
		Run C:\utilities\nircmd\nircmd setdefaultsounddevice "Buds" 1
		Run C:\utilities\nircmd\nircmd setdefaultsounddevice "Buds" 2
		audioSwitchBox("Buds")
	}
	else if InStr(deviceName, "Buds")
	{	
		Run C:\utilities\nircmd\nircmd setdefaultsounddevice "55S421" 1
		Run C:\utilities\nircmd\nircmd setdefaultsounddevice "55S421" 2
		audioSwitchBox("55S421")
	}
	else if inStr(deviceName, "55S421")
	{
		Run C:\utilities\nircmd\nircmd setdefaultsounddevice "ZxR" 1
		Run C:\utilities\nircmd\nircmd setdefaultsounddevice "ZxR" 2
		audioSwitchBox("ZxR")
	}
	else
	{
		audioSwitchBox("Error: Odd device")
	}
Return

#b::
	test := VA_GetDevice("playback")
	testName := VA_GetDeviceName(test)
        test2 := VA_GetDevice(Buds)
	audioSwitchBox(test2)
Return

; Display sound toggle GUI
audioSwitchBox(Device)
{
	IfWinExist, soundToggleWin
	{
		Gui, destroy
	}
	
	Gui, +ToolWindow -Caption +0x400000 +alwaysontop
	Gui, Add, text, x35 y8, Default sound: %Device%
	SysGet, screenx, 0
	SysGet, screeny, 1
	xpos:=screenx-500
	ypos:=screeny-150
	Gui, Show, NoActivate x%xpos% y%ypos% h30 w200, soundToggleWin
	
	SetTimer,audioSwitchClose, 2000
}
audioSwitchClose:
    SetTimer,audioSwitchClose, off
    Gui, destroy
Return
