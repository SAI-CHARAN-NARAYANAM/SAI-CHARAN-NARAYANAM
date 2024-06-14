* @ValidationCode : MjoyNjA1Njg5NDA6Q3AxMjUyOjE2NzI2NDgwNDU2Mzk6U2FpY2hhcmFuOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjE4X1NQMTcuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 02 Jan 2023 13:57:25
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE BNS.AR.UPDATE.AUTO.RECOVR
*-----------------------------------------------------------------------------
*COMPANY NAME : PAGE SOLUTIONS PVT.LTD
*DEVELOPED BY : N SAI CHARAN
*ATTACHED AS : INPUT ROUTINE
*ATTACHED TO : PG.H.EMP.DTLS,EMP.INPUT & PG.H.EMP.DTLS,EMP.AMEND
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.PG.H.EMP.DTLS

    PH.NO = R.OLD(CH.I.EMP.PHONE.NO)
    GROS.SAL = R.OLD(CH.I.EMP.GROSS.SAL)
    Y.PH.NO = R.NEW(CH.I.EMP.PHONE.NO)
    Y.SAL = R.NEW(CH.I.EMP.PHONE.NO)

    IF Y.PH.NO NE PH.NO THEN
        AF = CH.I.EMP.PHONE.NO
        ETEXT = "PHONE NUMBER CHANGED"
        CALL STORE.OVERRIDE("")
    END

    IF Y.SAL NE GROS.SAL THEN
        AF = CH.I.EMP.GROSS.SAL
        ETEXT = "SALARY CHANGED"
        CALL STORE.OVERRIDE("")
    END
    
RETURN
END
