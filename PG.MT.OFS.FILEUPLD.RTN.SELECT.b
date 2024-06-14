* @ValidationCode : MjotOTM4MjA5MDI2OkNwMTI1MjoxNjczMzI4NjY5Nzc0OlNhaWNoYXJhbjotMTotMTowOjA6ZmFsc2U6Ti9BOlIxOF9TUDE3LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 10 Jan 2023 11:01:09
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE PG.MT.OFS.FILEUPLD.RTN.SELECT
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_PG.MT.OFS.FILEUPLD.RTN.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_BATCH.FILES
    
    GOSUB CTRL.LST
    GOSUB SEL.FILES
RETURN
*--------------------------------------------------------------------------------
CTRL.LST:
    IF NOT(CONTROL.LIST) THEN
        CONTROL.LIST = "REVIEW"
        CONTROL.LIST<-1>="NONREVIEW"
    END
RETURN
*---------------------------------------------------------------------------------
SEL.FILES:
*
    Y.VIEW = CONTROL.LIST<1,1>
*
    BEGIN CASE
        CASE Y.VIEW EQ "REVIEW"
            GOSUB REVIEW.FILES
        CASE Y.VIEW EQ "NONREVIEW"
            GOSUB NONREVIEW.FILES
    END CASE
RETURN
*-----------------------------------------------------------------------------------
REVIEW.FILES:
*
    F.DIR = "C:\Users\Saicharan\Desktop\t24"
    F.FILENAME = "REVIEW_EMPDETAILS_FILEUPLOAD_2022.csv"
*
    OPEN F.DIR TO F.PATH THEN
        CRT "REVIEW FILE OPENED"
    END
*
    READ Y.ID FROM F.PATH,F.FILENAME THEN
        CRT Y.ID
*
        Y.FLAG = 1
        LOOP
            REMOVE Y.SEL.ID FROM Y.ID SETTING Y.POS
        WHILE Y.SEL.ID:Y.POS
            IF Y.FLAG NE "1" THEN
                Y.C<-1> = Y.SEL.ID
*GOSUB Y.BUILD
            END
            Y.FLAG += 1
        REPEAT
        GOSUB Y.BUILD
    END
RETURN
*-----------------------------------------------------------------------------------
NONREVIEW.FILES:
    F.DIR = "C:\Users\Saicharan\Desktop\t24"
    F.NAME = "NONREVIEW_EMPDETAILS_UPLOAD_20.csv"
*
    OPEN F.DIR TO F.PATH THEN
        CRT "FILE OPENED"
    END
*
    READ Y.NON.ID FROM F.PATH,F.NAME THEN
        CRT Y.NON.ID
    END
    Y.FLG = 1
    LOOP
        REMOVE Y.NRV.ID FROM Y.NON.ID SETTING NRV.POS
    WHILE Y.NRV.ID:NRV.POS
        IF Y.FLG NE "1" THEN
            Y.C<-1> = Y.NRV.ID
        END
        Y.FLG += 1
    REPEAT
    GOSUB Y.BUILD
RETURN
*-------------------------------------------------------------------------------------
Y.BUILD:
    CALL BATCH.BUILD.LIST("",Y.C)
    Y.STRING = Y.C
RETURN
*--------------------------------------------------------------------------------------
END