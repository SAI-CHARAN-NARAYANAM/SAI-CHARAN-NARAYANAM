* @ValidationCode : Mjo4ODI4Mjg1NDI6Q3AxMjUyOjE2NzcwNDc3MzE2NTk6U2FpY2hhcmFuOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjE4X1NQMTcuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 22 Feb 2023 12:05:31
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE MT.DATA.EXTRACT.RTN.SELECT
*-----------------------------------------------------------------------------
**DEVELOPMENT DETAILS:
*-------------------*
*COMPANY NAME    : PAGE SOLUTIONS PVT.LTD
*DEVELOPED BY    : N SAI CHARAN
*-----------------------------------------------------------------------------
*SUBROUTINE TYPE : .SELECT IN MULTI THREAD ROUTINE
*ATTACHED TO     : N/A
*ATTACHED AS     : N/A
*DEVELOPED FOR   : GETTING LIST OF ID'S FOR EVERY APPLICATION GIVEN IN A TEMPLATE
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
* Date         :
* Author       :
* Description  :
* CR/Defect    :
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_MT.DATA.EXTRACT.RTN.COMMON
    $INSERT I_F.PG.H.EXTRACTDATA
    $INSERT I_BATCH.FILES

    CONVERT VM TO FM IN Y.APPL
    FINAL.ARRAY = ""
*--------------------------------------------------------------------------
    IF NOT(CONTROL.LIST) THEN
        CONTROL.LIST = Y.APPL
    END
    Y.APPL.ID = CONTROL.LIST<1,1>
    FN.APP = "F.":Y.APPL.ID
    F.APP = ""
    CALL OPF(FN.APP,F.APP)
    FL.APPL<-1> = Y.APPL.ID:".":"OUTPUT.csv"
*--------------------------------------------------------------------
    SEL.CMD = "SELECT ":FN.APP
    CALL EB.READLIST(SEL.CMD,SEL.LST,'',Y.REC.COUNT,Y.SEL.ERR)
*--------------------------------------------------------------------
    LOOP
        REMOVE SEL.ID FROM SEL.LST SETTING SEL.POS
    WHILE SEL.ID:SEL.POS

        Y.LIST<-1> = Y.APPL.ID:",":SEL.ID
    REPEAT
    CALL BATCH.BUILD.LIST("",Y.LIST)
*-----------------------------------------------------------------------
RETURN
END