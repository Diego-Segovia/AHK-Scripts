#Requires AutoHotkey v2.0
#SingleInstance Force

#HotIf WinActive("ahk_exe SSMS.exe") ; Only trigger when SSMS has focus
MButton::!x
#HotIf