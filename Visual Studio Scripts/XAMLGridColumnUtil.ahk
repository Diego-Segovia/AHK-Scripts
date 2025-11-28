#Requires AutoHotkey v2.0
#SingleInstance Force

#HotIf WinActive("ahk_exe devenv.exe")

Loop 12 {
    Hotstring(":O:grid.col" . A_Index, GenerateColumns.Bind(A_Index))
}

GenerateColumns(colCount, *) {
    Send("<Grid>{Enter}")
    Sleep(50)

    Send("<Grid.ColumnDefinitions>{Enter}")
    Sleep(50)

    Loop colCount {
        Send('<ColumnDefinition />')
        if (A_Index < colCount) {
            Send("{Enter}")
        }
    }
}

#HotIf