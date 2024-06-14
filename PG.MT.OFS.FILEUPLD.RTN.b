* @ValidationCode : MjoyODgzMDYwNjpDcDEyNTI6MTY3NDU1MzQ3NDUxNTpTYWljaGFyYW46LTE6LTE6MDowOmZhbHNlOk4vQTpSMThfU1AxNy4wOi0xOi0x
* @ValidationInfo : Timestamp         : 24 Jan 2023 15:14:34
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE PG.MT.OFS.FILEUPLD.RTN(Y.ID)
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_GTS.COMMON
    $INSERT I_PG.MT.OFS.FILEUPLD.RTN.COMMON
    $INSERT I_F.PG.H.EMP.DTLS
*----------------------------------------------------------------------
    T.ID = Y.ID
    Y.SHORT.NAME = FIELD(T.ID,",",1)
    Y.NAME.1 = FIELD(T.ID,",",2)
    Y.STREET = FIELD(T.ID,",",3)
    Y.ADD.1 = FIELD(T.ID,",",4)
    Y.ADD.2 = FIELD(T.ID,",",5)
    Y.ADD.3 = FIELD(T.ID,",",6)
    Y.DOB = FIELD(T.ID,",",7)
    Y.DOJ = FIELD(T.ID,",",8)
    Y.SAL = FIELD(T.ID,'"',2)
    Y.PHONE = FIELD(T.ID,",",11)
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
    RV.REC<CH.I.ADDRESS> =Y.ADD.1:Y.ADD.2:Y.ADD.3
    
    Y.A.DOB = FIELD(Y.DOB,"/",1)
    Y.B.DOB = FIELD(Y.DOB,"/",2)
    Y.C.DOB = FIELD(Y.DOB,"/",3)
*
    IF LEN(Y.A.DOB) EQ "1" THEN
        Y.A.DOB = "0":Y.A.DOB
    END
*
    IF LEN(Y.B.DOB) EQ "1" THEN
        Y.B.DOB = "0":Y.B.DOB
    END
*
    H.DOB = Y.C.DOB:Y.B.DOB:Y.A.DOB
    RV.REC<CH.I.DATE.OF.BIRTH> =H.DOB
    Y.A.DOJ = FIELD(Y.DOJ,"/",1)
    Y.B.DOJ = FIELD(Y.DOJ,"/",2)
    Y.C.DOJ = FIELD(Y.DOJ,"/",3)
    
    IF LEN(Y.A.DOJ) EQ "1" THEN
        Y.A.DOJ = "0":Y.A.DOJ
    END
*
    IF LEN(Y.B.DOJ) EQ "1" THEN
        Y.B.DOJ = "0":Y.B.DOJ
    END
    H.DOJ = Y.C.DOJ:Y.B.DOJ:Y.A.DOJ
    RV.REC<CH.I.EMP.HIRE.DATE> =H.DOJ
    CONVERT '"' TO '' IN Y.SAL
    CONVERT "," TO "" IN Y.SAL
    RV.REC<CH.I.EMP.GROSS.SAL> =Y.SAL
    
    Y.A.PHONE = FIELD(Y.PHONE,"-",1)
    Y.B.PHONE = FIELD(Y.PHONE,"-",2)
    
    RV.REC<CH.I.EMP.PHONE.NO> =Y.A.PHONE:Y.B.PHONE
    RV.REC<CH.I.EMP.INFO.FLAG> =Y.FLAG
    OFS.SOURCE.ID = "PG.OFS.SRC"

*Y.LAGA = 1
    BEGIN CASE
        CASE Y.FLAG EQ "RV_FILE_UPLOAD"
            GOSUB RV.UPD
        CASE Y.FLAG EQ "NONRV_FILE_UPLOAD"
            GOSUB NRV.UPD
    END CASE
RETURN
*---------------------------------------------------------------------------------------------------
RV.UPD:
    DEBUG
    RV.PROC = "PROCESS"
*LOOP
    CALL OFS.BUILD.RECORD(APP.NAME,RV.FUN,RV.PROC,VER.NAME,RV.GTS,RV.AUTH,RV.ID,RV.REC,RV.STRING)
    BRV.STRING<-1> = RV.STRING
*
    Y.STG.ID<-1> = T.ID
*REPEAT
*
*MV.ID<-1> = M.ID
*IF
*   Y.LAG += Y.LAGA
*Y.ARRAY = Y.STRING<1,Y.LAGA>
    Y.V.ID = COUNT(Y.STG.ID,",")
    Y.V.STRING = COUNT(Y.STRING,",")
*
    IF Y.V.ID EQ Y.V.STRING THEN
        CALL OFS.CALL.BULK.MANAGER(OFS.SOURCE.ID,BRV.STRING,RV.RESP,RV.TXN)
    END
*CALL JOURNAL.UPDATE("")
RETURN
*---------------------------------------------------------------------------------------------------
NRV.UPD:
    DEBUG
    RV.PROC = "VALIDATE"
    CALL OFS.BUILD.RECORD(APP.NAME,RV.FUN,RV.PROC,VER.NAME,RV.GTS,RV.AUTH,RV.ID,RV.REC,NRV.STRING)
    CALL OFS.GLOBUS.MANAGER(OFS.SOURCE.ID,NRV.STRING)
    Y.OFS.RES = FIELD(NRV.STRING,",",1)
    Y.RES = FIELD(Y.OFS.RES,"/",1)
    IF Y.RES EQ "1" THEN
         
        GOSUB PROC.UPD
    END
RETURN
*----------------------------------------------------------------------------------------------------
PROC.UPD:
    CALL OFS.POST.MESSAGE(NRV.STRING,Y.OFS.MSG,OFS.SOURCE.ID,Y.OPTS)
RETURN
END