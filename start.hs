title "TinyPaint"

old_x = -1
old_y = -1
now_x = 0
now_y = 0

color :boxf 0,0,639,479
color 255,0,0
repeat
    stick key

;   1   �J�[�\���L�[��(��)
;   2   �J�[�\���L�[��(��)
;   4   �J�[�\���L�[�E(��)
;   8   �J�[�\���L�[��(��)
;  16   �X�y�[�X�L�[
;  32   Enter�L�[
;  64   Ctrl�L�[
; 128   ESC�L�[
; 256   �}�E�X�̍��{�^��
; 512   �}�E�X�̉E�{�^��
;1024   TAB�L�[

    if key & 256 {
        now_x = mousex
        now_y = mousey
        line now_x, now_y, old_x, old_y
        old_x = now_x
        old_y = now_y
    } else {
        old_x = mousex
        old_y = mousey
    }
    wait 5
loop

stop

