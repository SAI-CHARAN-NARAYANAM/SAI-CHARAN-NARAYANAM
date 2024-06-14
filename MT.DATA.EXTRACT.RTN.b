* @ValidationCode : Mjo1ODkzODU0MjM6Q3AxMjUyOjE2NzcwNDcyNzEzMzU6U2FpY2hhcmFuOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjE4X1NQMTcuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 22 Feb 2023 11:57:51
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE MT.DATA.EXTRACT.RTN(Y.REC.ID)
*-----------------------------------------------------------------------------
*DEVELOPMENT DETAILS:
*-------------------*
*COMPANY NAME    : PAGE SOLUTIONS PVT.LTD
*DEVELOPED BY    : N SAI CHARAN
*-----------------------------------------------------------------------------
*SUBROUTINE TYPE : PROCESS/RECORD MULTI THREAD ROUTINE
*ATTACHED TO     : BATCH
*ATTACHED AS     : JOB TO BATCH ID , BNK/MT.DATA.EXTRACT.RTN
*DEVELOPED FOR   : WRITING THE APPLICATION RECORDS WITH FIELDS WITH GIVEN FILE FORMAT
*                  AND DELIMITER IN A TEMPLATE
*-----------------------------------------------------------------------------

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
*--------------------------------------------------------------------------------
    
*--------------------------------------------------------------------------------
    Y.APPLC = FIELD(Y.REC.ID,",",1)
    Y.APP.ID = FIELD(Y.REC.ID,",",2)
*--------------------------------------------------------------------------------
    LOCATE Y.APPLC IN Y.APPL SETTING Y.APP.POS ELSE
    END
    CONVERT VM TO FM IN Y.FIELD
    Y.APP.FIELD = FIELD(Y.FIELD,FM,Y.APP.POS)
*--------------------------------------------------------------------------------
    CALL EB.GETFIELD(Y.APPLC,Y.APP.ID,Y.APP.FIELD,Y.FLD.DATA,"","","",Y.FLD.ERR)
    CONVERT FM TO "," IN Y.FLD.DATA
*--------------------------------------------------------------------------------
    FINAL.ARRAY = Y.REC.ID:Y.DELIMITER:Y.FLD.DATA
    FL.NAME = Y.APPLC:".":"OUTPUT.":Y.FILEFORMAT
*----------------------------------------------------------------------------------
    READU FL.DATA FROM F.PATH,FL.NAME ELSE
        CRT "FILE HASN'T READ"
    END
    FL.DATA<-1> = FINAL.ARRAY
*----------------------------------------------------------------------------------
    WRITEU FL.DATA TO F.PATH,FL.NAME  ON ERROR
        CRT "WRITE HASN'T DONE"
    END
*----------------------------------------------------------------------------------
RETURN
END