; steam.ahk
; This script waits for DS4Windows to capture the DS4 controller, and then
; launches Steam. Then, it waits for Steam to appear and minimizes it.

; Keep checking for DS4Windows process. Run Steam when it's found.
while (!ErrorLevel)
{
	Process, Exist, DS4Windows.exe
	if (ErrorLevel)
	{
		Send +^4    ; Move to desktop 4
		Run "C:\playing\steam\Steam.exe"
	}
}


; Wait until Steam appears and minimize it. First two lines handle launch popup.
WinWait, Steam
WinWaitClose, Steam
WinWait, Steam
WinClose, Steam

Return
