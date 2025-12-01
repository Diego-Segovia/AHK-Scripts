#Requires AutoHotkey v2.0
#SingleInstance Force

HotIf (*) => WinActive("ahk_exe devenv.exe") ; Only trigger when Visual Studio has focus

; :B0*: means:
; B0 = Do NOT backspace the trigger text automatically
; * = Fire immediately (don't wait for an ending char to trigger the hook start)
Hotstring(":B0*:grid.row", GenerateGrid)
Hotstring(":B0*:grid.col", GenerateGrid)

GenerateGrid(thisHotkey)
{
    triggerText := StrSplit(thisHotkey, ":")[3]
    gridDefinitionType := (triggerText == "grid.row") ? "Row" : "Column"

    ; V = Visible (you see the number as you type it)
    inputListener := InputHook("V")

    ; S = Supress keys so Visual Studio doesn't perform actions related to key press
    ; E = Tell input hook that keys are End Keys so Wait() ends
    inputListener.KeyOpt("{Space}{Enter}{Tab}", "E S")

    inputListener.Start()
    inputListener.Wait() ; Wait for user to press ending character

    count := inputListener.Input
    endKey := inputListener.EndKey ; capture which key finished the input

    if !IsInteger(count) {
        Send("{" endKey "}")
        return
    }

    totalTriggerTextLength := StrLen(triggerText) + StrLen(count) + 1
    SendInput("{BS " totalTriggerTextLength "}") ; Backspace triggering text

    GenerateGridXAML(gridDefinitionType, count)
}

GenerateGridXAML(tagType, count) {
    Send("<Grid>{Enter}")
    Send("<Grid." tagType "Definitions>{Enter}")

    Loop count {
        Send("<" tagType "Definition />")
        if (A_Index < count) {
            Send("{Enter}")
        }
    }

    Send("{Down}{End}{Enter}")
}