#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

outdir := "tmp"
file=%1%
profile=%2%

FileDelete, %outdir%\*

SplitPath, file , name, dir, ext, name_no_ext, drive

If (ext = "7z" or ext = "zip" ) {
    runwait, "7z.exe" x "%file%" -o"%outdir%" -y,,hide
    Loop, %outdir%\* {
        FileGetTime, Time, %A_LoopFileFullPath%, C
        If (Time > Time_Orig) {
            Time_Orig := Time
            file := A_LoopFileLongPath
        }
    }
    SplitPath, file , name, dir, ext, name_no_ext, drive
}

If Not profile
	EnvGet, profile, UNILAUNCH
If profile
	profile := "." . profile
	

keyDefault := "default="
If ext
	key := ext . "="
If profile
	keyProfile := ext . profile . "="
If ext And profile
	keyDefaultProfile := "default" . profile . "="


Loop, read, uniLaunch.ini
{
    If InStr(A_LoopReadLine, keyDefault , false, 1, 1) = 1
        lDefault := A_LoopReadLine
    If keyDefaultProfile And InStr(A_LoopReadLine, keyDefaultProfile , false, 1, 1) = 1
        lDefaultProfile:= A_LoopReadLine
    If key And InStr(A_LoopReadLine, key , false, 1, 1) = 1
        lKey:= A_LoopReadLine
    If keyProfile And InStr(A_LoopReadLine, keyProfile , false, 1, 1) = 1
        lKeyProfile:= A_LoopReadLine
}

If lDefault 
    launcher := lDefault 
If lDefaultProfile
    launcher := lDefaultProfile
If lKey
    launcher := lKey
If lKeyProfile
    launcher := lKeyProfile

StringReplace, launcher, launcher, `%FILE`%, "%file%", All
StringGetPos, equalPos, launcher, =
launcher := SubStr(launcher ,equalPos+2)

logfile := "uniLaunch.log"

FileDelete, %logfile%
FileAppend, %launcher%, %logfile%

RunWait %launcher%

FileDelete, %outdir%\*

ExitApp