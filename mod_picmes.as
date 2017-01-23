;-----------------------------------------------------
;
; HSP3�p�摜�������W���[���umod_picmes.as�v
;
; Ver 4.1 (�����ӁFVer 2.0�ȍ~����uhsp3dish.as�v���K�{�ƂȂ�܂����B���O�Ɂuhsp3dish.as�v���C���N���[�h���Ă�������)
;
; By. ���܂���˂�
;
; http://www.geocities.jp/simakuroneko646/
;
; simakuroneko@gmail.com
;
;-----------------------------------------------------
#ifndef __MOD_PICMES__
#define __MOD_PICMES__


;-----------------------------------------------------
#module mod_picmes

#const	FONT_CODE_MAX		65535
#define	FONT_PNG_FILE		"mod_picmes.png"
#define	FONT_INI_FILE		"mod_picmes.ini"
#const	INI_STR_SIZE		16
#const	FALSE				0
#const	TRUE				1

#define global picmes_init(%1 = 0) _picmes_init %1
#define global picmes_mode(%1 = pic_font_width@mod_picmes, %2 = pic_font_height@mod_picmes, %3 = 255, %4 = 0, %5 = 0) _picmes_mode %1, %2, %3, %4, %5
#define global picmes(%1 = "", %2 = FALSE@mod_picmes) _picmes %1, %2
#define global picmesm(%1 = "", %2 = TRUE@mod_picmes) _picmes %1, %2
#define global ctype picmes_info(%1 = 0) _picmes_info (%1)


;-----------------------------------------------------
; picmes_init
;
; ���W���[���̏�������
;
;
; load_window_id : �摜�����t�@�C��"mod_picmes.png"��ǂݍ��܂���E�B���h�EID
;                  (���ȗ�������[0]���w�肷��ƁA�����I�ɋ󂢂Ă���E�B���h�EID�ɓǂݍ��܂�܂�)
;                  (���̏ꍇ�A���ߏI����A�V�X�e���ϐ�(stat)�ɃE�B���h�EID������܂�)
;
;-----------------------------------------------------
#deffunc _picmes_init int load_window_id

	waring_flg		= FALSE
	png_waring_mes	= ""
	ini_waring_mes	= ""

	plat_form = PLATFORM_WINDOWS
	getreq plat_form, SYSREQ_PLATFORM

	switch plat_form
	case PLATFORM_WINDOWS
		exist FONT_PNG_FILE
		if strsize == -1 {
			waring_flg			= TRUE
			png_waring_mes(0)	= FONT_PNG_FILE + " ��DPM�t�@�C���Ɋ܂܂�Ă��Ȃ����A"
			png_waring_mes(1)	= "�J�����g�t�H���_���ɓ����Ă��܂���B"
			png_waring_mes(2)	= ""
			png_waring_mes(3)	= ""
		}

		exist FONT_INI_FILE
		if strsize == -1 {
			waring_flg			= TRUE
			ini_waring_mes(0)	= FONT_INI_FILE + " ��DPM�t�@�C���Ɋ܂܂�Ă��Ȃ����A"
			ini_waring_mes(1)	= "�J�����g�t�H���_���ɓ����Ă��܂���B"
			ini_waring_mes(2)	= ""
			ini_waring_mes(3)	= ""
		}
		swbreak
	case PLATFORM_IOS
	case PLATFORM_ANDROID
		exist FONT_PNG_FILE
		if strsize == -1 {
			waring_flg			= TRUE
			png_waring_mes(0)	= FONT_PNG_FILE + " ��DPM�t�@�C���Ɋ܂܂�Ă��Ȃ����A"
			png_waring_mes(1)	= "�v���W�F�N�g�t�H���_����[assets]�t�H���_�ɓ����Ă��܂���B"
			png_waring_mes(2)	= "DPM�t�@�C���Ɋ܂܂��Ă����̃��b�Z�[�W���\�������ꍇ�́A
			png_waring_mes(3)	= "�v���W�F�N�g�t�H���_����[assets]�t�H���_�ɓ���Ă��������B"
		}

		exist FONT_INI_FILE
		if strsize == -1 {
			waring_flg			= TRUE
			ini_waring_mes(0)	= FONT_INI_FILE + " ��DPM�t�@�C���Ɋ܂܂�Ă��Ȃ����A"
			ini_waring_mes(1)	= "�v���W�F�N�g�t�H���_����[assets]�t�H���_�ɓ����Ă��܂���B"
			ini_waring_mes(2)	= "DPM�t�@�C���Ɋ܂܂��Ă����̃��b�Z�[�W���\�������ꍇ�́A
			ini_waring_mes(3)	= "�v���W�F�N�g�t�H���_����[assets]�t�H���_�ɓ���Ă��������B"
		}
		swbreak
	swend

	if waring_flg == TRUE {
		key = 0
		font "", 10
		repeat
			redraw 0
			color 0, 0, 0
			boxf
			color 255, 255, 255
			pos 0, 0	: mes png_waring_mes(0) : mes png_waring_mes(1) : mes png_waring_mes(2) : mes png_waring_mes(3)
			pos 0, 128	: mes ini_waring_mes(0) : mes ini_waring_mes(1) : mes ini_waring_mes(2) : mes ini_waring_mes(3)
			pos 0, 256	: mes "�^�b�v����ƃv���O�������I�����܂��B"
			redraw 1
			stick key
			if key && 256 : end
			await 16
		loop
	}

	if load_window_id == 0 {
		celload FONT_PNG_FILE, -1, 0
		window_id = stat
	} else {
		celload FONT_PNG_FILE, load_window_id, 0
		window_id = load_window_id
	}

	exist FONT_INI_FILE

	sdim str_ini_buff, INI_STR_SIZE

	bload FONT_INI_FILE, str_ini_buff, INI_STR_SIZE

	pic_window_width	= int(strmid(str_ini_buff, 0, 5))
	pic_window_height	= int(strmid(str_ini_buff, 5, 5))
	pic_font_width		= double(strmid(str_ini_buff,10, 3))
	pic_font_height		= double(strmid(str_ini_buff,13, 3))

	in_zoom_x			= pic_font_width
	in_zoom_y			= pic_font_height
	in_blend			= 0
	in_chara_space		= 0
	in_degrees			= 0

	dim f_cd, FONT_CODE_MAX

	len_f_cd			= length(f_cd) * 4
	offset_size			= 0

	switch plat_form
	case PLATFORM_WINDOWS	: offset_size = 0				: swbreak
	case PLATFORM_IOS
	case PLATFORM_ANDROID	: offset_size = len_f_cd + 4	: swbreak
	swend

	bload FONT_INI_FILE, f_cd, len_f_cd, offset_size

	celdiv window_id, pic_font_width, pic_font_height, pic_font_width / 2, pic_font_height / 2

	return window_id


;-----------------------------------------------------
; picmes_mode
;
; picmes���߂ŕ\�����镶���̃��[�h�ł�
;
;
; zoom_x       : �\�����镶���̉��h�b�g��(�Y�[��)
; zoom_y       : �\�����镶���̏c�h�b�g��(�Y�[��)
; blend        : �������̃u�����h��(0�`255)
; chara_space  : �����ƕ����̊Ԋu(�h�b�g)
;
;
;=====================================================
; SAMPLE
;
;	picmes_mode 16, 16, 123, 0
;	pos 100,200 : picmes "����������"
;
;-----------------------------------------------------
#deffunc _picmes_mode double zoom_x, double zoom_y, int blend, int chara_space, int degrees

	in_zoom_x		= zoom_x
	in_zoom_y		= zoom_y
	in_blend		= blend
	in_chara_space	= chara_space
	in_degrees		= degrees

	return


;-----------------------------------------------------
; picmes
;
; �摜������\�����܂�
;
;
; buff         : �\������ϐ�
;
;
;=====================================================
; SAMPLE
;
;   moji = "aiueo" : pos 100,200 : picmes moji
;
;-----------------------------------------------------
#deffunc _picmes str buff, int picmesm_mode

	sdim cut_buff, 4
	dim cut_byte,  3

	pos_x		= ginfo(22)
	pos_y		= ginfo(23)
	cut_buff	= ""
	in_buff		= buff
	s_len		= strlen(in_buff)
	c_index		= 0
	put_x		= 0
	put_y		= 0
	put_cnt		= 0
	put_cnt_x	= 0
	put_cnt_y	= 0
	zoom_px		= 0.0
	zoom_py		= 0.0
	spp			= 0
	put_last_x	= 0
	put_last_y	= 0
	real_space	= 0

	if picmesm_mode == TRUE {
		puts_count = 0
		dim puts_x, 1
		dim puts_y, 1
		dim puts_index, 1
		dim d_puts_x, 1
		dim d_puts_y, 1
		dim d_puts_index, 1
	}

	if in_blend > 255 : in_blend = 0
	if in_blend == 0 {
		gmode 2, pic_font_width, pic_font_height
	} else {
		gmode 4, pic_font_width, pic_font_height, in_blend
	}

	if in_zoom_x > pic_font_width  : zoom_px = in_zoom_x / 2 / 2
	if in_zoom_y > pic_font_height : zoom_py = in_zoom_y / 2 / 2

	dbl_x = in_zoom_x / pic_font_width
	dbl_y = in_zoom_y / pic_font_height

	repeat s_len

		if c_index >= s_len : break

		cut_buff = strmid(in_buff, c_index, 2)
		if cut_buff == "\n" {
			put_cnt		= 0
			put_cnt_x	= 0
			put_cnt_y	+= in_zoom_y
			put_last_x	= pos_x
			put_last_y	= pos_y + put_cnt_y
			c_index		+= 2
			continue
		}

		cd_point	= 0
		c_cd		= peek(in_buff, c_index)

		switch plat_form
		case PLATFORM_WINDOWS

			if c_cd <= 127 {
				c_byte = 1
			} else {
				if c_cd >= 253 {
					c_byte = 1
				} else {
					if c_cd >= 224 {
						if c_cd <= 252 : c_byte = 2
					} else {
						if c_cd >= 161 {
							if c_cd <= 223 : c_byte = 1
						} else {
							if c_cd >= 129 : c_byte = 2
						}
					}
				}
			}

			cut_buff = strmid(in_buff, c_index, c_byte)

			repeat c_byte
				cut_byte(cnt) = peek(cut_buff, cnt)
			loop

			switch c_byte
			case 1
				get_hex	= strf("%x", cut_byte(0))
				spp		= 2
				swbreak
			case 2
				get_hex	= strf("%x%x", cut_byte(0), cut_byte(1))
				spp		= 1
				swbreak
			swend

			cd_point = int("$" + get_hex)

			swbreak

		case PLATFORM_IOS
		case PLATFORM_ANDROID

			if c_cd <= 127 {
				c_byte = 1
			} else {
				if c_cd >= 224 {
					if c_cd <= 239 : c_byte = 3
				} else {
					if c_cd >= 192 {
						if c_cd <= 223 : c_byte = 2
					}
				}
			}

			cut_buff = strmid(in_buff, c_index, c_byte)
			repeat c_byte
				cut_byte(cnt) = peek(cut_buff, cnt)
			loop

			switch c_byte
			case 1
				cd_point	= cut_byte(0)
				spp			= 2
				swbreak
			case 2
				cd_point	+= (cut_byte(0) \ 64) * 64
				cd_point	+= cut_byte(1) \ 64
				spp			= 1
				swbreak
			case 3
				cd_point	+= (cut_byte(0) \ 16) * 4096
				cd_point	+= (cut_byte(1) \ 64) * 64
				cd_point	+= cut_byte(2) \ 64
				spp			= 1
				swbreak
			swend
			swbreak
		swend

		xy_index	= f_cd(cd_point)
		get_x		= (xy_index * pic_font_width) \ pic_window_width
		get_y		= int((xy_index / (pic_window_width / pic_font_width))) * pic_font_height
		real_space	= in_chara_space * put_cnt
		put_x		= pos_x + put_cnt_x + (in_zoom_x / 2) + real_space
		put_y		= pos_y + put_cnt_y + (in_zoom_y / 2)
		put_last_y	= put_y - (in_zoom_y / 2)
		put_cnt		+= 2
		put_cnt_x	+= in_zoom_x / spp
		c_index		+= c_byte

		pos put_x, put_y

		if picmesm_mode == TRUE {

			n1							= puts_count + 1
			d_puts_x(puts_count)		= put_x
			d_puts_y(puts_count)		= put_y
			d_puts_index(puts_count)	= xy_index
			dim puts_x, n1
			dim puts_y, n1
			dim puts_index, n1

			memcpy puts_x, d_puts_x, 4 * n1
			memcpy puts_y, d_puts_y, 4 * n1
			memcpy puts_index, d_puts_index, 4 * n1

			puts_count++
			n2							= puts_count + 1

			dim d_puts_x, n2
			dim d_puts_y, n2
			dim d_puts_index, n2

			memcpy d_puts_x, puts_x, 4 * n1
			memcpy d_puts_y, puts_y, 4 * n1
			memcpy d_puts_index, puts_index, 4 * n1

		} else {

			celput window_id, xy_index, dbl_x, dbl_y, deg2rad(in_degrees)

		}

	loop

	if picmesm_mode == TRUE {
		celputm puts_x, puts_y, puts_index, window_id, puts_count
	}

	put_cnt_y	+= in_zoom_y / 2
	put_y		= pos_y + put_cnt_y + (in_zoom_y / 2)

	pos 0, put_y

	real_space	= in_chara_space * put_cnt
	put_last_x	= pos_x + put_cnt_x + real_space

	return


;-----------------------------------------------------
; picmes_info
;
; �t�H���g���擾
;
;
; info_mode    : �擾������
;                   0 = �摜�����t�@�C��"mod_picmes.png"��ǂݍ��񂾃E�B���h�EID
;                   1 = �摜�����t�@�C��"mod_picmes.png"���̂̉��T�C�Y�B("mod_picmes.ini"��1�o�C�g�ڂ���5�o�C�g�ڂ̐����l���Ԃ�܂�)
;                   2 = �摜�����t�@�C��"mod_picmes.png"���̂̏c�T�C�Y�B("mod_picmes.ini"��6�o�C�g�ڂ���10�o�C�g�ڂ̐����l���Ԃ�܂�)
;                   3 = �摜�����t�@�C��1�����̉��T�C�Y�B("mod_picmes.ini"��11�o�C�g�ڂ���13�o�C�g�ڂ�[-1]���ꂽ�����l���Ԃ�܂�)
;                   4 = �摜�����t�@�C��1�����̏c�T�C�Y�B("mod_picmes.ini"��14�o�C�g�ڂ���16�o�C�g�ڂ̎����l���Ԃ�܂�);
;                  10 = �Ō�ɕ\�����ꂽ������1�����E����X���W
;                  11 = �Ō�ɕ\�����ꂽ������Y���W
;
;-----------------------------------------------------
#defcfunc _picmes_info int info_mode

	re_val = 0

	switch info_mode
	case 0	: re_val = window_id			: swbreak
	case 1	: re_val = pic_window_width		: swbreak
	case 2	: re_val = pic_window_height	: swbreak
	case 3	: re_val = pic_font_width		: swbreak
	case 4	: re_val = pic_font_height		: swbreak
	case 10	: re_val = put_last_x			: swbreak
	case 11	: re_val = put_last_y			: swbreak
	swend

	return re_val


#global

;-----------------------------------------------------
#endif
