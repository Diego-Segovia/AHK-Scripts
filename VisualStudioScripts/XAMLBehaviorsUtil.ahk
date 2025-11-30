#Requires AutoHotkey v2.0
#SingleInstance Force

HotIf (*) => WinActive("ahk_exe devenv.exe") ; Only trigger when Visual Studio is running

; :B0*: means:
; B0 = Do NOT backspace the trigger text automatically
; * = Fire immediately (don't wait for an ending char to trigger the hook start)
Hotstring(":B0*:i", GenerateInteractionTrigger)

HotIf

GenerateInteractionTrigger(thisHotkey)
{
    triggerText := StrSplit(thisHotkey, ":")[3]

    ; V = Visible (you see the number as you type it)
    inputListener := InputHook("V")

    ; S = Supress keys so Visual Studio doesn't perform actions related to key press
    ; E = Tell input hook that keys are End Keys so Wait() ends
    inputListener.KeyOpt("{Space}{Enter}{Tab}", "E S")

    inputListener.Start()
    inputListener.Wait() ; Wait for user to press ending character

    userInput := inputListener.Input
    eventMethodName := StrSplit(userInput, ".")

    totalTriggerTextLength := StrLen(triggerText) + StrLen(userInput) + 1
    SendInput("{BS " totalTriggerTextLength "}") ; Backspace triggering text

    Send("<i:Interaction.Triggers>{Enter}")
    Send('<i:EventTrigger EventName="' eventMethodName[2] '">{Enter}')
    Send('<cal:ActionMessage MethodName="' eventMethodName[3] '" />')
}