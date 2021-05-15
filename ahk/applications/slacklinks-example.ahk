; slacklink.ahk
; J. Braden Chancellor
; 
; This script provides an example of creating formatted hyperlinks
; in Slack via hotstrings. Overly commented to aid understanding.

#MaxHotkeysPerInterval 1000     ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.

SendMode Input                  ; Faster, more reliable than Send.
SetTitleMatchMode, 3            ; Forces exact matches for window titles.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.

; This is the hotstring itself. Placing :X: at the front, rather than 
; just ::, makes it call a function.
:X:*test::test()

; This is an example of a link function. It has three parts:
; 1. The part of the post before the link
; 2. The call to the slackLink function, which creates the formatted hyperlink.
; 3. The part of the post after the link
test()
{
	Send Please go to the
	slackLink("2FA Reset Page","https://ibm.biz/2fa-reset")
	Send and reset the user's 2FA methods.
}

; This is the slackLink function, which creates a formatted hyperlink in Slack.
slackLink(text, link)
{
	Send {SPACE}		; Separate the link from the pre-link post.
	Send ^+U			; Open Slack's hyperlink window. Wait 0.5 seconds to confirm.
	Sleep 500
	Send %text%			; Send the text of the hyperlink, displayed to the user
	Send {TAB}
	Send %link%			; Send the link itself.
	Send {Enter}
}