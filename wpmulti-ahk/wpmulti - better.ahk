#NoEnv
#SingleInstance Force

; AU - 1
; Ca - 2
; UK - 3
; US - 4

global instances = 1
global render_distance = 3 ; 16 + rd
delay = 17
global Sounds = true       

SetKeyDelay, delay
SetWinDelay, 100
SetTitleMatchMode, 2
 
global target_inst = 0
global current_instance = 1

global total_resets = 6900

global SavesDirectory := "C:\Users\Name\Downloads\mmc-cracked-win32\UltimMC\instances\1.16.1\.minecraft\saves\"

SetKeyDelay, 0

IfNotExist, %SavesDirectory%
   msgBox, Please set your saves directory!!!

IfNotExist, %SavesDirectory%_oldWorlds
   FileCreateDir, %SavesDirectory%_oldWorlds


Move()
{
	Loop, Files, %SavesDirectory%*, D
   {
     _Check :=SubStr(A_LoopFileName,1,1)
      If (_Check!="_")
      {
        FileMoveDir, %SavesDirectory%%A_LoopFileName%, %SavesDirectory%_oldWorlds\%A_LoopFileName%%A_NowUTC%, R
      }
   }
}

worldpreview()
{
             SetKeyDelay, 10
             send {Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}
             SetKeyDelay, delay
}
normalfov()
{
          SetKeyDelay, 8
          send {Esc}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}+{Left}{Left}+{Left}+{Left}{Esc}

}

netherfov()
{
         SetKeyDelay, 10
         send {Esc}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}{Right}{Right}{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}+{Right}{Right}+{Right}+{Right}+{Right}+{Right}{Right}{Esc}

}

lan()
{        SetKeyDelay, 1
         send {Esc}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Tab}{Tab}{Tab}{Space}{Tab}{Space}
	 SetKeyDelay, delay
}

PauseAbuse()
{
        SetKeyDelay, 599
        send {Esc}{Esc}
        SetKeyDelay, delay
}

ExitWorld()
{         		
	Sound()
	SetKeyDelay, 10
	send {Esc}+{Tab}{Enter} 
	SetKeyDelay, delay
	total_resets += 1
}

rddown()
{		
	SetKeyDelay, 1   
	send, {Blind}{RShift Down}{F3 down}{F 14}{D}{F3 up}{RShift Up}
	SetKeyDelay, delay
}

rdup()
{
	SetKeyDelay, 1	
	send, {Shift Up}{F3 down}{F %render_distance%}{D}{F3 up}
	SetKeyDelay, delay
}

Sound()
{  
   if (Sounds){
      SoundPlay, reset.wav
   }
}

SwitchWindow()
{ 	
	SetKeyDelay, 100
	if (current_instance = instances)
	{
	    current_instance := 1
	    send, {^Esc}
	    send, {LWin Down}{t}{LWin Up}{Enter}
	}
	 
	else if (current_instance < instances)
	{
	    current_instance += 1
	    send, {^Esc}
	    send, {LWin Down}{t %current_instance%}{LWin Up}{Enter}
	}
	SetKeyDelay, delay
}

ResetSwitch()
{
  ExitWorld()
  SwitchWindow()
}

{     
    U::
      ExitWorld()
      Move()
    return
}

{
    Y::
    	rddown()
    return
}

{
    RAlt::
        MsgBox, %total_resets%
    return
}

{    
    ^LAlt::
        Reload
    return
}

{
    ^C::
        rdup()
    return
}

{
   ^X::
      PauseAbuse()
   return
}

{
   End::
       lan()
   return
}

{
   ^F::
      netherfov()
   return
}

{
   ^`::
      normalfov()
   return
}

{
   H::
     worldpreview()
     Sound()
   return
}						 	
      