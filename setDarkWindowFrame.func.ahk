; "setDarkWindowFrame.func.ahk"

#requires autohotkey v2
#dllLoad "dwmapi"

setDarkWindowFrame(hwnd, boolEnable) {
	if VerCompare(A_OSVersion, "10.0.17763") >= 0 {
		attr := 19
		if VerCompare(A_OSVersion, "10.0.18985") >= 0
			attr := 20
		DllCall("dwmapi\DwmSetWindowAttribute", "ptr", hwnd, "int", attr, "int*", boolEnable, "int", 4)
    } ;else {
		;trayTip("Dark mode not supported.", "Dark mode not supported.")
	;}
}