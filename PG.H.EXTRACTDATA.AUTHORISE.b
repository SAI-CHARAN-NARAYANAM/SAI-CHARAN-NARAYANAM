* @ValidationCode : MjoxMDAzNDE0MTQ3OkNwMTI1MjoxNjc1ODM5NDMyMDcyOlNhaWNoYXJhbjotMTotMTowOjA6ZmFsc2U6Ti9BOlIxOF9TUDE3LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 08 Feb 2023 12:27:12
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
*-----------------------------------------------------------------------------
* <Rating>-22</Rating>
*-----------------------------------------------------------------------------
SUBROUTINE PG.H.EXTRACTDATA.AUTHORISE
*-----------------------------------------------------------------------------
    !** Simple AUTHORISE template
* @author youremail@temenos.com
* @stereotype subroutine
* @package infra.eb
*!
*** <region name= PROGRAM DESCRIPTION>
*** <desc>Program description</desc>
*-----------------------------------------------------------------------------
* Program Description
*** </region>
*** <region name= MODIFICATION HISTORY>
*** <desc>Modification history</desc>
*-----------------------------------------------------------------------------
* Modification History:
*-----------------------------------------------------------------------------
*** </region>

*** <region name= INSERTS>
*** <desc>Inserts</desc>
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.PG.H.EXTRACTDATA
*** </region>
*-----------------------------------------------------------------------------
*** <region name= MAIN PROCESS LOGIC>
*** <desc>Main process logic</desc>
*   GOSUB INITIALISE
 
*RETURN
*** <region name= INITIALISE>
*** <desc>Initialise</desc>
*------------------------------------------------------------------------------
*INITIALISE:
*------------------------------------------------------------------------------
*FN.PG.H.EXTRACTDATA = "F.PG.H.EXTRACTDATA"
*F.PG.H.EXTRACTDATA = ""
*CALL OPF(FN.PG.H.EXTRACTDATA,F.PG.H.EXTRACTDATA)
*   Y.ID = ID.NEW
*** </region>
*** </region>
*-----------------------------------------------------------------------------
*** <region name= PROCESS>
*** <desc>Process</desc>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
*  Y.APPL = R.NEW(PG.DATA.APPLICATION.NAME)
* Y.FIELD = R.NEW(PG.DATA.FIELD.NAME)
*DEBUG
*LOOP
*    REMOVE APPL.ID FROM Y.APPL SETTING APPL.POS
*WHILE APPL.ID:APPL.POS
*   SEL.CMD = "SELECT ":"FBNK.":APPL.ID
*  SEL.LST = ""
* SEL.COUNT = ""
*SEL.ERR = ""
*CALL EB.READLIST(SEL.CMD,SEL.LST,'',SEL.COUNT,SEL.ERR)
*Y.FINAL = SEL.LST
*Y.APL.ID = "FBNK.":APPL.ID
        
*GOSUB Y.LIST.DET
*REPEAT
*-------------------------------------------------------------------------------
*Y.LIST.DET:
*----------------------------------------------------------------------------------------
*   LOOP
*      REMOVE Y.REC.ID FROM SEL.LST SETTING Y.REC.POS
* WHILE Y.REC.ID:Y.REC.POS
        
*    GOSUB FLD.DET
*REPEAT
*RETURN
*-----------------------------------------------------------------------------------------
*FLD.DET:
*   LOOP
*      REMOVE Y.FLD.ID FROM Y.FIELD SETTING Y.FLD.POS
*  WHILE Y.FLD.ID:Y.FLD.POS
*     GOSUB Y.SS.DET
*REPEAT
*RETURN
*---------------------------------------------------------------------------------------
*Y.SS.DET:
*------------------------------------------------------------------------------------------
*   CALL GET.STANDARD.SELECTION.DETS( APPL.ID, SS.REC )
*  Y.FLAG = 1
* LOOP
*    REMOVE SS.ID FROM SS.REC SETTING SS.POS
*WHILE SS.ID:SS.POS
*
*   IF SS.ID EQ Y.FLD.ID THEN
*Y.CNT.SS = COUNT(SS.REC,)
*    CALL EB.READLIST(Y.SEL,Y.LST,'',Y.COUNT,Y.ER)

*Y.REC.LST = Y.LST
*Y.APL.REC.ID = Y.REC.ID
*      CALL CACHE.DBR(APPL.ID,Y.FLAG,Y.REC.ID,Y.RES)
*     CRT Y.RES
*    GOSUB Y.FINAL.ARRAY
*END
*FINAL.ARRAY<-1> = APPL.ID:",":Y.REC.ID:",":Y.RES
*Y.FLAG = Y.FLAG+1
*REPEAT
*** </region>
*RETURN
*-----------------------------------------------------------------------------
*Y.FINAL.ARRAY:
*-------------------------------------------------------------------------------
*   FINAL.ARRAY<-1> = APPL.ID:",":Y.REC.ID:",":Y.RES
*RETURN
*------------------------------------------------------------------------------
END