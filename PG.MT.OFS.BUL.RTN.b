* @ValidationCode : MjoxNTY0OTQ4MTg3OkNwMTI1MjoxNjczMzUyMjc3MzI4OlNhaWNoYXJhbjotMTotMTowOjA6ZmFsc2U6Ti9BOlIxOF9TUDE3LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 10 Jan 2023 17:34:37
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE PG.MT.OFS.BUL.RTN
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.TSA.SERVICE
    $INSERT I_PG.MT.OFS.FILEUPLD.RTN.COMMON
    $INSERT I_F.PG.H.EMP.DTLS
 
    GOSUB INIT.FILES
    GOSUB REVIEW.FILES
    GOSUB NONRV.FILES
 
 
 
INIT.FILES:
    FN.PG.H.EMP.DTLS = "F.PG.H.EMP.DTLS"
    F.PG.H.EMP.DTLS = ""
    CALL OPF(FN.PG.H.EMP.DTLS,F.PG.H.EMP.DTLS)

    FN.TSA.SERVICE = "F.TSA.SERVICE"
    F.TSA.SERVICE = ""
    CALL OPF(FN.TSA.SERVICE,F.TSA.SERVICE)
RETURN
REVIEW.FILES:
    
    F.DIR = "C:\Users\Saicharan\Desktop\t24"
    F.FILENAME = "REVIEW_EMPDETAILS_FILEUPLOAD_2022.csv"
*

    OPEN F.DIR TO F.PATH THEN
        CRT "REVIEW FILE OPENED"
    END
*
    READ Y.ID FROM F.PATH,F.FILENAME THEN
*CRT Y.ID
*
        Y.LAGA = 1
        LOOP
            REMOVE Y.SEL.ID FROM Y.ID SETTING Y.POS
        WHILE Y.SEL.ID:Y.POS
            IF Y.LAGA NE "1" THEN
                Y.C = Y.SEL.ID
                GOSUB Y.BUILD
            END
            Y.LAGA += 1
        REPEAT
        DEBUG
        CALL OFS.CALL.BULK.MANAGER(OFS.SOURCE.ID,BRV.STRING,RV.RESP,RV.TXN)
    END
RETURN
*
NONRV.FILES:
    F.DIRT = "C:\Users\Saicharan\Desktop\t24"
    F.NAME = "NONREVIEW_EMPDETAILS_UPLOAD_20.csv"
*
    OPEN F.DIRT TO F.PATH THEN
        CRT "NONRV FILE OPENED"
    END
*
    READ Y.NON.ID FROM F.PATH,F.NAME THEN
*     CRT Y.NON.ID
   
        Y.FLG = 1
        LOOP
            REMOVE Y.NRV.ID FROM Y.NON.ID SETTING NRV.POS
        WHILE Y.NRV.ID:NRV.POS
            IF Y.FLG NE "1" THEN
                Y.C = Y.NRV.ID
                GOSUB Y.BUILD
            END
            Y.FLG += 1
        REPEAT
    END
RETURN

Y.BUILD:
    T.ID = Y.C
    Y.SHORT.NAME = FIELD(T.ID,",",1)
    Y.NAME.1 = FIELD(T.ID,",",2)
    Y.STREET = FIELD(T.ID,",",3)
    Y.ADD.1 = FIELD(T.ID,",",4)
    Y.ADD.2 = FIELD(T.ID,",",5)
    Y.ADD.3 = FIELD(T.ID,",",6)
    Y.DOB = FIELD(T.ID,",",7)
    Y.A.DOB = FIELD(Y.DOB,"/",1)
    Y.B.DOB = FIELD(Y.DOB,"/",2)
    Y.C.DOB = FIELD(Y.DOB,"/",3)
    IF LEN(Y.A.DOB) EQ "1" THEN
        Y.A.DOB = "0":Y.A.DOB
    END
*
    IF LEN(Y.B.DOB) EQ "1" THEN
        Y.B.DOB = "0":Y.B.DOB
    END
