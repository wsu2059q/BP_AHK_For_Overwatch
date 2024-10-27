; 定义图像文件夹路径
imageFolder := "src\"

; 循环执行以下操作
Loop {
    ; 点击"新兵"按钮
    if (ImageSearch(imageFolder . "newbie_button.png", x, y)) {
        Click, %x%, %y%
        Sleep, 3000  ;
    }

    ; 等待右上角数字等于5秒
    Loop {
        if (CheckScoreEquals5()) {
            Break
        }
        Sleep, 3000  ;
    }

    ; 点击ESC
    Send, {Esc}
    Sleep, 3000  ;

    ; 选择离开比赛
    if (ImageSearch(imageFolder . "leave_match_button.png", x, y)) {
        Click, %x%, %y%
        Sleep, 3000  ;
    }

    ; 点击确认
    if (ImageSearch(imageFolder . "confirm_button.png", x, y)) {
        Click, %x%, %y%
        Sleep, 3000  ;
    }

    ; 点击继续
    if (ImageSearch(imageFolder . "continue_button.png", x, y)) {
        Click, %x%, %y%
        Sleep, 3000  ;
    }

    ; 点击关闭
    if (ImageSearch(imageFolder . "close_button.png", x, y)) {
        Click, %x%, %y%
        Sleep, 3000  ;
    }
}

; 检查右上角数字是否等于5秒
CheckScoreEquals5() {
    ; 定义数字图像文件路径
    scoreImage := "score_5_seconds.png"

    ; 检查数字图像
    if (ImageSearch(imageFolder . scoreImage, x, y)) {
        return true
    }
    return false
}

; 图像搜索函数
ImageSearch(imageFile, ByRef x, ByRef y) {
    ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, *60 %imageFile%
    if (ErrorLevel = 0) {
        return true
    } else {
        return false
    }
}
