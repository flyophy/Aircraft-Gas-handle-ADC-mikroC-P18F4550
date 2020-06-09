
_interrupt:

;MyProject.c,5 :: 		void interrupt()
;MyProject.c,7 :: 		USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;MyProject.c,8 :: 		}
L_end_interrupt:
L__interrupt24:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,10 :: 		void main(void)
;MyProject.c,12 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MyProject.c,13 :: 		HID_Enable(&readbuff,&writebuff);       // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;MyProject.c,14 :: 		while(1)
L_main0:
;MyProject.c,16 :: 		oku=ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _oku+0 
	MOVF        R1, 0 
	MOVWF       _oku+1 
;MyProject.c,17 :: 		if(oku>100) writebuff[0]='-';
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main26
	MOVF        R0, 0 
	SUBLW       100
L__main26:
	BTFSC       STATUS+0, 0 
	GOTO        L_main2
	MOVLW       45
	MOVWF       1344 
	GOTO        L_main3
L_main2:
;MyProject.c,18 :: 		else writebuff[0]=' ';
	MOVLW       32
	MOVWF       1344 
L_main3:
;MyProject.c,19 :: 		if(oku>200) writebuff[1]='-';
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main27
	MOVF        _oku+0, 0 
	SUBLW       200
L__main27:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
	MOVLW       45
	MOVWF       1345 
	GOTO        L_main5
L_main4:
;MyProject.c,20 :: 		else writebuff[1]=' ';
	MOVLW       32
	MOVWF       1345 
L_main5:
;MyProject.c,21 :: 		if(oku>300) writebuff[2]='-';
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
	MOVF        _oku+0, 0 
	SUBLW       44
L__main28:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
	MOVLW       45
	MOVWF       1346 
	GOTO        L_main7
L_main6:
;MyProject.c,22 :: 		else writebuff[2]=' ';
	MOVLW       32
	MOVWF       1346 
L_main7:
;MyProject.c,23 :: 		if(oku>400) writebuff[3]='-';
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main29
	MOVF        _oku+0, 0 
	SUBLW       144
L__main29:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
	MOVLW       45
	MOVWF       1347 
	GOTO        L_main9
L_main8:
;MyProject.c,24 :: 		else writebuff[3]=' ';
	MOVLW       32
	MOVWF       1347 
L_main9:
;MyProject.c,25 :: 		if(oku>500) writebuff[4]='-';
	MOVLW       128
	XORLW       1
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main30
	MOVF        _oku+0, 0 
	SUBLW       244
L__main30:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
	MOVLW       45
	MOVWF       1348 
	GOTO        L_main11
L_main10:
;MyProject.c,26 :: 		else writebuff[4]=' ';
	MOVLW       32
	MOVWF       1348 
L_main11:
;MyProject.c,27 :: 		if(oku>600) writebuff[5]='-';
	MOVLW       128
	XORLW       2
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main31
	MOVF        _oku+0, 0 
	SUBLW       88
L__main31:
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
	MOVLW       45
	MOVWF       1349 
	GOTO        L_main13
L_main12:
;MyProject.c,28 :: 		else writebuff[5]=' ';
	MOVLW       32
	MOVWF       1349 
L_main13:
;MyProject.c,29 :: 		if(oku>700) writebuff[6]='-';
	MOVLW       128
	XORLW       2
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main32
	MOVF        _oku+0, 0 
	SUBLW       188
L__main32:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
	MOVLW       45
	MOVWF       1350 
	GOTO        L_main15
L_main14:
;MyProject.c,30 :: 		else writebuff[6]=' ';
	MOVLW       32
	MOVWF       1350 
L_main15:
;MyProject.c,31 :: 		if(oku>800) writebuff[7]='-';
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main33
	MOVF        _oku+0, 0 
	SUBLW       32
L__main33:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
	MOVLW       45
	MOVWF       1351 
	GOTO        L_main17
L_main16:
;MyProject.c,32 :: 		else writebuff[7]=' ';
	MOVLW       32
	MOVWF       1351 
L_main17:
;MyProject.c,33 :: 		if(oku>900) writebuff[8]='-';
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main34
	MOVF        _oku+0, 0 
	SUBLW       132
L__main34:
	BTFSC       STATUS+0, 0 
	GOTO        L_main18
	MOVLW       45
	MOVWF       1352 
	GOTO        L_main19
L_main18:
;MyProject.c,34 :: 		else writebuff[8]=' ';
	MOVLW       32
	MOVWF       1352 
L_main19:
;MyProject.c,35 :: 		if(oku>1000) writebuff[9]='-';
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       _oku+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main35
	MOVF        _oku+0, 0 
	SUBLW       232
L__main35:
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
	MOVLW       45
	MOVWF       1353 
	GOTO        L_main21
L_main20:
;MyProject.c,36 :: 		else writebuff[9]=' ';
	MOVLW       32
	MOVWF       1353 
L_main21:
;MyProject.c,37 :: 		writebuff[10]=13;
	MOVLW       13
	MOVWF       1354 
;MyProject.c,38 :: 		writebuff[11]=10;
	MOVLW       10
	MOVWF       1355 
;MyProject.c,40 :: 		HID_Write(&writebuff,64);
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;MyProject.c,41 :: 		delay_ms(10);
	MOVLW       156
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
;MyProject.c,43 :: 		}
	GOTO        L_main0
;MyProject.c,44 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
