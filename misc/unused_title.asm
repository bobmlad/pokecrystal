
SECTION "bank43", ROMX, BANK[$43]

UnusedTitleScreen: ; 10c000

	call WhiteBGMap
	call ClearTileMap
	call DisableLCD
	xor a
	ld [hBGMapMode], a

	ld hl, wcf63
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld hl, UnusedTitleBG_GFX
	ld de, VTiles2
	ld bc, $800
	call CopyBytes

	ld hl, UnusedTitleBG_GFX + $800
	ld de, VTiles1
	ld bc, $800
	call CopyBytes

	ld hl, UnusedTitleFG_GFX
	ld de, VTiles0
	ld bc, $800
	call CopyBytes

	ld hl, UnusedTitleBG_Tilemap
	ld de, VBGMap0
	ld bc, 32 * 32
.copy
	ld a, 0
	ld [rVBK], a
	ld a, [hli]
	ld [de], a
	ld a, 1
	ld [rVBK], a
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy

	ld hl, UnusedTitleFG_OAM
	ld de, Sprites
	ld bc, $a0
	call CopyBytes

	call EnableLCD
	ld a, [rLCDC]
	set 1, a
	set 2, a
	ld [rLCDC], a

	call DelayFrame

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, UnsuedTitleBG_Palettes
	ld de, Unkn1Pals
	ld bc, $40
	call CopyBytes

	ld hl, UnsuedTitleFG_Palettes
	ld de, Unkn2Pals
	ld bc, $40
	call CopyBytes

	ld hl, UnsuedTitleBG_Palettes
	ld de, BGPals
	ld bc, $40
	call CopyBytes

	ld hl, UnsuedTitleFG_Palettes
	ld de, OBPals
	ld bc, $40
	call CopyBytes

	pop af
	ld [rSVBK], a

	ld a, $1
	ld [hCGBPalUpdate], a

	ld de, MUSIC_TITLE
	call PlayMusic

	ret
; 10c0b1

UnusedTitleBG_GFX: ; 10c0b1
INCBIN "gfx/title/old_bg.2bpp"
; 10d0b1

UnusedTitleBG_Tilemap: ; 10d0b1
; 32x32 (tile, attributes)
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $01,$00, $02,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $03,$00, $04,$00, $05,$01, $06,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $07,$05, $08,$05, $09,$05, $0a,$05, $0b,$00, $0c,$00, $0d,$00, $0e,$00, $0f,$01, $10,$01, $11,$01, $12,$01, $13,$05, $14,$05, $15,$05, $16,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $17,$04, $18,$04, $19,$04, $1a,$04, $1b,$00, $1c,$00, $1d,$02, $1e,$02, $1f,$07, $20,$07, $21,$01, $22,$01, $23,$04, $24,$04, $25,$04, $26,$04, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $27,$04, $28,$04, $29,$04, $2a,$04, $2b,$00, $2c,$00, $2d,$03, $2e,$01, $2f,$01, $30,$01, $31,$01, $32,$01, $33,$04, $34,$04, $35,$04, $36,$04, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $37,$04, $38,$04, $39,$04, $3a,$04, $3b,$00, $3c,$00, $3d,$01, $00,$00, $00,$00, $3e,$07, $3f,$01, $40,$01, $41,$04, $42,$04, $43,$04, $44,$04, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $45,$04, $46,$04, $47,$04, $48,$04, $49,$00, $3c,$00, $4a,$01, $00,$00, $00,$00, $4b,$07, $3f,$01, $4c,$01, $4d,$06, $4e,$06, $4f,$06, $50,$06, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $51,$04, $52,$06, $53,$06, $54,$06, $55,$00, $3c,$00, $56,$01, $00,$00, $00,$00, $57,$07, $58,$01, $59,$01, $5a,$06, $5b,$06, $5c,$06, $5d,$06, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $5e,$06, $5f,$06, $60,$06, $61,$06, $62,$00, $63,$00, $64,$03, $65,$01, $66,$01, $67,$07, $68,$01, $69,$01, $26,$04, $6a,$06, $26,$04, $26,$04, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $6b,$00, $6c,$05, $6d,$05, $6e,$05, $6f,$00, $70,$02, $71,$02, $72,$01, $73,$00, $74,$02, $75,$01, $76,$01, $77,$05, $78,$05, $79,$05, $6b,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $7a,$00, $7b,$00, $7c,$00, $7d,$00, $0f,$01, $7e,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $a2,$00, $80,$00, $81,$00, $82,$00, $83,$00, $84,$07, $85,$01, $86,$01, $87,$01, $88,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $89,$00, $8a,$00, $8b,$00, $8c,$07, $8d,$01, $8e,$01, $8f,$01, $90,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $91,$01, $92,$01, $93,$01, $94,$01, $95,$01, $00,$00, $00,$00, $00,$00, $96,$05, $97,$05, $98,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $99,$05, $9a,$05, $9b,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $9c,$05, $9d,$05, $9e,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $9f,$05, $a0,$05, $a1,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $6b,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
; 10d8b1

