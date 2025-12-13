#Requires AutoHotkey v2.0
#SingleInstance Force

#HotIf WinActive("ahk_exe devenv.exe") ; Only trigger when Visual Studio has focus
$^s::
{
    Send "^k^d"
    Sleep 50
    Send "^s"
}
#HotIf