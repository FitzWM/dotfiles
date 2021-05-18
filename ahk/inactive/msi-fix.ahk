; MSI Gaming APP Fix
; FitzWM
;
; 2016-07-15 - 1.0 - Initial release.
; 2016-07-16 - 1.1 - Changed WinWait events in Click section to WinWaitActive.
; 2016-07-16 - 1.2 - Changed pixel coordinates from window relative to screen
; 			   	   	 absolute. Moved pixel checked from button band to MSI logo.
;					 Should make the script work, regardless of color scheme.
; 2016-07-16 - 1.3 - Added brief sleep before minimize button. SHOULD fix it.
; 2016-07-19 - 1.4 - Added half-second sleep and second pixel check to fix edge
; 			   	   	 edge case in which APP window would reappear after being
;					 minimized.
; 2016-07-23 - 1.5 - Removed most of the code, as MSI Gaming APP now properly
; 			   	   	 reapplies LED settings. This script now only serves to
;					 minimize it once it's done. Renamed to MSI Gaming APP Fix.
;					 Commented out second window check, because it seems that
;					 MSI may have fixed that, too.
;
; Description
; This script waits for the MSI Gaming APP window to become visible, and then
; minimizes its properly. The whole run should be less than a second, once the
; window appears.
;
; Use
; Simply run the script once the APP is running. To run it on every startup,
; create a task in the Task Scheduler to run it at logon and wake from sleep.
;
; Variables
;  - The colors to check px against, to determine whether the APP's window
;    has actually appeared. You should only need to change them if your
; 	 desktop background matches the APP's color in the pixel checked.
;  - The actual pixels clicked to  minimize the APP. These were chosen for a
;    1920x1080 screen at 100% DPI settings. Users on higher resolutions or DPIs
;	 will need to modify then to fit. 

#MaxHotkeysPerInterval 1000
#NoEnv

; Use absolute coordinates, rather than window relative.
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
SendMode Input                  ; Faster, more reliable than Send.
SetWorkingDir %A_ScriptDir% 	; Sets consistent working directory.

; Check for MSI Gaming APP logo colors, to make sure that the window is actually
; visible. Modify pixel and colors checked if desktop background matches pixel
; checked. Use AHK Window Spy to get relevant values. Default is in the "shine"
; at the top of the MSI shield.
px = -1
while (px != 0x757475) && (px != 0x8A8B8A)
{
	WinActivate, ahk_exe GamingApp.exe
	PixelGetColor, px, 1458, 617
}

; Get current mouse position.
MouseGetPos, xpos, ypos

; Minimize MSI Gaming APP.
WinWaitActive, ahk_exe GamingApp.exe
Click, 1869 630

; Wait half a second to make sure the APP window hasn't reappeared. Close it if
; it has.
; Sleep, 500
; PixelGetColor, px, 1458, 617
; if (px == 0x757475) || (px == 0x8A8B8A)
; {
; 	WinWaitActive, ahk_exe GamingApp.exe
; 	Click, 1869 630
; }

; Return cursor to previous position.
MouseMove, %xpos%, %ypos%

Return