UnsuedTitleBG_Palettes: ; 10d8b1
	RGB 00, 00, 00
	RGB 25, 15, 28
	RGB 22, 11, 28
	RGB 19, 08, 26

	RGB 00, 00, 00
	RGB 17, 07, 22
	RGB 13, 07, 16
	RGB 19, 08, 26

	RGB 25, 15, 28
	RGB 22, 11, 28
	RGB 19, 08, 26
	RGB 17, 07, 22

	RGB 22, 11, 28
	RGB 19, 08, 26
	RGB 17, 07, 22
	RGB 13, 07, 16

	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 16, 16, 24
	RGB 02, 13, 21

	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 12, 12, 12

	RGB 00, 00, 00
	RGB 01, 11, 23
	RGB 16, 16, 24
	RGB 02, 13, 21

	RGB 00, 00, 00
	RGB 22, 10, 31
	RGB 19, 08, 26
	RGB 17, 07, 22


	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 20, 04, 20
	RGB 16, 08, 16
	RGB 24, 00, 24

	rept 54
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	endr
; 10dab1

UnusedTitleFG_GFX: ; 10dab1
INCBIN "gfx/title/old_fg.2bpp"
; 10eab1

UnsuedTitleFG_Palettes: ; 10eab1
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 16, 16, 24
	RGB 02, 13, 21

	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 12, 12, 12

	RGB 00, 00, 00
	RGB 01, 11, 23
	RGB 16, 16, 24
	RGB 02, 13, 21

	RGB 00, 00, 00
	RGB 31, 22, 00
	RGB 31, 27, 00
	RGB 31, 31, 00

	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 16, 16, 24
	RGB 02, 13, 21

	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 12, 12, 12

	RGB 00, 00, 00
	RGB 01, 11, 23
	RGB 16, 16, 24
	RGB 02, 13, 21

	RGB 16, 31, 00
	RGB 22, 31, 00
	RGB 27, 31, 00
	RGB 31, 31, 00


	RGB 31, 00, 18
	RGB 31, 31, 31
	RGB 16, 16, 24
	RGB 02, 13, 21

	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 12, 12, 12

	RGB 00, 00, 00
	RGB 01, 11, 23
	RGB 16, 16, 24
	RGB 02, 13, 21

	RGB 16, 31, 00
	RGB 22, 31, 00
	RGB 27, 31, 00
	RGB 31, 31, 00

	RGB 24, 18, 31
	RGB 31, 31, 00
	RGB 31, 31, 01
	RGB 31, 31, 03

	RGB 31, 31, 05
	RGB 31, 31, 08
	RGB 31, 31, 10
	RGB 31, 31, 12

	RGB 31, 31, 14
	RGB 31, 31, 16
	RGB 31, 31, 18
	RGB 31, 31, 20

	RGB 31, 31, 22
	RGB 31, 31, 25
	RGB 31, 31, 27
	RGB 31, 31, 29

	RGB 24, 06, 06
	RGB 01, 01, 01
	RGB 03, 03, 03
	RGB 05, 05, 05

	RGB 08, 08, 08
	RGB 10, 10, 10
	RGB 12, 12, 12
	RGB 14, 14, 14

	RGB 16, 16, 16
	RGB 18, 18, 18
	RGB 20, 20, 20
	RGB 22, 22, 22

	RGB 25, 25, 25
	RGB 27, 27, 27
	RGB 29, 29, 29
	RGB 31, 31, 31

	RGB 18, 24, 18
	RGB 31, 29, 01
	RGB 31, 27, 03
	RGB 31, 25, 05

	RGB 31, 22, 08
	RGB 31, 20, 10
	RGB 31, 18, 12
	RGB 31, 16, 14

	RGB 31, 14, 16
	RGB 31, 12, 18
	RGB 31, 10, 20
	RGB 31, 08, 22

	RGB 31, 05, 25
	RGB 31, 03, 27
	RGB 31, 01, 29
	RGB 31, 00, 31

	RGB 18, 06, 31
	RGB 00, 31, 31
	RGB 00, 31, 29
	RGB 00, 31, 27

	RGB 00, 31, 25
	RGB 00, 31, 22
	RGB 00, 31, 20
	RGB 00, 31, 18

	RGB 00, 31, 16
	RGB 00, 31, 14
	RGB 00, 31, 12
	RGB 00, 31, 10

	RGB 00, 31, 08
	RGB 00, 31, 05
	RGB 00, 31, 03
	RGB 00, 31, 01

	RGB 12, 31, 06
	RGB 00, 00, 31
	RGB 00, 01, 31
	RGB 00, 03, 31

	RGB 00, 05, 31
	RGB 00, 08, 31
	RGB 00, 10, 31
	RGB 00, 12, 31

	RGB 00, 14, 31
	RGB 00, 16, 31
	RGB 00, 18, 31
	RGB 00, 20, 31

	RGB 00, 22, 31
	RGB 00, 25, 31
	RGB 00, 27, 31
	RGB 00, 29, 31

	RGB 00, 00, 00
	RGB 06, 00, 04
	RGB 19, 02, 09
	RGB 28, 04, 11

	RGB 31, 07, 16
	RGB 31, 17, 23
	RGB 31, 26, 30
	RGB 07, 05, 10

	RGB 14, 10, 18
	RGB 20, 20, 25
	RGB 25, 27, 31
	RGB 09, 05, 06

	RGB 23, 16, 13
	RGB 30, 23, 22
	RGB 31, 28, 28
	RGB 31, 31, 31

	RGB 06, 31, 31
	RGB 04, 00, 04
	RGB 11, 02, 04
	RGB 17, 02, 04

	RGB 24, 05, 04
	RGB 28, 07, 04
	RGB 31, 11, 04
	RGB 02, 01, 15

	RGB 04, 11, 22
	RGB 12, 25, 25
	RGB 20, 31, 31
	RGB 09, 04, 03

	RGB 22, 11, 08
	RGB 27, 19, 16
	RGB 30, 28, 26
	RGB 31, 31, 31

	RGB 06, 18, 06
	RGB 04, 04, 02
	RGB 07, 07, 02
	RGB 18, 18, 04

	RGB 24, 24, 06
	RGB 27, 27, 11
	RGB 31, 31, 20
	RGB 02, 03, 10

	RGB 04, 05, 13
	RGB 06, 10, 25
	RGB 08, 15, 31
	RGB 04, 00, 06

	RGB 11, 07, 14
	RGB 21, 16, 23
	RGB 29, 26, 31
	RGB 31, 31, 31

	RGB 06, 00, 18
	RGB 00, 04, 03
	RGB 02, 09, 05
	RGB 11, 19, 07

	RGB 16, 24, 08
	RGB 22, 31, 09
	RGB 24, 31, 18
	RGB 03, 01, 03

	RGB 10, 04, 10
	RGB 20, 08, 20
	RGB 31, 17, 31
	RGB 01, 03, 06

	RGB 05, 09, 10
	RGB 15, 21, 21
	RGB 23, 25, 25
	RGB 31, 31, 31

	RGB 00, 18, 31
	RGB 00, 05, 07
	RGB 00, 08, 13
	RGB 00, 12, 17

	RGB 01, 20, 24
	RGB 04, 27, 31
	RGB 14, 31, 31
	RGB 04, 02, 02

	RGB 15, 01, 03
	RGB 26, 04, 07
	RGB 31, 13, 16
	RGB 00, 05, 02

	RGB 01, 11, 03
	RGB 06, 21, 06
	RGB 13, 31, 16
	RGB 31, 31, 31

	RGB 00, 06, 06
	RGB 00, 01, 08
	RGB 00, 05, 14
	RGB 00, 08, 19

	RGB 02, 14, 26
	RGB 04, 21, 31
	RGB 06, 26, 31
	RGB 13, 00, 00

	RGB 27, 07, 00
	RGB 31, 17, 05
	RGB 31, 25, 16
	RGB 02, 04, 00

	RGB 07, 11, 03
	RGB 17, 19, 05
	RGB 27, 31, 16
	RGB 31, 31, 31

	RGB 02, 00, 00
	RGB 04, 01, 06
	RGB 11, 03, 14
	RGB 16, 04, 19

	RGB 20, 07, 22
	RGB 26, 12, 27
	RGB 26, 20, 31
	RGB 04, 07, 00

	RGB 16, 20, 07
	RGB 24, 28, 15
	RGB 29, 31, 24
	RGB 05, 02, 02

	RGB 15, 04, 02
	RGB 24, 11, 10
	RGB 31, 22, 20
	RGB 31, 31, 31

	RGB 00, 00, 14
	RGB 12, 00, 00
	RGB 27, 05, 00
	RGB 31, 15, 05

	RGB 31, 26, 13
	RGB 31, 30, 21
	RGB 05, 07, 16
	RGB 04, 16, 20

	RGB 04, 24, 26
	RGB 08, 31, 31
	RGB 23, 31, 31
	RGB 00, 00, 00

	RGB 05, 05, 05
	RGB 17, 17, 15
	RGB 28, 28, 24
	RGB 31, 31, 31
