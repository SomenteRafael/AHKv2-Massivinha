#Requires AutoHotkey v2
#ClipboardTimeout 30000
#InputLevel 100
#MaxThreads 8
#MaxThreadsBuffer 1
#MaxThreadsPerHotkey 1
#SingleInstance Force
#UseHook 1
#WinActivateForce
DetectHiddenText(1)
DetectHiddenWindows(1)
SetTitleMatchMode("RegEx")
SetTitleMatchMode("Fast")
SetWinDelay(-1)
SetControlDelay(-1)
SendMode("Input")
SetDefaultMouseSpeed(0)
SetKeyDelay(-1, -1)
SetMouseDelay(-1)
#include "setDarkWindowFrame.func.ahk"
okk := 0
A_HotkeyModifierTimeout := -1
A_ScriptName := "Massivinha Black"
fileInstall("massivinha.ico", "massivinha.ico")
traySetIcon("massivinha.ico")
if (a_isCompiled) {
	try {
		fileDelete("massivinha.ico")
	}
}

ui := gui()
ui.add("Text", "X5 Y9 W490 H20 center c0xffffff", "Olá, eu sou a MASSIVINHAAAA, a sua amiguinha gotiquinha!")
input := ui.add("Edit", "X5 Y30 W240 H435 background0x333333 c0xffffff -vscroll", "")
inputB := ui.add("Button", "X5 Y470 W240 H25", "Adicionar")
inputB.OnEvent("Click", inputB_onEvent)
inputB_onEvent(*) {
	arr := StrSplit(input.Value, "`n")
	for itm in arr {
		rs := regexReplace(itm, "[^0-9]{1,}", "_")
		if (rs ~= "\d_\d{4}_\d{2}_\d{6}_\d_\d{3}") {
			final := StrReplace(rs, "_", " ")
			lista.add(, final)
			lista2.Push(StrReplace(final, " "))
		}
	}
	input.Value := ""
}
lista := ui.add("ListView", "X255 Y30 W240 H435 background0x333333 c0xffffff -hdr", ["Número do Processo"])
listaB := ui.add("Button", "X255 Y470 W240 H25", "Vamos Copiar!")
listaB.OnEvent("Click", listaB_onEvent)
lista2 := []
listaB_onEvent(*) {
	Sleep(5000)
	for itm in lista2 {
		Send(itm . "{Down}")
		Sleep(300)
	}
	lista.Delete()
	global lista2 := []
}
setDarkWindowFrame(ui.hwnd, 1)
ui.backColor := 0x000000
ui.setFont("c0xffffff")
ui.show("W500 H500")