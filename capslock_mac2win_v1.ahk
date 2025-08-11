; 短按 CapsLock 切换输入法 (通常是 Win + Space)
; 长按 CapsLock 切换大写锁定状态

$CapsLock::
    KeyWait, CapsLock, T0.2 ; T0.2 表示等待0.2秒，您可以根据需要调整这个时间
    If ErrorLevel ; 如果 CapsLock 按下时间超过0.2秒 (即长按)
    {
        if GetKeyState("CapsLock", "T") ; 获取大写锁定键的当前状态 (T = Toggle)
            SetCapsLockState, Off ; 如果是开启状态，则关闭
        else
            SetCapsLockState, On  ; 如果是关闭状态，则开启
    }
    Else ; 如果 CapsLock 按下时间短于0.2秒 (即短按)
    {
        Send, {LWin down}{Space}{LWin up} ; 发送 Win + Space 快捷键来切换输入法
                                        ; 如果您的输入法切换快捷键不同，请修改此处
    }
Return