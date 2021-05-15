; dai.ahk

#MaxHotkeysPerInterval 1000
#NoEnv
#SingleInstance force

SendMode Input
SetTitleMatchMode Regex
SetWorkingDir %A_ScriptDir%

#IfWinActive, ahk_exe DragonAgeInquisition.exe
{
	~RButton::GoSub, Stop
	~LButton Up::GoSub, Stop
	~RButton Up::GoSub, Stop
	~RButton & LButton::GoSub, Move


	Move:
	{
		Send, {W Down}
	} Return

	Stop:
	{
		Send, {W Up}
	} Return
}

^Esc::ExitApp