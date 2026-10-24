MysteryGiftNPC:
    call Random
    bit 0, a
    jr z, .item

    ld b, 64
.try_deco
    push bc
    ld a, NUM_MYSTERY_GIFT_NPC_DECOS
    call RandomRange
    push af
    add a
    ld e, a
    ld d, 0
    ld hl, .DecorationEvents
    add hl, de
    ld a, [hli]
    ld e, a
    ld a, [hl]
    ld d, a
    push de
    ld b, CHECK_FLAG
    farcall EventFlagAction
    ld a, c
    and a
    pop de
    jr z, .give_deco
    pop af
    pop bc
    dec b
    jr nz, .try_deco
    jr .item

.give_deco
    ld b, SET_FLAG
    farcall EventFlagAction
    pop af
    add a
    ld e, a
    ld d, 0
    ld hl, .DecorationNames
    add hl, de
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ld de, wStringBuffer4
.copy_name
    ld a, [hli]
    ld [de], a
    inc de
    cp "@"
    jr nz, .copy_name
    pop bc
    ld a, 1
    ld [wScriptVar], a
    ret

.item
    ld hl, .MysteryGiftItems
    call Random
.loop
    sub [hl]
    jr c, .ok
    inc hl
    inc hl
    jr .loop
.ok
    ld a, [hli]
    cp $ff
    ld a, POKE_BALL
    jr z, .done
    ld a, [hli]
.done
    ld [wScriptVar], a
    ret

DEF NUM_MYSTERY_GIFT_NPC_DECOS EQU 37

.DecorationEvents:
    dw EVENT_DECO_PIKACHU_DOLL
    dw EVENT_DECO_BULBASAUR_DOLL
    dw EVENT_DECO_CHARMANDER_DOLL
    dw EVENT_DECO_SQUIRTLE_DOLL
    dw EVENT_DECO_POLIWAG_DOLL
    dw EVENT_DECO_DIGLETT_DOLL
    dw EVENT_DECO_STARMIE_DOLL
    dw EVENT_DECO_MAGIKARP_DOLL
    dw EVENT_DECO_ODDISH_DOLL
    dw EVENT_DECO_GENGAR_DOLL
    dw EVENT_DECO_POSTER_3
    dw EVENT_DECO_POSTER_4
    dw EVENT_DECO_SNES
    dw EVENT_DECO_SHELLDER_DOLL
    dw EVENT_DECO_VOLTORB_DOLL
    dw EVENT_DECO_WEEDLE_DOLL
    dw EVENT_DECO_PLANT_1
    dw EVENT_DECO_PLANT_2
    dw EVENT_DECO_FAMICOM
    dw EVENT_DECO_N64
    dw EVENT_DECO_SURFING_PIKACHU_DOLL
    dw EVENT_DECO_JIGGLYPUFF_DOLL
    dw EVENT_DECO_BED_2
    dw EVENT_DECO_BED_3
    dw EVENT_DECO_CARPET_1
    dw EVENT_DECO_CARPET_2
    dw EVENT_DECO_CARPET_3
    dw EVENT_DECO_CARPET_4
    dw EVENT_DECO_PLANT_3
    dw EVENT_DECO_VIRTUAL_BOY
    dw EVENT_DECO_MACHOP_DOLL
    dw EVENT_DECO_POSTER_2
    dw EVENT_DECO_TENTACOOL_DOLL
    dw EVENT_DECO_BIG_ONIX_DOLL
    dw EVENT_DECO_BED_4
    dw EVENT_DECO_GRIMER_DOLL
    dw EVENT_DECO_UNOWN_DOLL

.DecorationNames:
    dw .Name0
    dw .Name1
    dw .Name2
    dw .Name3
    dw .Name4
    dw .Name5
    dw .Name6
    dw .Name7
    dw .Name8
    dw .Name9
    dw .Name10
    dw .Name11
    dw .Name12
    dw .Name13
    dw .Name14
    dw .Name15
    dw .Name16
    dw .Name17
    dw .Name18
    dw .Name19
    dw .Name20
    dw .Name21
    dw .Name22
    dw .Name23
    dw .Name24
    dw .Name25
    dw .Name26
    dw .Name27
    dw .Name28
    dw .Name29
    dw .Name30
    dw .Name31
    dw .Name32
    dw .Name33
    dw .Name34
    dw .Name35
    dw .Name36

.Name0: db "PIKACHU DOLL@"
.Name1: db "BULBASAUR DOLL@"
.Name2: db "CHARMANDER DOLL@"
.Name3: db "SQUIRTLE DOLL@"
.Name4: db "POLIWAG DOLL@"
.Name5: db "DIGLETT DOLL@"
.Name6: db "STARMIE DOLL@"
.Name7: db "MAGIKARP DOLL@"
.Name8: db "ODDISH DOLL@"
.Name9: db "GENGAR DOLL@"
.Name10: db "CLEFAIRY POSTER@"
.Name11: db "JIGGLYPUFF POSTER@"
.Name12: db "SUPER NES@"
.Name13: db "SHELLDER DOLL@"
.Name14: db "VOLTORB DOLL@"
.Name15: db "WEEDLE DOLL@"
.Name16: db "MAGNAPLANT@"
.Name17: db "TROPICPLANT@"
.Name18: db "FAMICOM@"
.Name19: db "NINTENDO 64@"
.Name20: db "SURF PIKACHU DOLL@"
.Name21: db "JIGGLYPUFF DOLL@"
.Name22: db "PINK BED@"
.Name23: db "POLKADOT BED@"
.Name24: db "RED CARPET@"
.Name25: db "BLUE CARPET@"
.Name26: db "YELLOW CARPET@"
.Name27: db "GREEN CARPET@"
.Name28: db "JUMBOPLANT@"
.Name29: db "VIRTUAL BOY@"
.Name30: db "MACHOP DOLL@"
.Name31: db "PIKACHU POSTER@"
.Name32: db "TENTACOOL DOLL@"
.Name33: db "BIG ONIX DOLL@"
.Name34: db "PIKACHU BED@"
.Name35: db "GRIMER DOLL@"
.Name36: db "UNOWN DOLL@"

.MysteryGiftItems:
	db 8, BERRY
	db 8, PRZCUREBERRY
	db 8, MINT_BERRY
	db 8, ICE_BERRY
	db 8, BURNT_BERRY
	db 8, PSNCUREBERRY
	db 8, GUARD_SPEC
	db 8, X_DEFEND
	db 8, X_ATTACK
	db 8, BITTER_BERRY
	db 8, DIRE_HIT
	db 8, X_SPECIAL
	db 8, X_ACCURACY
	db 8, EON_MAIL
	db 8, MORPH_MAIL
	db 8, MUSIC_MAIL
	db 8, MIRACLEBERRY
	db 8, GOLD_BERRY
	db 8, REVIVE
	db 8, GREAT_BALL
	db 8, SUPER_REPEL
	db 8, MAX_REPEL
	db 8, ELIXER
	db 8, ETHER
	db 8, WATER_STONE
	db 8, FIRE_STONE
	db 8, LEAF_STONE
	db 8, THUNDERSTONE
	db 8, MAX_ETHER
	db 8, MAX_ELIXER
	db 8, MAX_REVIVE
	db 8, SCOPE_LENS
	db 8, HP_UP
	db 8, PP_UP
	db 8, RARE_CANDY
	db 8, BLUESKY_MAIL
	db 8, MIRAGE_MAIL
	db -1
	
