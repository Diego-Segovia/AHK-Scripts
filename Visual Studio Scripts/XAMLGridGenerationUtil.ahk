#Requires AutoHotkey v2.0
#SingleInstance Force

#HotIf WinActive("ahk_exe devenv.exe") ; Only trigger when Visual Studio is running

; :B0*: means:
; B0 = Do NOT backspace the trigger text automatically
; * = Fire immediately (don't wait for an ending char to trigger the hook start)
Hotstring(":B0*:grid.row", GenerateGrid)
Hotstring(":B0*:grid.col", GenerateGrid)

GenerateGrid(ThisHotkey)
{
    TriggerText := StrSplit(ThisHotkey, ":")[3]
    GridDefinitionType := (TriggerText == "grid.row") ? "Row" : "Column"

    ; V = Visible (you see the number as you type it)
    InputListener := InputHook("V")

    ; S = Supress keys so Visual Studio doesn't perform actions related to key press
    ; E = Tell input hook that keys are End Keys so Wait() ends
    InputListener.KeyOpt("{Space}{Enter}{Tab}", "E S")

    InputListener.Start()
    InputListener.Wait() ; Wait for user to press ending character

    Count := InputListener.Input
    EndKey := InputListener.EndKey ; capture which key finished the input

    if !IsInteger(Count) {
        Send("{" EndKey "}")
        return
    }

    TotalTriggerTextLength := StrLen(TriggerText) + StrLen(Count) + 1
    SendEvent("{BS " . TotalTriggerTextLength . "}") ; Backspace triggering text

    GenerateGridXAML(GridDefinitionType, Count)
}

GenerateGridXAML(TagType, Count) {
    Send("<Grid>{Enter}")
    Send("<Grid." . TagType . "Definitions>{Enter}")

    Loop Count {
        Send("<" . TagType . "Definition />")
        if (A_Index < Count) {
            Send("{Enter}")
        }
    }

    Send("{Down}{End}{Enter}")
}

#HotIf