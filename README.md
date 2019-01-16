# uniLaunch
Portable Unified Launcher for your files
I'm using it for my portable retrogaming setup 

![diagram](https://github.com/jbottein/uniLaunch/blob/master/doc/diagram.png?raw=true)

Settings have to be manually entered in the uniLaunch.ini file  

When a file is open with UniLaunch.exe, The program will find the command line to run associate with the file extension.  
If a second parameter is entered, the program will find the command line will try to find the command for the <extension>.<second parameter>
  
If a system variable UNILAUNCH is defined, the program will try to launch the <extension>.<unilaunch var> command
  
If the file is a zip or a 7z, the program will extract it in a tmp folder before running the command
when the command ends, the tmp folder will be cleared

I leave here my current settings as an example

The source code is in uniLaunch.ahk, it's an AutoHotKey script

I've write it fast and ungly, but I'm pretty satisfied with the result

Setting file speak almost for itself :  
`default=..\RetroArch\retroArch.exe`  
`sms=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\genesis_plus_gx_libretro.dll %FILE%`  
`md=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\genesis_plus_gx_libretro.dll %FILE%`  
`nes=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\nestopia_libretro.dll %FILE%`  
`sfc=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\bsnes_balanced_libretro.dll %FILE%`  
`smc=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\bsnes_balanced_libretro.dll %FILE%`  
`gb=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\gambatte_libretro.dll %FILE%`  
`gbc=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\gambatte_libretro.dll %FILE%`  
`gba=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\mgba_libretro.dll %FILE%`  
`n64.p64=..\Project64_2.3\Project64.exe %FILE%`  
`z64.p64=..\Project64_2.3\Project64.exe %FILE%`  
`v64.p64=..\Project64_2.3\Project64.exe %FILE%`  
`n64=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\parallel_n64_libretro.dll %FILE%`  
`z64=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\parallel_n64_libretro.dll %FILE%`  
`v64=..\RetroArch\retroArch.exe -L ..\RetroArch\cores\parallel_n64_libretro.dll %FILE%`  
`gcm=..\Dolphin\Dolphin.exe /e %FILE%`  
`gcm.low=..\Dolphin-Ishiiruka-744\Dolphin.exe /e %FILE%`  
