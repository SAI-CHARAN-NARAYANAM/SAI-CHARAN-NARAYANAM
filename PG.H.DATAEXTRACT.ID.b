* @ValidationCode : MjoyMDA0NTc1NDA4OkNwMTI1MjoxNjc1Njc3NzMzMDI3OlNhaWNoYXJhbjotMTotMTowOjA6ZmFsc2U6Ti9BOlIxOF9TUDE3LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 06 Feb 2023 15:32:13
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE PG.H.DATAEXTRACT.ID
*-----------------------------------------------------------------------------
    !** FIELD definitions FOR PG.H.DATAEXTRACT
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
*   Y.ID = ID.NEW
 
* IF Y.ID NE "SYSTEM" THEN
*     E = "ENTER VALID ID"
* END

RETURN

END
