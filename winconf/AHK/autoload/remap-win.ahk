; #CommentFlag ;
; Key      	Syntax
; Alt	          !
; Ctrl	          ^
; Shift          +
; Win Logo	      #

#NoTrayIcon

; windows console 和 mintty 中使用 tmux
#If WinActive("ahk_class mintty") || WinActive("ahk_class ConsoleWindowClass")
; n,p,k,t for tmux
!n::
	send {Ctrl Down}l{Ctrl up}n
    KeyWait, Ctrl
	return
!p::
	send {Ctrl Down}l{Ctrl up}p
    KeyWait, Ctrl
	return
!t::
	send {Ctrl Down}l{Ctrl up}c
    KeyWait, Ctrl
	return
#If

; windows console (CMD/PoserShell) 快捷键
; 注意，在紧贴If的注释中不得出现“键”字，否则会影响 If 失效
; ========================
#If WinActive("ahk_class ConsoleWindowClass")
RButton::
  send {ESC}
  return
^y::
  send {Ctrl Down}{Shift Down}v{Ctrl Up}{Shift Up}
  KeyWait, Ctrl
  KeyWait, Shift
  return
^v::
  Click Right
  return
^m::
  Click Right
  return 
!w::
  send {Enter}
  return
#If

setChineseLayout(){
  send {Ctrl Down}{Shift Down}1{Ctrl up}{Shift up}
  KeyWait, Ctrl
  KeyWait, Shift
}

setEnglishLayout(){
  send {Ctrl Down}{Shift Down}1{Ctrl up}{Shift up}
  send {Ctrl Down}{Shift}{Ctrl Up}
  KeyWait, Ctrl
  KeyWait, Shift
}


; vi 插件中，用 ESC 切回普通模式时自动切换英文输入法。如不生效快速按 ESC n次，直到生效
; =========
#If WinActive("ahk_exe Code.exe") || WinActive("ahk_exe goland64.exe")|| WinActive("ahk_exe idea64.exe") || WinActive("ahk_exe webstorm64.exe")
ESC::
{
  setEnglishLayout()
  send {ESC}
  return
}
#If

#IfWinActive, ahk_exe vcxsrv.exe
  ^Space::
    ControlSend, , ^{Space}
    Return
  ^!::
    ControlSend, , ^!
    Return
#If
