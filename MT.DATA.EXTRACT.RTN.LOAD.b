* @ValidationCode : MjotMTg0NzI5MzcwMTpDcDEyNTI6MTY3NzA0NzU2MDgwOTpTYWljaGFyYW46LTE6LTE6MDowOmZhbHNlOk4vQTpSMThfU1AxNy4wOi0xOi0x
* @ValidationInfo : Timestamp         : 22 Feb 2023 12:02:40
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE MT.DATA.EXTRACT.RTN.LOAD
*-----------------------------------------------------------------------------
**DEVELOPMENT DETAILS:
*-------------------*
*COMPANY NAME    : PAGE SOLUTIONS PVT.LTD
*DEVELOPED BY    : N SAI CHARAN
*-----------------------------------------------------------------------------
*SUBROUTINE TYPE : .LOAD MULTI THREAD ROUTINE
*ATTACHED TO     : -
*ATTACHED AS     : -
*DEVELOPED FOR   : OPENING REQUIRED APPLICATIONS AND ASSIGNING VALUES TO COMMON VARIABLES
*
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
    Y.ID = "SYSTEM"
*---------------------------------------------------
    FN.PG.H.EXTARCTDATA = "F.PG.H.EXTRACTDATA"
    F.PG.H.EXTRACTDATA = ""
    CALL OPF(FN.PG.H.EXTARCTDATA,F.PG.H.EXTRACTDATA)
    CALL F.READ(FN.PG.H.EXTRACTDATA,Y.ID,Y.REC,F.PG.H.EXTRACTDATA,Y.ERR)
*----------------------------------------------------
    Y.APPL = Y.REC<PG.DATA.APPLICATION.NAME>
    Y.FIELD = Y.REC<PG.DATA.FIELD.NAME>
    Y.DELIMITER = Y.REC<PG.DATA.DELIMITER>
    Y.FILEFORMAT = Y.REC<PG.DATA.FILE.FORMAT>
*----------------------------------------------------
    F.DIR = "C:\Users\Saicharan\Desktop\APPL.DATA"
    OPEN F.DIR TO F.PATH ELSE
        CRT "FILE HASNT OPENED"
    END
*---------------------------------------------------
RETURN
END