; 10ecb1

UnusedTitleFG_OAM: ; 10ecb1
	db $18, $38, $00, $01,  $18, $40, $02, $01,  $18, $48, $04, $01,  $18, $50, $06, $01
	db $18, $58, $08, $01,  $18, $60, $0a, $01,  $18, $68, $0c, $01,  $18, $70, $0e, $01

	db $28, $38, $10, $00,  $28, $40, $12, $00,  $28, $48, $14, $00,  $28, $50, $16, $00
	db $28, $58, $18, $00,  $28, $60, $1a, $00,  $28, $68, $1c, $00,  $28, $70, $1e, $00

	db $38, $38, $20, $00,  $38, $40, $22, $00,  $38, $48, $24, $00,  $38, $50, $26, $00
	db $38, $58, $28, $00,  $38, $60, $2a, $00,  $38, $68, $2c, $00,  $38, $70, $2e, $00

	db $48, $38, $30, $02,  $48, $40, $32, $02,  $48, $48, $34, $02,  $48, $50, $36, $02
	db $48, $58, $38, $02,  $48, $60, $3a, $02,  $48, $68, $3c, $02,  $48, $70, $3e, $02

	db $58, $38, $40, $01,  $58, $40, $42, $01,  $58, $48, $44, $01,  $58, $50, $46, $01
	db $58, $58, $48, $01,  $58, $60, $4a, $01,  $58, $68, $4c, $01,  $58, $70, $4e, $01
; 10ed51


Function10ed51: ; 10ed51
	call _TitleScreen
.loop
	call Functiona57
	ld a, [$ffa9]
	ld b, a
	and 1
	jr nz, .done
	call Function10eea7
	call DelayFrame
	jr .loop
.done
	ret
; 10ed67
