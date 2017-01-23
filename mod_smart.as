;-----------------------------------------------------
; 
; HSP3�p�X�}�[�g�t�H�����W���[���umod_smart.as�v
;
; Ver 3.46 (�����ӁFVer 3.0�ȍ~����uhsp3dish.as�v���K�{�ƂȂ�܂����B���O�Ɂuhsp3dish.as�v���C���N���[�h���Ă�������)
;
; By. ���܂���˂�
;
; https://sites.google.com/site/simakuroneko/
; http://simakuroneko.bbs.fc2.com/
; simakuroneko@gmail.com
;
;-----------------------------------------------------
#ifndef __MOD_SMART__
#define __MOD_SMART__


;-----------------------------------------------------
#module mod_smart

#const FALSE						0
#const TRUE							1

#const double RAD_DOUBLE			1000000.0	; ���W�A���𐮐��l�ɂ��ĕԂ��{��(smart_analog_res�p)

;-------���̑�
#const SARCH_TIME_MAX 				863999999	; 23��59��59�b�̃~���b
#const DEFAULT_TAP_INTERVAL 		400			; smart_tap���߂̃^�b�v��F�����鎞��(���̎��Ԉȓ��Ɏw�������āA�w�𗣂�)
#const DEFAULT_TOUCH_INTERVAL 		1000		; smart_touch���߂̃^�b�`��F�����鎞��(���̎��Ԉȏ�w������������)
#const DEFAULT_DRAG_INTERVAL        1000		; smart_drag���߂̃h���b�O��F�����鎞��(���̎��Ԉȏ�w������������)
#const DEFAULT_DOUBLE_TAP_INTERVAL 	700			; smart_dtap���߂̃_�u���^�b�v��F�����鎞��(���̎��Ԉȓ���1��ڂ̃^�b�v����2��ڂ̃^�b�v���s�Ȃ�)
#const DEFAULT_SWIPE_INTERVAL 		600			; smart_vswipe/smart_hswipe���߂̃X���C�v��F�����鎞��(���̎��Ԉȓ��Ɏw�������āA�w�𗣂�)
#const POINT_SPLIT					8			; smart_vswipe/smart_hswipe���ߓ��Ŏg�p���Ă���X���C�v�ʂ�10����
#const PARAM_1						0
#const PARAM_2						1
#const PARAM_3						2
#const PARAM_4						3
#const CP_MODE_0					0
#const CP_MODE_1					1
#const CP_MODE_2					2
#const CP_MODE_3					3
#const CP_MODE_4					4

;-------smart_mousearea
#const SMART_MOUSEAREA_RE_0			0			; �w��̗̈���Ƀ}�E�X�J�[�\�����Ȃ�
#const SMART_MOUSEAREA_RE_1			1			; �w��̗̈���Ƀ}�E�X�J�[�\��������

;-------smart_tap
#const SMART_TAP_RE_0				0			; �^�b�v����Ă��Ȃ�
#const SMART_TAP_RE_1				1			; �^�b�v����n�߂�(��ʂɎw������ꂽ)
#const SMART_TAP_RE_2				2			; �^�b�v���I�����(��ʂ���w�𗣂��ꂽ)

;-------smart_touch
#const SMART_TOUCH_RE_0				0			; �^�b�`(������)����Ă��Ȃ�
#const SMART_TOUCH_RE_1				1			; �^�b�`(������)���ꂽ
#const SMART_TOUCH_RE_2				2			; ��ʂ���w�𗣂��ꂽ

;-------smart_drag
#const SMART_DRAG_RE_0				0			; �h���b�O����Ă��Ȃ�
#const SMART_DRAG_RE_1				1			; �h���b�O����Ă���(����������Ă���)
#const SMART_DRAG_RE_2				2			; �h���b�O���I�����ꂽ(��ʂ���w�𗣂��ꂽ)

;-------smart_dtap
#const SMART_DTAP_RE_0				0			; �_�u���^�b�v����Ă��Ȃ�
#const SMART_DTAP_RE_1				1			; �P��ڂ̃^�b�v�����ꂽ(��ʂɎw������ꂽ)
#const SMART_DTAP_RE_2				2			; �P��ڂ̃^�b�v���I�����(��ʂ���w�𗣂��ꂽ)
#const SMART_DTAP_RE_3				3			; �Q��ڂ̃^�b�v(�_�u���^�b�v)�����ꂽ(��ʂɎw������ꂽ)

;-------smart_vswipe
#const SMART_VSWIPE_RE_0			0			; �X���C�v����Ă��Ȃ�
#const SMART_VSWIPE_RE_1			1			; �^�b�v�����ꂽ(��ʂɎw������ꂽ)
#const SMART_VSWIPE_RE_A2			2			; �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
#const SMART_VSWIPE_RE_A3			3			;
#const SMART_VSWIPE_RE_A4			4			;
#const SMART_VSWIPE_RE_A5			5			;
#const SMART_VSWIPE_RE_A6			6			;
#const SMART_VSWIPE_RE_A7			7			;
#const SMART_VSWIPE_RE_A8			8			;
#const SMART_VSWIPE_RE_A9			9			;
#const SMART_VSWIPE_RE_A10			10			;
#const SMART_VSWIPE_RE_A11			11			; �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
#const SMART_VSWIPE_RE_B2			-2			; �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
#const SMART_VSWIPE_RE_B3			-3			;
#const SMART_VSWIPE_RE_B4			-4			;
#const SMART_VSWIPE_RE_B5			-5			;
#const SMART_VSWIPE_RE_B6			-6			;
#const SMART_VSWIPE_RE_B7			-7			;
#const SMART_VSWIPE_RE_B8			-8			;
#const SMART_VSWIPE_RE_B9			-9			;
#const SMART_VSWIPE_RE_B10			-10			;
#const SMART_VSWIPE_RE_B11			-11			; �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)

;-------smart_hswipe
#const SMART_HSWIPE_RE_0			0			; �X���C�v����Ă��Ȃ�
#const SMART_HSWIPE_RE_1			1			; �^�b�v�����ꂽ(��ʂɎw������ꂽ)
#const SMART_HSWIPE_RE_A2			2			; ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
#const SMART_HSWIPE_RE_A3			3			;
#const SMART_HSWIPE_RE_A4			4			;
#const SMART_HSWIPE_RE_A5			5			;
#const SMART_HSWIPE_RE_A6			6			;
#const SMART_HSWIPE_RE_A7			7			;
#const SMART_HSWIPE_RE_A8			8			;
#const SMART_HSWIPE_RE_A9			9			;
#const SMART_HSWIPE_RE_A10			10			;
#const SMART_HSWIPE_RE_A11			11			; ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
#const SMART_HSWIPE_RE_B2			-2			; �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
#const SMART_HSWIPE_RE_B3			-3			;
#const SMART_HSWIPE_RE_B4			-4			;
#const SMART_HSWIPE_RE_B5			-5			;
#const SMART_HSWIPE_RE_B6			-6			;
#const SMART_HSWIPE_RE_B7			-7			;
#const SMART_HSWIPE_RE_B8			-8			;
#const SMART_HSWIPE_RE_B9			-9			;
#const SMART_HSWIPE_RE_B10			-10			;
#const SMART_HSWIPE_RE_B11			-11			; �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)

;-------smart_one
#const SMART_ONE_RE_0				0			; �^�b�v����Ă��Ȃ�(�������͉����������Ă���)
#const SMART_ONE_RE_1				1			; �^�b�v(��ʂ�������)�����ꂽ

;-------smart_mtouch
#const SMART_MTOUCH_RE_0			0			; �w��̗̈�����^�b�`���Ă��Ȃ�
#const SMART_MTOUCH_RE_1			1			; �w��̗̈�����^�b�`���Ă���

;-------smart_re_analog
#const SMART_ANALOG_RE_0			0			; �w��̗̈�����^�b�`���Ă��Ȃ�
#const SMART_ANALOG_RE_1			1			; �w��̗̈�����^�b�`���Ă���
#const SMART_ANALOG_RE_2			2			; �w��̗̈�����͂ݏo���ă^�b�`���Ă���

;-------
#const SMART_GETKEY_REPEAT_MODE_0	0			; ��x�������o
#const SMART_GETKEY_REPEAT_MODE_1	1			; �A���Ō��o
#const SMART_GETKEY_REPEAT_MODE_2	2			; �A���Ō��o(�����ꂽ�u�Ԃ����o)

;-------
#define global ctype smart_mousearea(%1 = 0, %2 = 0, %3 = 0, %4 = 0) _smart_mousearea(%1, %2, %3, %4)
#define global smart_add(%1 = 0) _smart_add %1
#define global smart_max _smart_max(0)
#define global ctype smart_mode_get(%1 = 0) _smart_mode_get(%1)
#define global ctype smart_tap(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0, %6 = DEFAULT_TAP_INTERVAL@mod_smart, %7 = 0) _smart_tap(%1, %2, %3, %4, %5, %6, %7)
#define global ctype smart_touch(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0, %6 = DEFAULT_TOUCH_INTERVAL@mod_smart) _smart_touch(%1, %2, %3, %4, %5, %6)
#define global ctype smart_drag(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0, %6 = DEFAULT_DRAG_INTERVAL@mod_smart) _smart_drag(%1, %2, %3, %4, %5, %6)
#define global ctype smart_dtap(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0, %6 = DEFAULT_DOUBLE_TAP_INTERVAL@mod_smart) _smart_dtap(%1, %2, %3, %4, %5, %6)
#define global ctype smart_vswipe(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0, %6 = DEFAULT_SWIPE_INTERVAL@mod_smart, %7 = 0, %8 = 0) _smart_vswipe(%1, %2, %3, %4, %5, %6, %7, %8)
#define global ctype smart_hswipe(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0, %6 = DEFAULT_SWIPE_INTERVAL@mod_smart, %7 = 0, %8 = 0) _smart_hswipe(%1, %2, %3, %4, %5, %6, %7, %8)
#define global ctype smart_pinch(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0) _smart_pinch(%1, %2, %3, %4, %5)
#define global ctype smart_one(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0, %6 = 0) _smart_one(%1, %2, %3, %4, %5, %6)
#define global ctype smart_mtouch(%1 = 0, %2 = 0, %3 = 0, %4 = 0, %5 = 0) _smart_mtouch(%1, %2, %3, %4, %5)
#define global smart_keep(%1, %2, %3, %4, %5, %6, %7) _smart_keep %1, %2, %3, %4, %5, %6, %7
#define global smart_analog(%1 = 0, %2, %3 = 0, %4 = 0, %5 = 0) _smart_analog %1, %2, %3, %4, %5
#define global smart_reset(%1) _smart_reset %1
#define GET_MILI_TIME (gettime(4) * 1000 * 60 * 60) + (gettime(5) * 1000 * 60) + (gettime(6) * 1000) + gettime(7)


;-----------------------------------------------------
; smart_init
;
; ���W���[���̏�������
;-----------------------------------------------------
#deffunc smart_init

	; �ȉ��̊֐����߂ŋ��ʂ��Ďg�p����z��
	;
	; smrat_tap(�^�b�v)
	; smart_touch(�^�b�`)
	; smart_dtap(�_�u���^�b�v)
	; smart_drag(�h���b�O)
	; smart_vswipe,smart_hswipe((�X���C�v)
	; smart_pinch(�s���`�C��/�A�E�g)
	; smart_one(�G�ꂽ�u�Ԃ���x�������o)
	; smart_mtouch(�}���`�^�b�`)
	; smart_keep
	; smart_analog
	dim tv,    1, 4			; ����
	dim cp,    1, 4			; �p�����[�^
	dim moux,  1, 4			; �}�E�XX���W
	dim mouy,  1, 4			; �}�E�XY���W
	dim add_m, 1			;


	; smart_max�p
	smart_add_max = 0


	; smart_analog�p
	result_circle_x			= 0
	result_circle_y			= 0


	; �ȉ��̊֐����߂ŋ��ʂ��Ďg�p����z��
	;
	; smrat_tap(�^�b�v)
	; smart_one(�G�ꂽ�u�Ԃ���x�������o)
	; smart_mtouch(�}���`�^�b�`)
	dim dkey, 256

	; smart_key_mode�p
	push_key_get_use_flg	= FALSE


	return


;-----------------------------------------------------
; smart_mousearea
;
; �w��̗̈���Ƀ}�E�X�J�[�\�������邩�擾
;
; x1 : ����X���W
; y1 : ����Y���W
; x2 : �E��X���W
; y2 : �E��Y���W
;
; �߂�l(0 = �w��̗̈���Ƀ}�E�X�J�[�\�����Ȃ�)
;       (1 = �w��̗̈���Ƀ}�E�X�J�[�\��������)
;
;=====================================================
; SAMPLE
;	if smart_mousearea(0, 0, 100, 200) = 1 : dialog "OK"
;-----------------------------------------------------
#defcfunc _smart_mousearea int x1, int y1, int x2, int y2

	re = SMART_MOUSEAREA_RE_0
	
	if mousex >= x1 {
		if mousex <= x2 {
			if mousey >= y1 {
				if mousey <= y2 {
					re = SMART_MOUSEAREA_RE_1
				}
			}
		}
	}
	
	return re


;-----------------------------------------------------
; smart_add
;
; �^�b�v���̑�����擾���邽�߂̃A�N�V������ǉ����܂��B
;
;
; add_mode           : �ǉ�����A�N�V�������[�h(���Ⴆ�΁A0=�^�b�v, 1=�^�b�`, 2=�h���b�O, 3=�_�u���^�b�v, 4=�c�X���C�v, 5=���X���C�v�@�Ȃ�)
;                      (��smart_get�֐��Ŏw�肵���A�N�V�����ԍ����ǂ̑���̂��̂��𒲂ׂ�̂ɗ��p���Ă�������)
;                      (���A�N�V�������[�h�͏ȗ��\�ł�)
;
; ���ߏI����A�V�X�e���ϐ�(stat)�ɃA�N�V�����ԍ�������܂��B
;
;=====================================================
; SAMPLE
;
;	smart_add 1 : act_number = stat
;
;-----------------------------------------------------
#deffunc smart_add int add_mode

	;----------------- tv
	d1 = length(tv)
	d2 = length2(tv)
	
	dim d_tv, d1, d2
	
	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			d_tv(cnt_d1, cnt_d2) = tv(cnt_d1, cnt_d2)
		loop
	loop

	dim tv, d1 + 1, d2

	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			tv(cnt_d1, cnt_d2) = d_tv(cnt_d1, cnt_d2)
		loop
	loop

	dim d_tv, 1, 1

	;----------------- cp
	d1 = length(cp)
	d2 = length2(cp)
	
	dim d_cp, d1, d2
	
	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			d_cp(cnt_d1, cnt_d2) = cp(cnt_d1, cnt_d2)
		loop
	loop

	dim cp, d1 + 1, d2

	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			cp(cnt_d1, cnt_d2) = d_cp(cnt_d1, cnt_d2)
		loop
	loop

	dim d_cp, 1, 1

	;----------------- moux
	d1 = length(moux)
	d2 = length2(moux)
	
	dim d_moux, d1, d2
	
	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			d_moux(cnt_d1, cnt_d2) = moux(cnt_d1, cnt_d2)
		loop
	loop

	dim moux, d1 + 1, d2

	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			moux(cnt_d1, cnt_d2) = d_moux(cnt_d1, cnt_d2)
		loop
	loop

	dim d_moux, 1, 1

	;----------------- mouy
	d1 = length(mouy)
	d2 = length2(mouy)
	
	dim d_mouy, d1, d2
	
	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			d_mouy(cnt_d1, cnt_d2) = mouy(cnt_d1, cnt_d2)
		loop
	loop

	dim mouy, d1 + 1, d2

	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			mouy(cnt_d1, cnt_d2) = d_mouy(cnt_d1, cnt_d2)
		loop
	loop

	dim d_mouy, 1, 1

	;----------------- add_m
	d1 = length(add_m)
	
	dim d_add_m, d1
	
	repeat d1
		cnt_d1 = cnt
		d_add_m(cnt_d1) = add_m(cnt_d1)
	loop

	dim add_m, d1 + 1

	repeat d1
		cnt_d1 = cnt
		add_m(cnt_d1) = d_add_m(cnt_d1)
	loop
	
	re = d1 - 1	
	
	add_m(re) = add_mode

	dim d_add_m, 1


	smart_add_max = re + 1

	return re


;-----------------------------------------------------
; smart_max
;
; smart_add���߂ɂ��ǉ����ꂽ�A�N�V�����̐����擾���܂��B
;
; �߂�l
;   0 �` = smart_add���߂ɂ��ǉ����ꂽ�A�N�V�����̐�
;
;
;=====================================================
; SAMPLE
;
;   smart_add
;	a = smart_max
;
;   title "" + a
;
;-----------------------------------------------------
#defcfunc _smart_max int dummy

	return smart_add_max


;-----------------------------------------------------
; smart_mode_get
;
; �w��̃A�N�V�����ԍ�����A�N�V�������[�h���擾���܂��B
;
;
; act_num           : �A�N�V�������[�h���擾�������A�N�V�����ԍ�
;
;
; �߂�l
;   0 �` = �A�N�V�������[�h
;
;
;=====================================================
; SAMPLE
;
;   smart_add, 1
;   action_number = stat
;	action_mode = smart_mode_get(action_number)
;
;   title "" + action_mode
;
;-----------------------------------------------------
#defcfunc _smart_mode_get int act_num

	d1 = length(add_m) - 1

	if act_num >= d1 {
		re = -1
	} else {
		re = add_m(act_num)
	}

	return re


;-----------------------------------------------------
#deffunc smart_keymode int key_mode

	push_key_get_use_flg = key_mode

	return


;-----------------------------------------------------
; smart_tap
;
; �^�b�v���擾
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; x1, y1, x2, y2    : �^�b�v��F�������ʍ��W
; tap_interval      : �w��̎��Ԃ̊Ԃɉ�ʂ��w�ŉ����ė����܂ł��^�b�v�ƔF������(�P�ʁF�~���b)�B�ȗ����́A400�~���b�Ƃ���B
;
;
; �߂�l
;   0 = �^�b�v����Ă��Ȃ�
;   1 = �^�b�v����n�߂�(��ʂɎw������ꂽ)
;   2 = �^�b�v���I�����(��ʂ���w�𗣂��ꂽ)
;
;
;=====================================================
; SAMPLE
;
;   smart_add
;	if smart_tap(stat, 0, 0, 319, 479, 400) = 2 : mes "TAP OK"
;
;-----------------------------------------------------
#defcfunc _smart_tap int act_num, int x1, int y1, int x2, int y2, int tap_interval, int push_key

	tap_key			= 0
	t_interval		= tap_interval
	push_key_flg	= FALSE

	if push_key > 0 && push_key_get_use_flg {
		func_dgetkey@mod_smart tap_key, push_key, SMART_GETKEY_REPEAT_MODE_1
		if tap_key > 0 {
			push_key_flg			= TRUE
			cp(act_num, PARAM_2)	= CP_MODE_1		; �L�[�������ꂽ�t���O
		}
	}
	if push_key_flg == FALSE {
		dim touch_id, 1 : mtlist touch_id : tap_key = stat
	}

	if tap_key > 0 {
		dim touch, tap_key
		mtinfo touch, touch_id(0)
		i					= cp(act_num, PARAM_1)
		tv(act_num, i)		= GET_MILI_TIME
		moux(act_num, i)	= touch(1)
		mouy(act_num, i)	= touch(2)

		if i == CP_MODE_0 {
			cp(act_num, PARAM_1) = CP_MODE_1
			re = SMART_TAP_RE_0
			if push_key_flg {
				re = SMART_TAP_RE_1
			} else {
				if moux(act_num, 0) >= x1 {
					if moux(act_num, 0) <= x2 {
						if mouy(act_num, 0) >= y1 {
							if mouy(act_num, 0) <= y2 {
								re = SMART_TAP_RE_1
							}
						}
					}
				}
			}
			if re == SMART_TAP_RE_0 {
				return SMART_TAP_RE_0
			} else {
				return SMART_TAP_RE_1
			}
		}

		if i == CP_MODE_1 {
			re = SMART_TAP_RE_0
			if push_key_flg {
				re = SMART_TAP_RE_1
			} else {
				if moux(act_num, 0) >= x1 {
					if moux(act_num, 0) <= x2 {
						if mouy(act_num, 0) >= y1 {
							if mouy(act_num, 0) <= y2 {
								re = SMART_TAP_RE_1
							}
						}
					}
				}
			}
			if re == SMART_TAP_RE_0 : return SMART_TAP_RE_0

			re = SMART_TAP_RE_0
			if push_key_flg {
				re = SMART_TAP_RE_1
			} else {
				if moux(act_num, 1) >= x1 {
					if moux(act_num, 1) <= x2 {
						if mouy(act_num, 1) >= y1 {
							if mouy(act_num, 1) <= y2 {
								re = SMART_TAP_RE_1
							}
						}
					}
				}
			}
			if re == SMART_TAP_RE_0 : return SMART_TAP_RE_0

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)
			if (t > t_interval) && (t_interval != -1) {
				return SMART_TAP_RE_0
			} else {
				return SMART_TAP_RE_1
			}
		}
	}

	if tap_key == 0 {
		i = cp(act_num, PARAM_1)
		if i == CP_MODE_1 {
			dim touch, 1
			mtinfo touch, touch_id(0)
			tv(act_num, i)		= GET_MILI_TIME
			moux(act_num, i)	= touch(1)
			mouy(act_num, i)	= touch(2)

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)

			if (t <= t_interval) || (t_interval == -1) {

				cp(act_num, PARAM_1) = CP_MODE_2

				re = SMART_TAP_RE_0
				if cp(act_num, PARAM_2) == CP_MODE_1 {
					re = SMART_TAP_RE_1
				} else {
					if moux(act_num, 0) >= x1 {
						if moux(act_num, 0) <= x2 {
							if mouy(act_num, 0) >= y1 {
								if mouy(act_num, 0) <= y2 {
									re = SMART_TAP_RE_1
								}
							}
						}
					}
				}
				if re == SMART_TAP_RE_0 : return SMART_TAP_RE_0

				re = SMART_TAP_RE_0
				if cp(act_num, PARAM_2) == CP_MODE_1 {
					re = SMART_TAP_RE_1
				} else {
					if moux(act_num, 1) >= x1 {
						if moux(act_num, 1) <= x2 {
							if mouy(act_num, 1) >= y1 {
								if mouy(act_num, 1) <= y2 {
									re = SMART_TAP_RE_1
								}
							}
						}
					}
				}
				if re == SMART_TAP_RE_0 {
					return SMART_TAP_RE_0
				} else {
					return SMART_TAP_RE_2
				}
			}
		}
	}

	tv(act_num, 0)			= 0
	tv(act_num, 1)			= 0
	tv(act_num, 2)			= 0
	tv(act_num, 3)			= 0
	cp(act_num, PARAM_1)	= CP_MODE_0
	cp(act_num, PARAM_2)	= CP_MODE_0

	return SMART_TAP_RE_0


;-----------------------------------------------------
; smart_touch
;
; �^�b�`(������)���擾  (���^�b�`���F�����ꂽ��A���̂܂܎w��������Ă��Ă��^�b�`�ƔF������܂���B)
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; x1, y1, x2, y2    : �^�b�`��F�������ʍ��W
; touch_interval    : �^�b�`�ƔF������܂ł̎���(�P�ʁF�~���b)�B�ȗ����́A1000�~���b�Ƃ���B
;
;
; �߂�l
;   0 = �^�b�`(������)����Ă��Ȃ�
;   1 = �^�b�`(������)���ꂽ(��ʂɎw����������ꂽ)
;   2 = �^�b�`(������)���I�����(��ʂ���w�𗣂��ꂽ)
;
;
;=====================================================
; SAMPLE
;
;   smart_add
;	if smart_touch(stat, 0, 0, 319, 479, 1000) = 1 : mes "TOUCH OK"
;
;-----------------------------------------------------
#defcfunc _smart_touch int act_num, int x1, int y1, int x2, int y2, int touch_interval

	t_interval = touch_interval
	dim touch_id, 1 : mtlist touch_id : touch_key = stat

	if touch_key > 0 {
		if cp(act_num, PARAM_1) == CP_MODE_2 : return SMART_TOUCH_RE_0
		dim touch, touch_key
		mtinfo touch, touch_id(0)
		i					= cp(act_num, PARAM_1)
		tv(act_num, i)		= GET_MILI_TIME
		moux(act_num, i)	= touch(1)
		mouy(act_num, i)	= touch(2)

		if i == CP_MODE_0 {
			cp(act_num, PARAM_1) = CP_MODE_1
			return SMART_TOUCH_RE_0
		}
		
		if i == CP_MODE_1 {

			re = SMART_TOUCH_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_TOUCH_RE_1
						}
					}
				}
			}
			if re == SMART_TOUCH_RE_0 : return SMART_TOUCH_RE_0

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)
			if t < t_interval : return SMART_TOUCH_RE_0
			
			re = SMART_TOUCH_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_TOUCH_RE_1
						}
					}
				}
			}
			if re == SMART_TOUCH_RE_0 : return SMART_TOUCH_RE_0
	
			re = SMART_TOUCH_RE_0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = SMART_TOUCH_RE_1
						}
					}
				}
			}
			if re == SMART_TOUCH_RE_0 : return SMART_TOUCH_RE_0

			tv(act_num, 0)			= 0
			tv(act_num, 1)			= 0
			cp(act_num, PARAM_1)	= CP_MODE_2
			return SMART_TOUCH_RE_1

		}
	}

	if touch_key == 0 {
		i = cp(act_num, PARAM_1)
		if i == CP_MODE_2 {

			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							tv(act_num, 0)			= 0
							tv(act_num, 1)			= 0
							cp(act_num, PARAM_1)	= CP_MODE_3
							return SMART_TOUCH_RE_2
						}
					}
				}
			}

		}			
	}

	tv(act_num, 0)			= 0
	tv(act_num, 1)			= 0
	tv(act_num, 2)			= 0
	tv(act_num, 3)			= 0
	cp(act_num, PARAM_1)	= CP_MODE_0

	return SMART_TOUCH_RE_0


;-----------------------------------------------------
; smart_drag
;
; �h���b�O���擾
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; x1, y1, x2, y2    : �h���b�O��F�������ʍ��W�̈�
; drag_interval     : �h���b�O�ƔF������܂ł̎���(�P�ʁF�~���b)�B�ȗ����́A1000�~���b�Ƃ���B
;
;
; �߂�l
;   0 = �h���b�O����Ă��Ȃ�
;   1 = �h���b�O����Ă���(��ʂɎw����������ꂽ)
;   2 = �h���b�O���I�����ꂽ(��ʂ���w�𗣂��ꂽ)
;
;
;=====================================================
; SAMPLE
;
;   smart_add : act_num = stat
;
;   repeat
;        redraw 0
;
;        color 255, 0, 0
;        boxf x, y, x + 200, y + 200
;
;        drag = smart_drag(act_num, x, y, x + 170, y + 50, 1000)
;
;        if drag = 0 {
;             start_x = mousex - x
;             start_y = mousey - y
;	     }
;        if drag = 1 {
;             x = mousex - start_x
;             y = mousey - start_y
;        }
;        if drag = 2 {
;             mes "DRAG FINISH"
;             wait 1000
;        }
;
;        redraw 1
;        wait 1
;   loop
;
;-----------------------------------------------------
#defcfunc _smart_drag int act_num, int x1, int y1, int x2, int y2, int drag_interval

	t_interval = drag_interval
	dim touch_id, 1 : mtlist touch_id : drag_key = stat

	if drag_key > 0 {
		dim touch, drag_key
		mtinfo touch, touch_id(0)
		i					= cp(act_num, PARAM_1)
		tv(act_num, i)		= GET_MILI_TIME
		moux(act_num, i)	= touch(1)
		mouy(act_num, i)	= touch(2)

		if i == CP_MODE_0 {
			cp(act_num, PARAM_1) = CP_MODE_1
			return SMART_DRAG_RE_0
		}
		
		if i == CP_MODE_1 {

			re = SMART_DRAG_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_DRAG_RE_1
						}
					}
				}
			}
			if re == SMART_DRAG_RE_0 : return SMART_DRAG_RE_0

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)
			if t < t_interval : return SMART_DRAG_RE_0

			moux(act_num, 0) = moux(act_num, 1)
			mouy(act_num, 0) = mouy(act_num, 1)
			
			re = SMART_DRAG_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_DRAG_RE_1
						}
					}
				}
			}
			if re == SMART_DRAG_RE_0 : return SMART_DRAG_RE_0
	
			re = SMART_DRAG_RE_0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = SMART_DRAG_RE_1
						}
					}
				}
			}
			if re == SMART_DRAG_RE_0 {
				return SMART_DRAG_RE_0
			} else {
				return SMART_DRAG_RE_1
			}
		}
	}

	if drag_key == 0 {
		i = cp(act_num, PARAM_1)
		if i == CP_MODE_1 {
			dim touch, 1
			mtinfo touch, touch_id(0)
			tv(act_num, i)		= GET_MILI_TIME
			moux(act_num, i)	= touch(1)
			mouy(act_num, i)	= touch(2)

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)

			if t >= t_interval {
				
				cp(act_num, PARAM_1) = CP_MODE_2
	
				re = SMART_DRAG_RE_0
				if moux(act_num, 0) >= x1 {
					if moux(act_num, 0) <= x2 {
						if mouy(act_num, 0) >= y1 {
							if mouy(act_num, 0) <= y2 {
								re = SMART_DRAG_RE_1
							}
						}
					}
				}
				if re == SMART_DRAG_RE_0 : return SMART_DRAG_RE_0
	
				re = SMART_DRAG_RE_0
				if moux(act_num, 1) >= x1 {
					if moux(act_num, 1) <= x2 {
						if mouy(act_num, 1) >= y1 {
							if mouy(act_num, 1) <= y2 {
								re = SMART_DRAG_RE_1
							}
						}
					}
				}
				if re == SMART_DRAG_RE_0 {
					return SMART_DRAG_RE_0
				} else {
					return SMART_DRAG_RE_2
				}
			}
		}
	}

	tv(act_num, 0)			= 0
	tv(act_num, 1)			= 0
	tv(act_num, 2)			= 0
	tv(act_num, 3)			= 0
	cp(act_num, PARAM_1)    = CP_MODE_0

	return SMART_DRAG_RE_0


;-----------------------------------------------------
; smart_dtap
;
; �_�u���^�b�v���擾
;
;
; act_num             : �A�N�V�������擾����A�N�V�����ԍ�
; x1, y1, x2, y2      : �_�u���^�b�v��F�������ʍ��W
; double_tap_interval : �w��̎��Ԃ̊Ԃɉ�ʂ��w�ŉ����ė����ĉ����܂ł��_�u���^�b�v�ƔF������(�P�ʁF�~���b)�B�ȗ����́A700�~���b�Ƃ���B
;
;
; �߂�l
;   0 = �_�u���^�b�v����Ă��Ȃ�
;   1 = �P��ڂ̃^�b�v�����ꂽ(��ʂɎw������ꂽ)
;   2 = �P��ڂ̃^�b�v���I�����(��ʂ���w�𗣂��ꂽ)
;   3 = �Q��ڂ̃^�b�v(�_�u���^�b�v)�����ꂽ(��ʂɎw������ꂽ)
;
;
;=====================================================
; SAMPLE
;
;   smart_add
;   if smart_dtap(stat, 0, 0, 319, 479, 700) = 3 : mes "DOUBLE TAP OK"
;
;-----------------------------------------------------
#defcfunc _smart_dtap int act_num, int x1, int y1, int x2, int y2, int double_tap_interval

	t_interval = double_tap_interval
	dim touch_id, 1 : mtlist touch_id : double_tap_key = stat

	if double_tap_key > 0 {
		dim touch, double_tap_key
		mtinfo touch, touch_id(0)
		i					= cp(act_num, PARAM_1)
		tv(act_num, i)		= GET_MILI_TIME
		moux(act_num, i)	= touch(1)
		mouy(act_num, i)	= touch(2)
		
		if i == CP_MODE_0 {
			cp(act_num, PARAM_1) = CP_MODE_1
			re = SMART_DTAP_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_DTAP_RE_1
						}
					}
				}
			}
			if re == SMART_DTAP_RE_0 {
				return SMART_DTAP_RE_0
			} else {
				return SMART_DTAP_RE_1
			}
		}
		
		if i == CP_MODE_1 {
			re = SMART_DTAP_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_DTAP_RE_1
						}
					}
				}
			}
			if re == SMART_DTAP_RE_0 : return SMART_DTAP_RE_0

			re = SMART_DTAP_RE_0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = SMART_DTAP_RE_1
						}
					}
				}
			}
			if re == SMART_DTAP_RE_0 : return SMART_DTAP_RE_0

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)
			if t > t_interval {
				return SMART_DTAP_RE_0
			} else {
				return SMART_DTAP_RE_1
			}
		}

		if i == CP_MODE_2 {
			re = SMART_DTAP_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_DTAP_RE_1
						}
					}
				}
			}
			if re == SMART_DTAP_RE_0 : return SMART_DTAP_RE_0

			re = SMART_DTAP_RE_0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = SMART_DTAP_RE_1
						}
					}
				}
			}
			if re == SMART_DTAP_RE_0 : return SMART_DTAP_RE_0
	
			re = SMART_DTAP_RE_0
			if moux(act_num, 2) >= x1 {
				if moux(act_num, 2) <= x2 {
					if mouy(act_num, 2) >= y1 {
						if mouy(act_num, 2) <= y2 {
							re = SMART_DTAP_RE_1
						}
					}
				}
			}
			if re == SMART_DTAP_RE_0 : return SMART_DTAP_RE_0

			if tv(act_num, 0) > tv(act_num, 2) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 2)
			t = tv(act_num, 2) - tv(act_num, 0)
			if t > t_interval : return SMART_DTAP_RE_0
			cp(act_num, PARAM_1) = CP_MODE_3
			return SMART_DTAP_RE_3
		}
	
		if i == CP_MODE_3 : return SMART_DTAP_RE_0
		
	}

	if double_tap_key == 0 {
		i = cp(act_num, PARAM_1)
		if (i == CP_MODE_1) || (i == CP_MODE_2) {
			dim touch, 1
			mtinfo touch, touch_id(0)
			tv(act_num, i)		= GET_MILI_TIME
			moux(act_num, i)	= touch(1)
			mouy(act_num, i)	= touch(2)

			if tv(act_num, 0) > tv(act_num, i) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, i)
			t = tv(act_num, i) - tv(act_num, 0)

			if t <= t_interval {

				cp(act_num, PARAM_1) = CP_MODE_2
	
				re = SMART_DTAP_RE_0
				if moux(act_num, 0) >= x1 {
					if moux(act_num, 0) <= x2 {
						if mouy(act_num, 0) >= y1 {
							if mouy(act_num, 0) <= y2 {
								re = SMART_DTAP_RE_1
							}
						}
					}
				}
				
				if re == SMART_DTAP_RE_0 {
					cp(act_num, PARAM_1) = CP_MODE_0
					return SMART_DTAP_RE_0
				}

				re = SMART_DTAP_RE_0
				if moux(act_num, i) >= x1 {
					if moux(act_num, i) <= x2 {
						if mouy(act_num, i) >= y1 {
							if mouy(act_num, i) <= y2 {
								re = SMART_DTAP_RE_1
							}
						}
					}
				}
				if re == SMART_DTAP_RE_0 {
					return SMART_DTAP_RE_0
				} else {
					return SMART_DTAP_RE_2
				}
			}
		}
	}
	
	tv(act_num, 0)			= 0
	tv(act_num, 1)			= 0
	tv(act_num, 2)			= 0
	tv(act_num, 3)			= 0	
	cp(act_num, PARAM_1)	= CP_MODE_0

	return SMART_DTAP_RE_0


;-----------------------------------------------------
; smart_vswipe
;
; �c�X���C�v���擾
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; x1, y1, x2, y2    : �c�X���C�v��F�������ʍ��W
; swipe_interval    : �w��̎��Ԃ̊Ԃɉ�ʂ��w�ŉ����ė����܂ł��c�X���C�v�ƔF������(�P�ʁF�~���b)�B�ȗ����́A600�~���b�Ƃ���B
; min_movement      : �c�X���C�v�ƔF������c�̍ŏ��ړ���
; max_movement      : �c�X���C�v�ƔF������c�̍ő�ړ���
;
;
; �߂�l
;    0 = �X���C�v����Ă��Ȃ�
;    1 = �^�b�v�����ꂽ(��ʂɎw������ꂽ)
;
;    2 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
;    3 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    4 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    5 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    6 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    7 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    8 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    9 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   10 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   11 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
;
;   -2 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
;   -3 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -4 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -5 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -6 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -7 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -8 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -9 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;  -10 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;  -11 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
;
;=====================================================
; SAMPLE
;
;   smart_add
;	if smart_vswipe(stat, 0, 0, 319, 479, 400, 10, 479) = 2 : mes "VERTICAL SWIPE OK"
;
;-----------------------------------------------------
#defcfunc _smart_vswipe int act_num, int x1, int y1, int x2, int y2, int swipe_interval, int min_movement, int max_movement

	t_interval = swipe_interval
	dim touch_id, 1 : mtlist touch_id : swipe_key = stat

	if swipe_key > 0 {
		dim touch, swipe_key
		mtinfo touch, touch_id(0)
		i					= cp(act_num, PARAM_1)
		tv(act_num, i)		= GET_MILI_TIME
		moux(act_num, i)	= touch(1)
		mouy(act_num, i)	= touch(2)

		if i == CP_MODE_0 {
			cp(act_num, PARAM_1) = CP_MODE_1
			re = SMART_VSWIPE_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_VSWIPE_RE_1
						}
					}
				}
			}
			if re == SMART_VSWIPE_RE_0 {
				return SMART_VSWIPE_RE_0
			} else {
				return SMART_VSWIPE_RE_1
			}
		}
		
		if i == CP_MODE_1 {
			re = SMART_VSWIPE_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_VSWIPE_RE_1
						}
					}
				}
			}
			if re == SMART_VSWIPE_RE_0 : return SMART_VSWIPE_RE_0

			re = SMART_VSWIPE_RE_0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = SMART_VSWIPE_RE_1
						}
					}
				}
			}
			if re == SMART_VSWIPE_RE_0 : return SMART_VSWIPE_RE_0

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)
			if (t > t_interval) && (t_interval != -1) {
				return SMART_VSWIPE_RE_0
			} else {
				return SMART_VSWIPE_RE_1
			}
		}
	}

	if swipe_key == 0 {
		i  = cp(act_num, PARAM_1)
		if i == CP_MODE_1 {
			dim touch, 1
			mtinfo touch, touch_id(0)
			tv(act_num, i)		= GET_MILI_TIME
			moux(act_num, i)	= touch(1)
			mouy(act_num, i)	= touch(2)

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)

			if (t <= t_interval) || (t_interval == -1) {
				
				cp(act_num, PARAM_1) = CP_MODE_2
	
				re = SMART_VSWIPE_RE_0
				if moux(act_num, 0) >= x1 {
					if moux(act_num, 0) <= x2 {
						if mouy(act_num, 0) >= y1 {
							if mouy(act_num, 0) <= y2 {
								re = SMART_VSWIPE_RE_1
							}
						}
					}
				}
				if re == SMART_VSWIPE_RE_0 : return SMART_VSWIPE_RE_0
	
				re = 0
				if moux(act_num, 1) >= x1 {
					if moux(act_num, 1) <= x2 {
						if mouy(act_num, 1) >= y1 {
							if mouy(act_num, 1) <= y2 {
								re = SMART_VSWIPE_RE_1
							}
						}
					}
				}
				if re == SMART_VSWIPE_RE_0 : return SMART_VSWIPE_RE_0

				move_way	= 0
				move_moment	= 0
				move_moment	= mouy(act_num, 0) - mouy(act_num, 1)
				abs_moment	= abs(move_moment)

				dim y_point, POINT_SPLIT
				
				y_point(0) = y1 + (abs(y1 - y2) / 10)
				repeat POINT_SPLIT
					y_point(cnt + 1) = y_point(cnt) + (abs(y1 - y2) / 10)
				loop

				re = SMART_VSWIPE_RE_0
				if abs_moment >= min_movement {
					if abs_moment <= max_movement {
						re = SMART_VSWIPE_RE_1
					}
				}
				if re == SMART_VSWIPE_RE_0 : return SMART_VSWIPE_RE_0
				
				if move_moment == 0 : return SMART_VSWIPE_RE_0
				if move_moment < 0  : move_way = 1	;�ォ�牺
				if move_moment > 0  : move_way = 2	;�������

				if abs_moment >= y1 {
					if abs_moment <= y_point(0) {
						if move_way == 1 : return SMART_VSWIPE_RE_A2	;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B2	;�������
					}
				}
				if abs_moment > y_point(0) {
					if abs_moment <= y_point(1) {
						if move_way == 1 : return SMART_VSWIPE_RE_A3	;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B3	;�������
					}
				}
				if abs_moment > y_point(1) {
					if abs_moment <= y_point(2) {
						if move_way == 1 : return SMART_VSWIPE_RE_A4	;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B4	;�������
					}
				}
				if abs_moment > y_point(2) {
					if abs_moment <= y_point(3) {
						if move_way == 1 : return SMART_VSWIPE_RE_A5	;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B5	;�������
					}
				}
				if abs_moment > y_point(3) {
					if abs_moment <= y_point(4) {
						if move_way == 1 : return SMART_VSWIPE_RE_A6	;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B6	;�������
					}
				}
				if abs_moment > y_point(4) {
					if abs_moment <= y_point(5) {
						if move_way == 1 : return SMART_VSWIPE_RE_A7	;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B7	;�������
					}
				}
				if abs_moment > y_point(5) {
					if abs_moment <= y_point(6) {
						if move_way == 1 : return SMART_VSWIPE_RE_A8	;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B8	;�������
					}
				}
				if abs_moment > y_point(6) {
					if abs_moment <= y_point(7) {
						if move_way = 1 : return SMART_VSWIPE_RE_A9	;�ォ�牺
						if move_way = 2 : return SMART_VSWIPE_RE_B9	;�������
					}
				}
				if abs_moment > y_point(7) {
					if abs_moment <= y_point(8) {
						if move_way == 1 : return SMART_VSWIPE_RE_A10		;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B10	;�������
					}
				}
				if abs_moment > y_point(8) {
					if abs_moment <= y2 {
						if move_way == 1 : return SMART_VSWIPE_RE_A11		;�ォ�牺
						if move_way == 2 : return SMART_VSWIPE_RE_B11	;�������
					}
				}

			}
		}
	}
	
	tv(act_num, 0)			= 0
	tv(act_num, 1)			= 0
	tv(act_num, 2)			= 0
	tv(act_num, 3)			= 0
	cp(act_num, PARAM_1)	= CP_MODE_0

	return SMART_VSWIPE_RE_0


;-----------------------------------------------------
; smart_hswipe
;
; ���X���C�v���擾
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; x1, y1, x2, y2    : ���X���C�v��F�������ʍ��W
; swipe_interval    : �w��̎��Ԃ̊Ԃɉ�ʂ��w�ŉ����ė����܂ł����X���C�v�ƔF������(�P�ʁF�~���b)�B�ȗ����́A600�~���b�Ƃ���B
; min_movement      : ���X���C�v�ƔF������ŏ��ړ���
; max_movement      : ���X���C�v�ƔF������ő�ړ���
;
;
; �߂�l
;    0 = �X���C�v����Ă��Ȃ�
;    1 = �^�b�v�����ꂽ(��ʂɎw������ꂽ)
;
;    2 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
;    3 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    4 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    5 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    6 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    7 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    8 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    9 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   10 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   11 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
;
;   -2 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
;   -3 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -4 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -5 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -6 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -7 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -8 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -9 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;  -10 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;  -11 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
;
;=====================================================
; SAMPLE
;
;   smart_add
;	if smart_hswipe(stat, 0, 0, 319, 479, 400, 10, 319) = 2 : mes "HORIZON SWIPE OK"
;
;-----------------------------------------------------
#defcfunc _smart_hswipe int act_num, int x1, int y1, int x2, int y2, int swipe_interval, int min_movement, int max_movement

	t_interval = swipe_interval
	dim touch_id, 1 : mtlist touch_id : swipe_key = stat

	if swipe_key > 0 {
		dim touch, swipe_key
		mtinfo touch, touch_id(0)
		i					= cp(act_num, PARAM_1)
		tv(act_num, i)		= GET_MILI_TIME
		moux(act_num, i)	= touch(1)
		mouy(act_num, i)	= touch(2)
		
		if i == CP_MODE_0 {
			cp(act_num, PARAM_1) = CP_MODE_1
			re = SMART_HSWIPE_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_HSWIPE_RE_1
						}
					}
				}
			}
			if re == SMART_HSWIPE_RE_0 {
				return SMART_HSWIPE_RE_0
			} else {
				return SMART_HSWIPE_RE_1
			}
		}
		
		if i == CP_MODE_1 {
			re = SMART_HSWIPE_RE_0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = SMART_HSWIPE_RE_1
						}
					}
				}
			}
			if re == SMART_HSWIPE_RE_0 : return SMART_HSWIPE_RE_0

			re = SMART_HSWIPE_RE_0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = SMART_HSWIPE_RE_1
						}
					}
				}
			}
			if re == SMART_HSWIPE_RE_0 : return SMART_HSWIPE_RE_0

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)
			if (t > t_interval) && (t_interval != -1) {
				return SMART_HSWIPE_RE_0
			} else {
				return SMART_HSWIPE_RE_1
			}
		}
	}

	if swipe_key == 0 {
		i  = cp(act_num, PARAM_1)
		if i == CP_MODE_1 {
			dim touch, 1
			mtinfo touch, touch_id(0)
			tv(act_num, i)		= GET_MILI_TIME
			moux(act_num, i)	= touch(1)
			mouy(act_num, i)	= touch(2)

			if tv(act_num, 0) > tv(act_num, 1) : tv(act_num, 0) = SARCH_TIME_MAX - tv(act_num, 0) + tv(act_num, 1)
			t = tv(act_num, 1) - tv(act_num, 0)

			if (t <= t_interval) || (t_interval == -1) {
				
				cp(act_num, PARAM_1) = CP_MODE_2
	
				re = SMART_HSWIPE_RE_0
				if moux(act_num, 0) >= x1 {
					if moux(act_num, 0) <= x2 {
						if mouy(act_num, 0) >= y1 {
							if mouy(act_num, 0) <= y2 {
								re = SMART_HSWIPE_RE_1
							}
						}
					}
				}
				if re == SMART_HSWIPE_RE_0 : return SMART_HSWIPE_RE_0
	
				re = SMART_HSWIPE_RE_0
				if moux(act_num, 1) >= x1 {
					if moux(act_num, 1) <= x2 {
						if mouy(act_num, 1) >= y1 {
							if mouy(act_num, 1) <= y2 {
								re = SMART_HSWIPE_RE_1
							}
						}
					}
				}
				if re == SMART_HSWIPE_RE_0 : return SMART_HSWIPE_RE_0

				move_way	= 0
				move_moment	= 0
				move_moment	= moux(act_num, 0) - moux(act_num, 1)
				abs_moment	= abs(move_moment)

				dim x_point, POINT_SPLIT
				
				x_point(0)	= x1 + (abs(x1 - x2) / 10)
				repeat POINT_SPLIT
					x_point(cnt + 1) = x_point(cnt) + (abs(x1 - x2) / 10)
				loop

				re = SMART_HSWIPE_RE_0
				if abs_moment >= min_movement {
					if abs_moment <= max_movement {
						re = SMART_HSWIPE_RE_1
					}
				}
				if re == SMART_HSWIPE_RE_0 : return SMART_HSWIPE_RE_0
				
				if move_moment == 0 : return SMART_HSWIPE_RE_0
				if move_moment < 0  : move_way = 1	;������E
				if move_moment > 0  : move_way = 2	;�E���獶

				if abs_moment >= x1 {
					if abs_moment <= x_point(0) {
						if move_way == 1 : return SMART_HSWIPE_RE_A2	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B2	;�E���獶
					}
				}
				if abs_moment > x_point(0) {
					if abs_moment <= x_point(1) {
						if move_way == 1 : return SMART_HSWIPE_RE_A3	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B3	;�E���獶
					}
				}
				if abs_moment > x_point(1) {
					if abs_moment <= x_point(2) {
						if move_way == 1 : return SMART_HSWIPE_RE_A4	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B4	;�E���獶
					}
				}
				if abs_moment > x_point(2) {
					if abs_moment <= x_point(3) {
						if move_way == 1 : return SMART_HSWIPE_RE_A5	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B5	;�E���獶
					}
				}
				if abs_moment > x_point(3) {
					if abs_moment <= x_point(4) {
						if move_way == 1 : return SMART_HSWIPE_RE_A6	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B6	;�E���獶
					}
				}
				if abs_moment > x_point(4) {
					if abs_moment <= x_point(5) {
						if move_way == 1 : return SMART_HSWIPE_RE_A7	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B7	;�E���獶
					}
				}
				if abs_moment > x_point(5) {
					if abs_moment <= x_point(6) {
						if move_way == 1 : return SMART_HSWIPE_RE_A8	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B8	;�E���獶
					}
				}
				if abs_moment > x_point(6) {
					if abs_moment <= x_point(7) {
						if move_way == 1 : return SMART_HSWIPE_RE_A9	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B9	;�E���獶
					}
				}
				if abs_moment > x_point(7) {
					if abs_moment <= x_point(8) {
						if move_way == 1 : return SMART_HSWIPE_RE_A10	;������E
						if move_way == 2 : return SMART_HSWIPE_RE_B10	;�E���獶
					}
				}
				if abs_moment > x_point(8) {
					if abs_moment <= x2 {
						if move_way == 1 : return SMART_HSWIPE_RE_A11	;�ォ�牺
						if move_way == 2 : return SMART_HSWIPE_RE_B11	;�������
					}
				}

			}
		}
	}
	
	tv(act_num, 0)			= 0
	tv(act_num, 1)			= 0
	tv(act_num, 2)			= 0
	tv(act_num, 3)			= 0
	cp(act_num, PARAM_1)	= CP_MODE_0

	return SMART_HSWIPE_RE_0


;-----------------------------------------------------
; smart_one
;
; �^�b�v���ꂽ(��ʂ�������)�u�Ԃ���x�����擾�B(���������Ƃ��͊܂܂ꂸ)
;
; act_num           ; �A�N�V�������擾����A�N�V�����ԍ��W
; x1, y1, x2, y2    : �^�b�v��F�������ʍ��W
;
; �߂�l
;    0 = �^�b�v����Ă��Ȃ�(�������͉����������Ă���)
;    1 = �^�b�v(��ʂ�������)�����ꂽ
;
;=====================================================
; SAMPLE
;
;   smart_add : act = stat
;
;*main
;
;	if smart_one(act, 0, 0, 639, 479) = 1 {
;		c++
;		mes "MOUSE LEFT BUTTON ONLY ONE = " + c
;	}
;	wait 1
;	goto *main
;
;-----------------------------------------------------
#defcfunc _smart_one int act_num, int x1, int y1, int x2, int y2, int push_key

	one_key					= 0
	re						= SMART_ONE_RE_0
	cp(act_num, PARAM_1)	= FALSE
	moux(act_num, 0)		= 0
	mouy(act_num, 0)		= 0
	touch_id				= 0
	push_key_flg			= FALSE

	if push_key > 0 && push_key_get_use_flg {
		func_dgetkey@mod_smart one_key, push_key, SMART_GETKEY_REPEAT_MODE_0
		if one_key > 0 : push_key_flg = TRUE
	}
	if push_key_flg == FALSE {
		mtlist touch_id : one_key = stat
	}

	if one_key == 0 {
		cp(act_num, PARAM_2) = FALSE
		return SMART_ONE_RE_0
	}

	if one_key > 0 {
		if push_key_flg {
			re = SMART_ONE_RE_1
		} else {
			dim touch, one_key
			repeat one_key
				mtinfo touch, touch_id(cnt)
				moux(act_num, 0) = touch(1)
				mouy(act_num, 0) = touch(2)
				if moux(act_num, 0) >= x1 {
					if moux(act_num, 0) <= x2 {
						if mouy(act_num, 0) >= y1 {
							if mouy(act_num, 0) <= y2 {
								if cp(act_num, PARAM_2) == FALSE : re = SMART_ONE_RE_1
								cp(act_num, PARAM_2) = TRUE
								cp(act_num, PARAM_1) = TRUE
								break
							}
						}
					}
				}
			loop
	
			if cp(act_num, PARAM_1) == FALSE {
				cp(act_num, PARAM_2) = FALSE
				re = SMART_ONE_RE_0
			}
		}
	}

	return re


;-----------------------------------------------------
; smart_pinch
;
; �s���`�A�E�g/�C�����擾
;
; act_num           ; �A�N�V�������擾����A�N�V�����ԍ��W
; x1, y1, x2, y2    : �s���`�A�E�g/�C����F�������ʍ��W
;
; �߂�l
;    -1(�ȉ�) = �s���`�C������Ă���
;    0        = �X�N���[�����}���`�^�b�`����Ă��Ȃ�
;    1(�ȏ�)  = �s���`�A�E�g����Ă���
;
;=====================================================
; SAMPLE
;
;   smart_add : act_num = stat
;
;*main
;
;   redraw 0
;
;   i = smart_pinch(act_num, 0, 0, 479, 319)
;   pos 0, 0
;   if i = 0   : mes "NOT MULTI TOUCH"
;   if i >= 1  : mes "PINCH OUT"
;   if i <= -1 : mes "PINCH IN"
;
;   redraw 1
;	wait 1
;
;	goto *main
;
;-----------------------------------------------------
#defcfunc _smart_pinch int act_num, int x1, int y1, int x2, int y2

	re	= 0
	i	= 0
	dim touch_id, 1 : mtlist touch_id : tap_key = stat

	if tap_key > 1 {

		i = cp(act_num, PARAM_1)

		dim touch, tap_key
		repeat tap_key
			mtinfo touch, touch_id(cnt)

			if touch(1) >= x1 {
				if touch(1) <= x2 {
					if touch(2) >= y1 {
						if touch(2) <= y2 {
							c =  cp(act_num, PARAM_1) * 2
							switch cp(act_num, PARAM_2)
							case CP_MODE_0
								moux(act_num, 0 + c) = touch(1)
								mouy(act_num, 0 + c) = touch(2)
								cp(act_num, PARAM_2) = CP_MODE_1
								swbreak
							case CP_MODE_1
								moux(act_num, 1 + c) = touch(1)
								mouy(act_num, 1 + c) = touch(2)
								cp(act_num, PARAM_2) = CP_MODE_2
								swbreak
							swend
							if cp(act_num, PARAM_2) == CP_MODE_2 : break
						}
					}
				}
			}


		loop

		if cp(act_num, PARAM_2) == CP_MODE_2 {

			cp(act_num, PARAM_2) = CP_MODE_0

			if i == CP_MODE_0 {
				first_point_x			= abs(moux(act_num, 0) - moux(act_num, 1))
				first_point_y			= abs(mouy(act_num, 0) - mouy(act_num, 1))
				first_distance			= (first_point_x * first_point_x) + (first_point_y * first_point_y)
				cp(act_num, PARAM_3)	= int(sqrt(first_distance))
				cp(act_num, PARAM_1)	= CP_MODE_1
				return 0
			}
			
			if i == CP_MODE_1 {
				touch_point_x			= abs(moux(act_num, 2) - moux(act_num, 3))
				touch_point_y			= abs(mouy(act_num, 2) - mouy(act_num, 3))
				touch_distance			= (touch_point_x * touch_point_x) + (touch_point_y * touch_point_y)
				cp(act_num, PARAM_4)	= int(sqrt(touch_distance))
				re						= cp(act_num, PARAM_4) - cp(act_num, PARAM_3)
				return re
			}

		}
	}

	cp(act_num, PARAM_1) = CP_MODE_0
	cp(act_num, PARAM_2) = CP_MODE_0

	return 0


;-----------------------------------------------------
; smart_mtouch
;
; �w��̗̈�����^�b�`(�����Ō����^�b�`�Ƃ͉�ʂɐG��Ă���)���Ă��邩���擾
; �}���`�^�b�`�ɑΉ�
;
; x1 : ����X���W
; y1 : ����Y���W
; x2 : �E��X���W
; y2 : �E��Y���W
;
; �߂�l(0 = �w��̗̈�����^�b�`���Ă��Ȃ�)
;       (1 = �w��̗̈�����^�b�`���Ă���)
;
;=====================================================
; SAMPLE
;
;	if smart_mtouch(0, 0, 100, 200) = 1 : dialog "OK"
;
;-----------------------------------------------------
#defcfunc _smart_mtouch int x1, int y1, int x2, int y2, int push_key

	tap_key			= 0
	re				= SMART_MTOUCH_RE_0
	mx				= 0
	my				= 0
	touch_id		= 0
	push_key_flg	= FALSE

	if push_key > 0 && push_key_get_use_flg {
		func_dgetkey@mod_smart tap_key, push_key, SMART_GETKEY_REPEAT_MODE_1
		if tap_key > 0 : push_key_flg = TRUE
	}
	if push_key_flg == FALSE {
		mtlist touch_id : tap_key = stat
	}

	if tap_key > 0 {
		if push_key_flg {
			re = SMART_MTOUCH_RE_1
		} else {
			dim touch, tap_key
			repeat tap_key
				mtinfo touch, touch_id(cnt)
				mx = touch(1)
				my = touch(2)
				if mx >= x1 {
					if mx <= x2 {
						if my >= y1 {
							if my <= y2 {
								re = SMART_MTOUCH_RE_1
								break
							}
						}
					}
				}
			loop
		}
	}

	return re


;-----------------------------------------------------
; smart_keep
;
; �^�b�`���Ă���XY���W������(�p�����[�^�[)�ɑ���
;
; act_num           ; �A�N�V�������擾����A�N�V�����ԍ��W
; x1, y1, x2, y2    : �^�b�v��F�������ʍ��W
; tmx               : �^�b�`���Ă���X���W��ێ�����X���W�̐��l�ϐ�
; tmy               : �^�b�`���Ă���Y���W��ێ�����Y���W�̐��l�ϐ�
;
; ���ߏI����A�V�X�e���ϐ�(stat)�Ƀ}���`�^�b�`���ꂽ�l������܂��B
;
;=====================================================
; SAMPLE
;	
;#cmpopt varinit 1			;���������ϐ��̃`�F�b�N
;
;#include "hsp3dish.as"		;HSP3Dish
;#include "mod_smart.as"		;�����W���[��
;
;#const WINDOW_WIDTH		480
;#const WINDOW_HEIGHT	320
;
;	smart_init	;[mod_smart.as]���W���[���̏�������
;	smart_add
;	smart_add
;
;	mes_cnt = 2
;
;	dim x, mes_cnt
;	dim y, mes_cnt
;	x(0) = 100 : y(0) = 100
;	x(1) = 200 : y(1) = 100
;
;	dim x1, 2
;	dim y1, 2
;	dim x2, 2
;	dim y2, 2
;	x1(0) = 100 : y1(0) = 100 : x2(0) = 200 : y2(0) = 200
;	x1(1) = 250 : y1(1) = 100 : x2(1) = 350 : y2(1) = 200
;
;*main
;
;	redraw 0
;	color 0, 0, 150 : boxf
;	color 0, 0, 255 : boxf x1(0), y1(0), x2(0), y2(0)
;	color 0, 0, 255 : boxf x1(1), y1(1), x2(1), y2(1)
;	color 255, 255, 255
;
;	repeat mes_cnt
;		smart_keep cnt, x1(cnt), y1(cnt), x2(cnt), y2(cnt), x(cnt), y(cnt)
;	loop
;
;	mt_cnt = stat
;	
;	pos 0, 0
;	mes str(mt_cnt)
;	
;	repeat mes_cnt
;		if x(cnt) < 0 : x(cnt) = 0
;		if x(cnt) > (WINDOW_WIDTH - 20)  : x(cnt) = WINDOW_WIDTH - 20
;		if y(cnt) < 0 : y(cnt) = 0
;		if y(cnt) > (WINDOW_HEIGHT - 20) : y(cnt) = WINDOW_HEIGHT - 20
;		pos x(cnt), y(cnt)
;		mes str(cnt + 1)
;	loop
;	
;	redraw 1
;	wait 1
;	goto *main
;
;-----------------------------------------------------
#deffunc _smart_keep int act_num, int x1, int y1, int x2, int y2, var tmx, var tmy

	touch_id = 0

	mtlist touch_id : tap_key = stat

	if tap_key > 0 {

		dim touch, tap_key

		repeat tap_key
			tid = touch_id(cnt)
			mtinfo touch, tid
			
			tap_x = touch(1)
			tap_y = touch(2)

			cp(act_num, PARAM_1) = FALSE

			if tap_x >= x1 {
				if tap_x <= x2 {
					if tap_y >= y1 {
						if tap_y <= y2 {
							cp(act_num, PARAM_1) = TRUE
						}
					}
				}
			}

			if cp(act_num, PARAM_1) == TRUE {
				switch cp(act_num, PARAM_2)
				case FALSE
					cp(act_num, PARAM_2)	= TRUE
					moux(act_num, 0)		= 0
					mouy(act_num, 0)		= 0
					swbreak
				case TRUE
					tmx += tap_x - moux(act_num, 0)
					tmy += tap_y - mouy(act_num, 0)
					swbreak
				swend
				moux(act_num, 0) = tap_x
				mouy(act_num, 0) = tap_y
				break
			} else {
				if cnt == (tap_key - 1) : cp(act_num, PARAM_2) = FALSE
			}
		loop
	} else {
		cp(act_num, PARAM_2) = FALSE
	}

	return tap_key


;-----------------------------------------------------
; smart_analog
;
; ���z�A�i���O�X�e�B�b�N����𐧌�
;
; act_num						: �A�N�V�������擾����A�N�V�����ԍ�
; result_value					: �擾��������^�z��ϐ�
; circle_x, circle_y, x2, y2	: �~�̒��S�_�ƂȂ��ʍ��W
; circle_half_width				: ���S�_����̔��a
;
; ���ߏI����Asmart_analog_res�ɑ��삳�ꂽ�l������܂��B
;
;=====================================================
;
;-----------------------------------------------------
#deffunc _smart_analog int act_num, array result_value, int circle_x, int circle_y, int circle_half_width

	result_circle_x = circle_x
	result_circle_y = circle_y

	touch_id = 0 : mtlist touch_id : tap_key = stat

	if tap_key > 0 {
		repeat_break = FALSE
		dim touch, tap_key
		repeat tap_key
			mtinfo touch, touch_id(cnt)
			func_circle_point_check@mod_smart act_num, circle_x, circle_y, circle_half_width, touch(1), touch(2), touch(3) + 10, repeat_break
			if repeat_break == TRUE : break
		loop
		;2015/10/14.add.
		if repeat_break == FALSE : cp(act_num, PARAM_4) = -1
	} else {
		cp(act_num, PARAM_1)	= SMART_ANALOG_RE_0
		moux(act_num, 0)		= circle_x
		mouy(act_num, 0)		= circle_y
		touch_distance_in		= 0
		moux(act_num, 1)		= circle_x
		mouy(act_num, 1)		= circle_y
		touch_distance_all		= 0
		cp(act_num, PARAM_2)	= 0
		cp(act_num, PARAM_3)	= 0
		cp(act_num, PARAM_4)	= 0
	}

	func_analog_res@mod_smart act_num, result_value

	return


;-----------------------------------------------------
#deffunc local func_circle_point_check int act_num, int circle_x, int circle_y, int circle_half_width, int point_x, int point_y, int id, var rep_break
; cp(act_num, PARAM_1) = �^�b�`�t���O(0:�^�b�`���ĂȂ�, 1:�̈���Ń^�b�`)
; cp(act_num, PARAM_2) = �p�x(360)
; cp(act_num, PARAM_3) = ���W�A��
; cp(act_num, PARAM_4) = �}���`�^�b�`�̎���ID

	rep_break	= FALSE
	xy			= (circle_x - point_x) * (circle_x - point_x)
	xy		   += (circle_y - point_y) * (circle_y - point_y)
	half		= circle_half_width * circle_half_width
	rad			= atan(point_y - circle_y, point_x - circle_x)

	if xy < half {
		cp(act_num, PARAM_1)	= SMART_ANALOG_RE_1
		cp(act_num, PARAM_4)	= id
		moux(act_num, 0)		= point_x
		mouy(act_num, 0)		= point_y
		moux(act_num, 1)		= point_x
		mouy(act_num, 1)		= point_y
	} else {
		if cp(act_num, PARAM_4) == id {
			cp(act_num, PARAM_1)	= SMART_ANALOG_RE_1
			cp(act_num, PARAM_4)	= id
			moux(act_num, 0)		= circle_x + (cos(rad) * circle_half_width)
			mouy(act_num, 0)		= circle_y + (sin(rad) * circle_half_width)
			moux(act_num, 1)		= point_x
			mouy(act_num, 1)		= point_y
		}
	}

	if (cp(act_num, PARAM_1) == SMART_ANALOG_RE_1) && (cp(act_num, PARAM_4)	== id) {
		rep_break				= TRUE
		if rad < 0.0 : rad += M_PI * 2
		deg						= int(rad * 180 / M_PI)
		cp(act_num, PARAM_2)	= deg
		cp(act_num, PARAM_3)	= int(RAD_DOUBLE * rad)

		touch_point_x			= abs(circle_x - point_x)
		touch_point_y			= abs(circle_y - point_y)
		touch_distance_all		= (touch_point_x * touch_point_x) + (touch_point_y * touch_point_y)
		touch_distance_all		= int(sqrt(touch_distance_all))

		touch_point_x			= abs(circle_x - moux(act_num, 0))
		touch_point_y			= abs(circle_y - mouy(act_num, 0))
		touch_distance_in		= (touch_point_x * touch_point_x) + (touch_point_y * touch_point_y)
		touch_distance_in		= int(sqrt(touch_distance_in))
	}

	return


;-----------------------------------------------------
#deffunc local func_analog_res int act_num, array result_value

	dim result_value, 9

	touch_id = 0 : mtlist touch_id : tap_key = stat

	touch_flg = FALSE

	if tap_key > 0 {
		dim touch, tap_key
		repeat tap_key
			mtinfo touch, touch_id(cnt)
			if cp(act_num, PARAM_4) == (touch(3) + 10) {
				touch_flg = TRUE
				break
			}
		loop
	}

	if touch_flg == FALSE {
		cp(act_num, PARAM_1)	= SMART_ANALOG_RE_0
		moux(act_num, 0)		= result_circle_x
		mouy(act_num, 0)		= result_circle_y
		touch_distance_in		= 0
		moux(act_num, 1)		= result_circle_x
		mouy(act_num, 1)		= result_circle_y
		touch_distance_all		= 0
		cp(act_num, PARAM_2)	= 0
		cp(act_num, PARAM_3)	= 0
	}

	result_value(0) = cp(act_num, PARAM_1)	; �^�b�`���t���O(0:���^�b�`, 1:�^�b�`��)
	result_value(1) = moux(act_num, 0)		; X���W(�̈���̂�)
	result_value(2) = mouy(act_num, 0)		; Y���W(�̈���̂�)
	result_value(3) = touch_distance_in		; ���S�_���W����h�b�g����(�̈���̂�)
	result_value(4) = moux(act_num, 1)		; X���W(�̈�O���܂�)
	result_value(5) = mouy(act_num, 1)		; Y���W(�̈�O���܂�)
	result_value(6) = touch_distance_all	; ���S�_���W����h�b�g����(�̈�O���܂�)
	result_value(7) = cp(act_num, PARAM_2)	; �p�x(360)
	result_value(8) = cp(act_num, PARAM_3)	; ���W�A��

	return


;-----------------------------------------------------
; smart_reset
;
; �A�N�V���������Z�b�g
;
; act_num						: �A�N�V���������Z�b�g����A�N�V�����ԍ�
;
;=====================================================
;
;-----------------------------------------------------
#deffunc _smart_reset int act_num

	repeat 4
		tv(act_num, cnt) = 0
		cp(act_num, cnt) = 0
	loop

	return


;-----------------------------------------------------
#deffunc local func_dgetkey var re_v, int keycode, int repeat_flg

	re_v	= SMART_TAP_RE_0
	key		= FALSE

	getkey key, keycode

	switch repeat_flg
	case SMART_GETKEY_REPEAT_MODE_0
		re_v = (key != dkey(keycode)) && (key != FALSE)
		swbreak
	case SMART_GETKEY_REPEAT_MODE_1
		if key == TRUE {
			re_v = SMART_TAP_RE_1
		}
		swbreak
	case SMART_GETKEY_REPEAT_MODE_2
		if dkey(keycode) == FALSE {
			if key == TRUE {
				re_v = SMART_TAP_RE_1
			}
		} else {
			if dkey(keycode) == TRUE {
				if key == FALSE {
					re_v = SMART_TAP_RE_2
				} else {
					if key == TRUE {
						re_v = SMART_TAP_RE_1
					}
				}
			}
		}
		swbreak
	swend

	dkey(keycode) = key

	return


#global

;-----------------------------------------------------
#endif
