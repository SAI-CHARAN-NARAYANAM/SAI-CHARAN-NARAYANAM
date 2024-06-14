* @ValidationCode : MjotMjMwOTA1MjA1OkNwMTI1MjoxNjkxNDAwNzUzNDg4OlNhaWNoYXJhbjotMTotMTowOjA6ZmFsc2U6Ti9BOlIxOF9TUDE3LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 07 Aug 2023 15:02:33
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE MT.DATA.EXTRACT.RTN.POST
*-----------------------------------------------------------------------------
*COMPANY NAME : PAGE SOLUTIONS PVT.LTD
*DEVELOPED BY : N SAI CHARAN
*-----------------------------------------------------------------------------
*SUBROUTINE TYPE : SIGNLE THREAD ROUTINE ATTACHED AS .POST TO MULTI THREAD
*ATTACHED AS : JOB IN BATCH APPLICATION
*ATTACHED TO : BATCH ID : BNK/MT.DATA.EXTRACT.RTN
*DEVELOPED FOR : GENERATING .FLAG FILE TO GET COUNT OF RECORDS IN .CSV FILES GENERATED
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
* Date         :
* Author       :
* Description  :
* CR/Defect    :
*
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_MT.DATA.EXTRACT.RTN.COMMON
    $INSERT I_BATCH.FILES
*-----------------------------------------------------------------------------
    DEBUG
    LOOP
        REMOVE FL.APPL.ID FROM Y.APPL SETTING FL.APP.POS
    WHILE FL.APPL.ID:FL.APP.POS
        FL.DIR = "C:\Users\Saicharan\Desktop"
        FL.NME = FL.APPL.ID:".":"OUTPUT.":Y.FILEFORMAT
        OPEN FL.DIR TO F.PATH1 ELSE
        END
        READ F.FLDATA FROM F.PATH1,FL.NME ELSE
            CRT "FILE HAS NOT READ"
        END
        FL.COUNT = DCOUNT(F.FLDATA,FM)
        APPL.NM<-1> = FL.APPL.ID:",":FL.COUNT
    REPEAT
*----------------------------------------------------------------------------------------
    FL.DATA = "BNK.flag"
    WRITE APPL.NM TO F.PATH1,FL.DATA ON ERROR
        CRT "FLAG FILE NOT GENERATED"
    END
*-----------------------------------------------------------------------------------------
RETURN
END