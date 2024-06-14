* @ValidationCode : MjoxMDUxNjY0NzM2OkNwMTI1MjoxNjczMzI4NzM3MTU5OlNhaWNoYXJhbjotMTotMTowOjA6ZmFsc2U6Ti9BOlIxOF9TUDE3LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 10 Jan 2023 11:02:17
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE PG.MT.OFS.FILEUPLD.RTN.LOAD
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
    
    FN.PG.H.EMP.DTLS = "F.PG.H.EMP.DTLS"
    F.PG.H.EMP.DTLS = ""
    CALL OPF(FN.PG.H.EMP.DTLS,F.PG.H.EMP.DTLS)

    FN.TSA.SERVICE = "F.TSA.SERVICE"
    F.TSA.SERVICE = ""
    CALL OPF(FN.TSA.SERVICE,F.TSA.SERVICE)
    Y.STRING = ""
    
RETURN
END
