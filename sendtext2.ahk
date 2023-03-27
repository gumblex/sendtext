stop_pasting := 0

^P::
{
global stop_pasting

SetTitleMatchMode 2
; WinWaitActive
pastestr := A_Clipboard
pastestr := StrReplace(pastestr, "`r`n", "`n")
pastestr_len := StrLen(pastestr)
max_send_len := 1000
offset := 1
stop_pasting := 0
While offset <= pastestr_len
{
    if (stop_pasting = 1)
        break
    sub_paste := SubStr(pastestr, offset, max_send_len)
    offset += StrLen(sub_paste)
    SendText sub_paste
    Sleep Integer(StrLen(sub_paste) * 1.5)
}
stop_pasting := 0
return
}

#Hotstring EndChars `n `t

:b0:stop::
{
global stop_pasting
stop_pasting := 1
}