*
    Y.DOB = Y.C.DOB:Y.B.DOB:Y.A.DOB
    Y.DOJ = FIELD(T.ID,",",8)
    Y.A.DOJ = FIELD(Y.DOJ,"/",1)
    Y.B.DOJ = FIELD(Y.DOJ,"/",2)
    Y.C.DOJ = FIELD(Y.DOJ,"/",3)
    Y.DOJ = Y.C.DOJ:Y.B.DOJ:Y.A.DOJ
    Y.SAL = FIELD(T.ID,'"',2)
    CONVERT '"' TO '' IN Y.SAL
    CONVERT "," TO "" IN Y.SAL
    Y.PHONE = FIELD(T.ID,",",11)
    Y.A.PHONE = FIELD(Y.PHONE,"-",1)
    Y.B.PHONE = FIELD(Y.PHONE,"-",2)
    Y.MAIL = FIELD(T.ID,",",12)
    Y.FLAG = FIELD(T.ID,",",13)

*
    APP.NAME = "PG.H.EMP.DTLS"
    VER.NAME = "PG.H.EMP.DTLS,EMP.INPUT"
    RV.FUN = "I"
    RV.GTS = ""
    RV.AUTH = ""
*
    RV.ID = ""
    RV.REC<CH.I.SHORT.NAME> = Y.SHORT.NAME
    RV.REC<CH.I.NAME.1> =Y.NAME.1
    RV.REC<CH.I.STREET> =Y.STREET
    RV.REC<CH.I.ADDRESS> =Y.ADD.1:Y.ADD.2
    RV.REC<CH.I.DATE.OF.BIRTH> =Y.DOB
    RV.REC<CH.I.EMP.HIRE.DATE> =Y.DOJ
    RV.REC<CH.I.EMP.GROSS.SAL> =Y.SAL
    RV.REC<CH.I.EMP.PHONE.NO> =Y.A.PHONE:Y.B.PHONE
    RV.REC<CH.I.EMP.INFO.FLAG> =Y.FLAG
    OFS.SOURCE.ID = "PG.OFS.SRC"


    BEGIN CASE
        CASE Y.FLAG EQ "RV_FILE_UPLOAD"
            GOSUB RV.UPD
        CASE Y.FLAG EQ "NONRV_FILE_UPLOAD"
            GOSUB NRV.UPD
    END CASE
RETURN
*---------------------------------------------------------------------------------------------------
RV.UPD:
    
    RV.PROC = "PROCESS"
    CALL OFS.BUILD.RECORD(APP.NAME,RV.FUN,RV.PROC,VER.NAME,RV.GTS,RV.AUTH,RV.ID,RV.REC,RV.STRING)

    BRV.STRING<-1> = RV.STRING
    
*CALL OFS.CALL.BULK.MANAGER(OFS.SOURCE.ID,RV.STRING,RV.RESP,RV.TXN)
*CALL JOURNAL.UPDATE("")
RETURN
*---------------------------------------------------------------------------------------------------
NRV.UPD:
    DEBUG
    RV.PROC = "VALIDATE"
    CALL OFS.BUILD.RECORD(APP.NAME,RV.FUN,RV.PROC,VER.NAME,RV.GTS,RV.AUTH,RV.ID,RV.REC,NRV.STRING)
    CALL OFS.GLOBUS.MANAGER(RV.OFS.SOURCE,NRV.STRING)
    Y.OFS.RES = FIELD(NRV.STRING,",",1)
    Y.RES = FIELD(Y.OFS.RES,"/",1)
    IF Y.RES EQ "1" THEN
*GOSUB PROC.UPD
        CALL OFS.POST.MESSAGE(NRV.STRING,OFS.MESSAGE.ID,RV.OFS.SOURCE,Y.OPTIONS)
    END
RETURN
*
*PROC.UPD:
*   CALL OFS.POST.MESSAGE(NRV.STRING,OFS.MESSAGE.ID,RV.OFS.SOURCE,Y.OPTIONS)
RETURN
END