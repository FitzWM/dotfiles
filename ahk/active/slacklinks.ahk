; slacklinks.ahk
; FitzWM
; 
; This script contains functions for creating formatted hyperlinks in Slack via 
; hotstrings.

#MaxHotkeysPerInterval 1000     ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.

SendMode Input                  ; Faster, more reliable than Send.
SetTitleMatchMode, 3            ; Forces exact matches for window titles.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.

msTeams()
{
	Send We do not support MS Teams, as our licenses for Office 365 do not include it. See
	slackLink("Microsoft Teams","https://w3.ibm.com/help/#/article/microsoft_teams")
	Send on Help@IBM.
}

; This is the slackLink function itself.
slackLink(text, link)
{
	Send {SPACE}		; Separate %link% from the preceding string.
	Send ^+U			; Open Slack's hyperlink window. 

	; Get window dimensions and store them in winWidth and winHeight.
	WinGetPos,,, winWidth, winHeight, ahk_exe slack.exe
	start := A_TickCount
	found := true
	
	; Wait until background fade for hyperlink window appears.
	while (bgColor == 0x1A1D21 || time <= (start + 250))
	{
		PixelGetColor, bgColor, floor(winWidth / 2), floor(winHeight * 0.98), RGB
		time := A_TickCount
		
		if (time >= (start + 1000))
		{
			found := flase
			break
		}
	}
	if found
	{
		Send %text%			; Send the text of the hyperlink, displayed to the user
		Send {TAB}
		Send %link%			; Send the link itself.
		Send {Enter}
	}
	else
	{
		Send % "ERROR: Could not locate hyperlink popup."
		return 1
	}
	
	return
}

; Enables testing function.
if WinActive, ahk_exe slack.exe
{
    :X:*test::test()
}

test()
{
	startMS := A_TickCount
	Send Please go to the
	slackLink("2FA Reset Page","https://ibm.biz/2fa-reset")
	Send and reset the user's 2FA methods.
	endMS := A_TickCount
	Send % " " endMS - startMS "ms"
	
	return
}
