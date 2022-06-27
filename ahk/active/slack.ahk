; slack.ahk
; FitzWM
; 
; This script includes many hotkeys for work on the Desk.

#MaxHotkeysPerInterval 10000    ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.
#KeyHistory 0                   ; Disable key history for performance.

SendMode Input                  ; Faster, more reliable than Send.
SetTitleMatchMode, 3            ; Forces exact matches for window titles.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.
SetBatchLines -1                ; Prevent per-line 10ms sleep
ListLines Off                   ; Disable line history for performance.
Process, Priority, , A          ; Set AboveNormal process priority.

#IfWinActive ahk_exe slack.exe

; Split-view integration
MButton::Send ^{Click left}

; QoL
PgUp::Send {LButton}{Home}
PgDn::Send {LButton}{End}

; Standard Hotstrings
::*2fa::I reset the user's 2FA methods. Please have them log in to https://ibm.biz/w3id-2fa-settings with w3id credentials to set up the methods again.

::*any::Is there anything else I can help you with today?

::*ap::Approved.

::*bc::Braden Chancellor

::*bl::Bitlocker key sent to manager.

:r0:*c42::
( Join
To transfer data from their old account to their new one:+{ENTER}
1. Uninstall Code42 completely, including AppData and ProgramData folders. Reboot.+{ENTER}
Reinstall Code42 from this link: https://ibm.box.com/s/przw3swmen4reo3r7tkyxb71dulvft4p and use "central.crashplan.com" as the server when asked.+{ENTER}
Log in under the old account.+{ENTER}
Download everything.+{ENTER}
Open the Code42 console using Ctrl-Shift-C, and then enter command "deauthorize".+{ENTER}
Log in under the new account.+{ENTER}
Set up their new backup.
)

::*col::Does the user have any colleagues with a working connection? That's usually the quickest way to find working Notes links.

::*dc::Thank you for contacting the Windows 10 Help Desk. I am disconnecting this chat due to lack of response. If you still need assistance, please contact us at 1 (888) 426-4357.

::*dism::Basically, DISM repairs your Windows component store (C:\Windows\WinSxS) by comparing it with Microsoft's servers, and SFC repairs your actual system files by comparing them with your component store. +{ENTER} +{ENTER} So, if you run SFC before DISM, you run the risk of replacing working files with corrupt ones from a corrupt component store. And if you run DISM without SFC, you only repair the component store, not the actual system files.

::*end::Thank you for contacting the Windows 10 Help Desk. Have a wonderful rest of your day{!}

::*2min::It appears that you've been away for a while. I'll need to close the chat if I don't hear from you in the next couple of minutes.

::*ga1::Good afternoon, this is Braden with the Windows 10 Help Desk in Austin, TX. Please give me a few minutes while I create a new support ticket for you. How are you doing today?

::*ga2::Good afternoon, this is Braden with the Windows 10 Help Desk in Austin, TX. Please give me a few minutes while I review your support ticket. How are you doing today?

::*gm1::Good morning, this is Braden with the Windows 10 Help Desk in Austin, TX. Please give me a few minutes while I create a new support ticket for you. How are you doing today?

::*gm2::Good morning, this is Braden with the Windows 10 Help Desk in Austin, TX. Please give me a few minutes while I review your support ticket. How are you doing today?

::*mind::Do you mind if I remote into your computer?

::*no2fa::I'm not seeing anything to reset for this user. Could you have them go to https://ibm.biz/w3id-2fa-settings and try to set up their 2FA there?

::*ob::This user is still in onboarding. They won't be able to set up until that's done and GMX_AAD has automatically migrated their info from BluePages to Endpoint.

::*pers::If it's a personal device (non-IBM), we can have the Beekeeper team remove it from the user's account. Please get the following and escalate the ticket to CIO_InfoSec, along with the Beekeeper PDT:+{ENTER}- w3id+{ENTER}Device name+{ENTER}Device serial

::*teams::We do not support MS Teams, as our licenses for Office 365 do not include it. See here: https://w3.ibm.com/help/#/article/microsoft_teams
+{ENTER}+{ENTER}The user will need to be invited as a guest by the client. Instructions are linked from the above article.

::*qac::Quick Assist should ask you for a code. Your code is 

::*qao::Could you go to your Start menu and type in "quick assist" for me, please?

:r0:*ta::Looks good! Tagged.

; slackLink Hotstrings
:X:*gd::escGlobalDomino()
:X:*isc::escISC()
:X:*test::testSL()
:X:*msteams::msTeams()

;^+f::fixPings()

escGlobalDomino()
{
    Send Go ahead and escalate to the Global Domino team using the PDT in the
    slackLink("Global Domino IH","https://ibm.service-now.com/kb_view.do?sys_kb_id=666da8e91ba434d0fe491131b24bcb57&sysparm_rank=1&sysparm_tsqueryId=3828b5c91b78fc10693fdac4bd4bcbfc")
    Send {Backspace}.{Space}
    Send Just let me know before sending, and I'll tag it.
}

escISC()
{
    Send All support for ISC is provided through direct ticketing via the 
    slackLink("IBM Sales Cloud (ISC)","https://w3.ibm.com/help/#/article/ibm_sales_cloud/overview")
    Send article on Help@IBM. Please have the user go there and create a ticket with their issue.
}

msTeams()
{
    Send We do not support MS Teams, as our licenses for Office 365 do not include it. See
    slackLink("Microsoft Teams","https://w3.ibm.com/help/#/article/microsoft_teams")
    Send on Help@IBM.
}

fixPings()
{
   Send ^,              ; Open Preferences menu and wait.
   Sleep 500
   Click 2280 465
   Sleep 500
   Send {WheelDown 14}
   Sleep 500
   Click, 1600 620
   Sleep 500
   Click, 1600 785
   Sleep 500
   Click, 1600 620
   Sleep 500
   Click, 1600 720
   Sleep 500
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
