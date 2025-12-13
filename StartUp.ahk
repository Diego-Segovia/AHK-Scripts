#Requires AutoHotkey v2.0
#SingleInstance Force

SetWorkingDir A_ScriptDir

Run "VisualStudioScripts\LoremIpsum.ahk"
Run "VisualStudioScripts\MiddleMouseBtnF5.ahk"
Run "VisualStudioScripts\XAMLBehaviorsUtil.ahk"
Run "VisualStudioScripts\XAMLGridGenerationUtil.ahk"
Run "VisualStudioScripts\FormatOnSave.ahk"

ExitApp