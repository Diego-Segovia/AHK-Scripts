#Requires AutoHotkey v2.0
#SingleInstance Force

HotIf (*) => WinActive("ahk_exe devenv.exe") ; Only trigger when Visual Studio has focus

; :B0*: means:
; B0 = Do NOT backspace the trigger text automatically
; * = Fire immediately (don't wait for an ending char to trigger the hook start)
Hotstring(":B0*:br.", GenerateBranchName)

GenerateBranchName(thisHotkey)
{
    ; The trigger text is statically known as "br." for this hotkey
    triggerText := "br."

    ; V = Visible (you see the branch name as you type it)
    inputListener := InputHook("V")

    ; S = Suppress keys so Visual Studio doesn't perform actions related to key press
    ; E = Tell input hook that keys are End Keys so Wait() ends
    inputListener.KeyOpt("{Space}{Enter}{Tab}", "E S")

    inputListener.Start()
    inputListener.Wait() ; Wait for user to press ending character

    branchName := inputListener.Input
    endKey := inputListener.EndKey ; Capture which key finished the input

    ; If the user triggers it but immediately hits Enter without typing a name, abort cleanly
    if (branchName == "") {
        Send("{" endKey "}")
        return
    }

    ; Calculate backspaces: Length of "br." + Length of the typed branch name.
    ; (Your reference script had a +1 here, but since the EndKey is suppressed via 'S',
    ; it never makes it to the editor, so we only need to backspace the exact visible characters).
    totalTriggerTextLength := StrLen(triggerText) + StrLen(branchName)
    SendInput("{BS " totalTriggerTextLength "}") ; Backspace triggering text

    ; Format today's date as YYYY_MM_DD
    dateString := FormatTime(A_Now, "yyyy_MM_dd")

    ; Send the formatted date and the provided branch name
    SendInput(dateString "_" branchName)
}