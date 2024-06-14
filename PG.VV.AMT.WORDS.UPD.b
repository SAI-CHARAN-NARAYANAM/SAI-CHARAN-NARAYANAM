* @ValidationCode : MjotNjcwNTY2MDk6Q3AxMjUyOjE2NzI2NDQxMTM4MDQ6U2FpY2hhcmFuOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjE4X1NQMTcuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 02 Jan 2023 12:51:53
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE PG.VV.AMT.WORDS.UPD
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.PG.H.EMP.DTLS
    
    GROSS.AMOUNT = COMI
    IF GROSS.AMOUNT NE "" THEN
        G.AMT = FIELD(GROSS.AMOUNT,".",1)
        G.AMT2 = FIELD(GROSS.AMOUNT,".",2)

        CALL DE.O.PRINT.WORDS(G.AMT,OUT.AMT,"GB",LINE.LENGTH,NO.OF.LINES,ERR.MSG)
        CALL DE.O.PRINT.WORDS(G.AMT2,OUT.AMT2,"GB",LINE.LENGTH,NO.OF.LINES,ERR.MSG)

        R.NEW(CH.I.GROSS.SAL.IN.WORDS) = OUT.AMT:" POUNDS ":OUT.AMT2:" PENCE "
    END
*-----------------------------------------------------------------------------
RETURN
END
