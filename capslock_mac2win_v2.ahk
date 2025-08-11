#Requires AutoHotkey v2.0
#SingleInstance Force

$CapsLock::
{
    ; 等待最多 0.2 秒看是否松开（短按）
    if KeyWait("CapsLock", "U T0.2") {
        ; —— 短按：轮换输入法 ——（Win + Space）
        Send "#{Space}"   ; v2 里 Send 用字符串语法
    } else {
        ; —— 长按：切换大小写锁定状态 ——
        if GetKeyState("CapsLock", "T")
            SetCapsLockState "Off"
        else
            SetCapsLockState "On"
        KeyWait "CapsLock", "U"  ; 等松开，避免重复触发
    }
}
