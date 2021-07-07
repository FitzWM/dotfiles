; smepost.ahk
; FitzWM
; This scripts creates a workflow-esque post template for the win10_specialists
; Slack channel.
; Description

#MaxHotkeysPerInterval 1000     ; Prevents infinite hotkey loops.
#NoEnv                          ; Compatibility.
#SingleInstance, Force          ; Disables annoying script restart message.

SendMode Input                  ; Faster, more reliable than Send.
SetTitleMatchMode, 3            ; Forces exact matches for window titles.
SetWorkingDir %A_ScriptDir%     ; Sets consistent working directory.

:X:*post::smePost()

smePost()
{
;    InputBox, ticket, Enter Ticket #
;    Send % "Your ticket number is " ticket "."
    global

    Gui Add, Text,, Ticket #:
    Gui Add, Edit, vTicket r1 Uppercase
    Gui, Add, Button, Default w80, OK
    Gui Show

    ;Gui Submit

    Send % "Your ticket number is " Ticket "."
    Return
}
