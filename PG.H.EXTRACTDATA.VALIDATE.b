* @ValidationCode : Mjo0ODMwMzU0NTE6Q3AxMjUyOjE2NzYwMjEwNzg1MTc6U2FpY2hhcmFuOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjE4X1NQMTcuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 10 Feb 2023 14:54:38
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
* Version 2 02/06/00  GLOBUS Release No. G11.0.00 29/06/00
SUBROUTINE PG.H.EXTRACTDATA.VALIDATE
*-----------------------------------------------------------------------------
    !** Template FOR validation routines
* @author youremail@temenos.com
* @stereotype validator
* @package infra.eb
*!
*-----------------------------------------------------------------------------
*** <region name= Modification History>
*-----------------------------------------------------------------------------
* 07/06/06 - BG_100011433
*            Creation
*-----------------------------------------------------------------------------
*** </region>
*** <region name= Main section>
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.PG.H.EXTRACTDATA
*FN.PG.H.EXTRACTDATA = "F.PG.H.EXTRACTDATA"
*F.PG.H.EXTRACTDATA = ""
*CALL OPF(FN.PG.H.EXTRACTDATA,F.PG.H.EXTRACTDATA)

*Y.ID = "SYSTEM"




    GOSUB INITIALISE
    GOSUB PROCESS.MESSAGE
    
    
RETURN
*** </region>
*-----------------------------------------------------------------------------
*VALIDATE:
* TODO - Add the validation code here.
* Set AF, AV and AS to the field, multi value and sub value and invoke STORE.END.ERROR
* Set ETEXT to point to the EB.ERROR.TABLE

*      AF = MY.FIELD.NAME                 <== Name of the field
*      ETEXT = 'EB-EXAMPLE.ERROR.CODE'    <== The error code
*      CALL STORE.END.ERROR               <== Needs to be invoked per error

*RETURN
*-----------------------------------------------------------------------------
*** <region name= Initialise>
INITIALISE:
***
* Y.APPL = R.NEW(PG.DATA.APPLICATION.NAME)
* Y.FLD = R.NEW(PG.DATA.FIELD.NAME)
*
RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= Process Message>
PROCESS.MESSAGE:
* Y.FLAG = 1
*   LOOP
*      REMOVE Y.APPL.ID FROM Y.APPL SETTING Y.APPL.POS
* WHILE Y.APPL.ID:Y.APPL.POS
    
*    FN.APPL = "F.":Y.APPL.ID
*   F.APPL = ""
*  CALL OPF(FN.APPL,F.APPL)
   
* IF F.APPL EQ "" THEN
*    AF = PG.DATA.APPLICATION.NAME
*   ETEXT = "ERROR APPLICATION"
*  CALL STORE.END.ERROR
*END
*GOSUB Y.FLD
*Y.FLAG = Y.FLAG+1
*REPEAT
*BEGIN CASE
*   CASE MESSAGE EQ ''        ;* Only during commit...
*      BEGIN CASE
*         CASE V$FUNCTION EQ 'D'
*            GOSUB VALIDATE.DELETE
*       CASE V$FUNCTION EQ 'R'
*          GOSUB VALIDATE.REVERSE
*     CASE OTHERWISE        ;* The real VALIDATE...
*        GOSUB VALIDATE
*END CASE
*CASE MESSAGE EQ 'AUT' OR MESSAGE EQ 'VER'     ;* During authorisation and verification...
*   GOSUB VALIDATE.AUTHORISATION
*END CASE
*
*RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= VALIDATE.DELETE>
*VALIDATE.DELETE:
* Any special checks for deletion

*RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= VALIDATE.REVERSE>
*VALIDATE.REVERSE:
* Any special checks for reversal

*RETURN
*** </region>
*-----------------------------------------------------------------------------
*** <region name= VALIDATE.AUTHORISATION>
*VALIDATE.AUTHORISATION:
* Any special checks for authorisation

*RETURN
*** </region>
*-----------------------------------------------------------------------------
*END
END