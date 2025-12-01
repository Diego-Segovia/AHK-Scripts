#Requires AutoHotkey v2.0
#SingleInstance Force

#HotIf WinActive("ahk_exe devenv.exe") ; Only trigger when Visual Studio has focus
MButton::F5
#HotIf