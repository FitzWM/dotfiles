; slack.ahk
; FitzWM
; 
; This script includes many hotkeys for work on the Desk.

#MaxHotkeysPerInterval 1000     ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.

SendMode Input                  ; Faster, more reliable than Send.
SetTitleMatchMode, 3            ; Forces exact matches for window titles.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.

#IfWinActive ahk_exe slack.exe

; slackLink Functions
:X:*test::testSL()
:X:*msteams::msTeams()

; Text Expansions
::*2fa::I reset the user's 2FA methods. Please have them log in to https://ibm.biz/w3id-2fa-settings with w3id credentials to set up the methods again.

::*any::Is there anything else I can help you with today?

::*bc::Braden Chancellor

::*dc::Thank you for contacting the Windows 10 Help Desk. I am disconnecting this chat due to lack of response. If you still need assistance, please contact us at 1 (888) 426-4357.

::*end::Thank you for contacting the Windows 10 Help Desk. Have a wonderful rest of your day{!}

::*2min::It appears that you've been away for a while. I'll need to close the chat if I don't hear from you in the next couple of minutes.

::*ga1::Good afternoon, this is Braden with the Windows 10 Help Desk in Austin, TX. Please give me a few minutes while I create a new support ticket for you. How are you doing today?

::*ga2::Good afternoon, this is Braden with the Windows 10 Help Desk in Austin, TX. Please give me a few minutes while I review your support ticket. How are you doing today?

::*gm1::Good morning, this is Braden with the Windows 10 Help Desk in Austin, TX. Please give me a few minutes while I create a new support ticket for you. How are you doing today?

::*gm2::Good morning, this is Braden with the Windows 10 Help Desk in Austin, TX. Please give me a few minutes while I review your support ticket. How are you doing today?

::*mind::Do you mind if I remote into your computer?

::*no2fa::I'm not seeing anything to reset for this user. Could you have them go to https://ibm.biz/w3id-2fa-settings and try to set up their 2FA there?

::*teams::We do not support MS Teams, as our licenses for Office 365 do not include it. See here: https://w3.ibm.com/help/#/article/microsoft_teams
+{ENTER}+{ENTER}The user will need to be invited as a guest by the client. Instructions are linked from the above article.

::*qac::Quick Assist should ask you for a code. Your code is 

::*qao::Could you go to your Start menu and type in "quick assist" for me, please?

msTeams()
{
    Send We do not support MS Teams, as our licenses for Office 365 do not include it. See
    slackLink("Microsoft Teams","https://w3.ibm.com/help/#/article/microsoft_teams")
    Send on Help@IBM.
}

; This is the slackLink function itself.
slackLink(text, link)
{
    Send {SPACE}        ; Separate %link% from the preceding string.
    Send ^+U            ; Open Slack's hyperlink window. 

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
        Send %text%         ; Send the text of the hyperlink, displayed to the user
        Send {TAB}
        Send %link%         ; Send the link itself.
        Send {Enter}
    }
    else
    {
        Send % "ERROR: Could not locate hyperlink popup."
        return 1
    }
    
    return
}

testSL()
{
    startMS := A_TickCount
    Send Please go to the
    slackLink("2FA Reset Page","https://ibm.biz/2fa-reset")
    Send and reset the user's 2FA methods.
    endMS := A_TickCount
    Send % " " endMS - startMS "ms"
    
    return
}

#IfWinActive
