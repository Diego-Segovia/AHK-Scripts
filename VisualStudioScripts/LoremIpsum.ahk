#Requires AutoHotkey v2.0
#SingleInstance Force

HotIf (*) => WinActive("ahk_exe devenv.exe") ; Only trigger when Visual Studio is running

; :B0*: means:
; B0 = Do NOT backspace the trigger text automatically
; * = Fire immediately (don't wait for an ending char to trigger the hook start)
Hotstring(":B0*:lorem", GetWords)

HotIf

GetWords(thisHotkey)
{
    triggerText := StrSplit(thisHotkey, ":")[3]

    ; V = Visible (you see the number as you type it)
    inputListener := InputHook("V")

    ; S = Supress keys so Visual Studio doesn't perform actions related to key press
    ; E = Tell input hook that keys are End Keys so Wait() ends
    inputListener.KeyOpt("{Space}{Enter}{Tab}", "E S")

    inputListener.Start()
    inputListener.Wait() ; Wait for user to press ending character

    numOfWords := inputListener.Input
    endKey := inputListener.EndKey ; capture which key finished the input

    if !IsInteger(numOfWords) {
        Send("{" endKey "}")
        return
    }

    totalTriggerTextLength := StrLen(triggerText) + StrLen(numOfWords) + 1
    SendInput("{BS " totalTriggerTextLength "}") ; Backspace triggering text

    loremIpsum := "lorem ipsum dolor sit amet consectetur adipiscing elit phasellus in augue nisi proin dapibus diam a odio interdum aliquet morbi ultricies lacus vel posuere fermentum ligula lectus posuere ligula eget sagittis risus mi eget libero pellentesque nec quam ullamcorper auctor nisl id convallis erat pellentesque vel ullamcorper eros integer eget sodales sapien integer sed neque sapien nullam placerat ex et nibh dapibus semper sodales neque facilisis maecenas venenatis purus in hendrerit vestibulum dui elit sollicitudin odio at venenatis nunc nibh a massa vivamus convallis maximus felis quis rhoncus nulla gravida eget mauris quis lacus feugiat tortor lacinia posuere ut eu felis curabitur dignissim ultricies dignissim fusce sed erat vel est convallis sagittis nec quis dolor nunc euismod et odio nec porttitor donec dignissim dui vitae feugiat hendrerit interdum et malesuada fames ac ante ipsum primis in faucibus nunc suscipit luctus elementum duis iaculis orci ut aliquet pharetra lectus neque interdum risus eget luctus nulla ligula at sapien curabitur tempus quis leo id pharetra integer pellentesque sapien at consectetur tincidunt neque enim tincidunt urna in porttitor enim odio quis eros duis dapibus tincidunt odio vitae malesuada ut convallis mi sit amet nibh molestie consequat non et lorem sed sit amet luctus nunc nullam sed mattis lacus hendrerit rhoncus erat nunc quis odio commodo pharetra leo ac luctus eros cras mollis eros sit amet malesuada fermentum risus arcu porttitor lorem vel lobortis diam ante fermentum arcu cras suscipit elit vel massa suscipit at dapibus quam dignissim ut quis ipsum rhoncus diam fermentum iaculis ultrices nec massa cras enim ex egestas vel vestibulum at iaculis at metus donec eu mi ac odio venenatis luctus a vel dui"
    loremIpsumWords := StrSplit(loremIpsum, " ")

    wordIndex := 0
    isFirstWord := 0
    randomSeed := 40

    Loop numOfWords {
        wordIndex++

        randomCommaIndex := Random(0, randomSeed)
        randomCommaIndex2 := Random(0, randomSeed)

        if (wordIndex > loremIpsumWords.Length)
            wordIndex := 1

        word := loremIpsumWords[wordIndex]

        if (isFirstWord == 0) {
            word := SentenceCase(word)
            isFirstWord := 1
        }

        Send(word)

        if (randomCommaIndex == randomCommaIndex2 && wordIndex > 3 && wordIndex < numOfWords - 4)
            Send(",")

        if A_Index < numOfWords
            Send("{Space}")
    }

    Send(".")
}

SentenceCase(str) {
    firstChar := StrUpper(SubStr(str, 1, 1))
    restofString := StrLower(SubStr(str, 2))
    return firstChar . restOfString
}