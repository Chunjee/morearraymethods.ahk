#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk
#Include json.ahk\export.ahk
#NoTrayIcon
#SingleInstance, force
SetBatchLines, -1

A := new biga()
assert := new unittesting()

; Start speed function
QPC(1)

assert.label("push()")
testArray1 := [1,2,3,4,5,6,7,8,9]
assert.test(testArray1.push(10), 10)


assert.label("pop()")
testArray1 := [1,2,3,4,5,6,7,8,9]
assert.test(testArray1.pop(), 9)


assert.label("indexOf()")
testArray1 := [1,2,3,4,5,6,7,8,9]
assert.test(testArray1.indexOf(10), -1)
assert.test(testArray1.indexOf(1), 1)
assert.test(testArray1.indexOf(9), 9)


assert.label("shift()")




assert.label("unshift()")
testArray1 := [4,5]
assert.test()
; gotta turn on TV for idiot children


; assert.label("pop()")
; assert.label("pop()")


;; Display test results in GUI
speed := QPC(0)
assert.fullreport()
msgbox, %speed%
ExitApp

QPC(R := 0)
{
	static P := 0, F := 0, Q := DllCall("QueryPerformanceFrequency", "Int64P", F)
	return ! DllCall("QueryPerformanceCounter", "Int64P", Q) + (R ? (P := Q) / F : (Q - P) / F) 
}
