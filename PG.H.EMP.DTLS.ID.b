* @ValidationCode : MjoxODE3MzEyNjI6Q3AxMjUyOjE2NzMyNjU4NDkzOTg6U2FpY2hhcmFuOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjE4X1NQMTcuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 09 Jan 2023 17:34:09
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE PG.H.EMP.DTLS.ID
*-----------------------------------------------------------------------------
    !** FIELD definitions FOR PG.H.EMP.DTLS
*!
* @author youremail@temenos.com
* @stereotype id
* @package infra.eb
* @uses E
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
*-----------------------------------------------------------------------------
* TODO Add logic to validate the id
* TODO Create an EB.ERROR record if you are creating a new error code
*-----------------------------------------------------------------------------
*Y.ID = ID.NEW
*H.ID = NUM(Y.ID)
*M.ID = LEN(Y.ID)
    
* IF NOT(H.ID)  THEN
*    E = 'ID SHOULD BE ONLY NUMERIC'
*END
    
* IF M.ID GE "10" THEN
*    E = "ID SHOULD BE 10 DIGITS ONLY"
*END
    
RETURN
END
