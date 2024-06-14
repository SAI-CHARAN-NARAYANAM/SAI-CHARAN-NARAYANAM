* @ValidationCode : MjotMTM5NDkwMTI3MDpDcDEyNTI6MTY3NTc0NDY0MTE3NzpTYWljaGFyYW46LTE6LTE6MDowOmZhbHNlOk4vQTpSMThfU1AxNy4wOi0xOi0x
* @ValidationInfo : Timestamp         : 07 Feb 2023 10:07:21
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_SP17.0
SUBROUTINE PG.AUTH.SAL.DTLS.UPD
*-----------------------------------------------------------------------------
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.PG.H.EMP.DTLS
    $INSERT I_F.SALARY.CALC.EMP.L
    $INSERT I_F.PG.H.EXTRACTDATA
    
*----------------------------------------------------------------
    GOSUB INIT.FILES
    GOSUB PROCE.FILES
*----------------------------------------------------------------------------
INIT.FILES:
    FN.L.CALC = "F.SALARY.CALC.EMP.L"
    F.L.CALC = ""
    CALL OPF(FN.L.CALC,F.L.CALC)
RETURN
*------------------------------------------------------------------------------------
PROCE.FILES:
   
    Y.ID = ID.NEW
    Y.OLD.SALARY = R.OLD(CH.I.EMP.GROSS.SAL)
    CALL F.READ(FN.L.CALC,Y.ID,Y.REC,F.L.CALC,Y.ERR)
    IF Y.REC EQ "" THEN
        GOSUB Y.UPD
    END ELSE
        GOSUB AMD.UPD
    END
RETURN
*--------------------------------------------------------------------------------------
Y.UPD:
    Y.SALARY = R.NEW(CH.I.EMP.GROSS.SAL)
    Y.H.DTE = R.NEW(CH.I.EMP.HIRE.DATE)
    Y.DOB = R.NEW(CH.I.DATE.OF.BIRTH)
    Y.HIKE.YEAR = R.NEW(CH.I.HIKE.YEAR)
    
    Y.REC<EL.SC.DATE.OF.BIRTH> = Y.DOB
    Y.REC<EL.SC.EMP.HIRE.DATE> = Y.H.DTE
    Y.REC<EL.SC.SAL.HIKE.YEAR> = Y.HIKE.YEAR
    Y.REC<EL.SC.TOTAL.CTC> = (0.001)*(Y.SALARY)
    Y.REC<EL.SC.BASIC.SALARY> = (0.5)*(Y.SALARY)
    Y.REC<EL.SC.HRA>  = (0.2)*(Y.SALARY)
    Y.REC<EL.SC.TRANSPORT> = (0.012)*(Y.SALARY)
    Y.REC<EL.SC.CCA>  = (0.05)*(Y.SALARY)
    Y.REC<EL.SC.MEDICAL> = (0.01)*(Y.SALARY)
    Y.REC<EL.SC.OTHER.BENEFITS> = (0.21)*(Y.SALARY)
    Y.REC<EL.SC.EMP.PF> = (0.015)*(Y.SALARY)
    Y.REC<EL.SC.PROF.TAX> =(0.002)*(Y.SALARY)
    Y.REC<EL.SC.COMP.TAX> =(0.001)*(Y.SALARY)
    CALL F.WRITE(FN.L.CALC,Y.ID,Y.REC)
    
RETURN
*---------------------------------------------------------------------------------------
AMD.UPD:
    
    Y.CNT = DCOUNT(Y.REC,"^")
    Y.L.CNT = Y.CNT+1
    
    Y.SALARY = R.NEW(CH.I.EMP.GROSS.SAL)
    Y.H.DTE = R.NEW(CH.I.EMP.HIRE.DATE)
    Y.DOB = R.NEW(CH.I.DATE.OF.BIRTH)
    Y.HIKE.YEAR = R.NEW(CH.I.HIKE.YEAR)
    
    Y.REC<EL.SC.DATE.OF.BIRTH,Y.L.CNT> = Y.DOB
    Y.REC<EL.SC.EMP.HIRE.DATE,Y.L.CNT> = Y.H.DTE
    Y.REC<EL.SC.SAL.HIKE.YEAR,Y.L.CNT> = Y.HIKE.YEAR
    Y.REC<EL.SC.TOTAL.CTC,Y.L.CNT> = (0.001)*(Y.SALARY)
    Y.REC<EL.SC.BASIC.SALARY,Y.L.CNT> = (0.5)*(Y.SALARY)
    Y.REC<EL.SC.HRA,Y.L.CNT>  = (0.2)*(Y.SALARY)
    Y.REC<EL.SC.TRANSPORT,Y.L.CNT> = (0.012)*(Y.SALARY)
    Y.REC<EL.SC.CCA,Y.L.CNT>  = (0.05)*(Y.SALARY)
    Y.REC<EL.SC.MEDICAL,Y.L.CNT> = (0.01)*(Y.SALARY)
    Y.REC<EL.SC.OTHER.BENEFITS,Y.L.CNT> = (0.21)*(Y.SALARY)
    Y.REC<EL.SC.EMP.PF,Y.L.CNT> = (0.015)*(Y.SALARY)
    Y.REC<EL.SC.PROF.TAX,Y.L.CNT> =(0.002)*(Y.SALARY)
    Y.REC<EL.SC.COMP.TAX,Y.L.CNT> =(0.001)*(Y.SALARY)
    CALL F.WRITE(FN.L.CALC,Y.ID,Y.REC)
    
RETURN
*--------------------------------------------
RETURN
END
