* @ValidationCode : Mjo5MDkzMDY2NTk6Q3AxMjUyOjE2NzMyNjQ2NTE4MDI6U2FpY2hhcmFuOi0xOi0xOjA6MDp0cnVlOk4vQTpSMThfU1AxNy4wOi0xOi0x
* @ValidationInfo : Timestamp         : 09 Jan 2023 17:14:11
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Saicharan
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_SP17.0
*-----------------------------------------------------------------------------
* <Rating>-7</Rating>
*-----------------------------------------------------------------------------
SUBROUTINE PG.H.EMP.DTLS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine PG.H.EMP.DTLS.FIELDS
*
* @author tcoleman@temenos.com
* @stereotype fields template
* @uses Table
* @public Table Creation
* @package infra.eb
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*
* 19/10/07 - EN_10003543
*            New Template changes
*
* 14/11/07 - BG_100015736
*            Exclude routines that are not released
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_DataTypes
*** </region>
*-----------------------------------------------------------------------------
    CALL Table.defineId("TABLE.NAME.ID", T24_String) ;* Define Table id
*-----------------------------------------------------------------------------
    FLDNAME   = "XX.LL.SHORT.NAME"
    FLDLN  = "35.1"
    FLDTYPE   = "A"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "XX.LL.NAME.1"
    FLDLN = "35.1"
    FLDTYPE   = "A"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME = "XX.LL.NAME.2"
    FLDLN = "35"
    FLDTYPE = "A"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "XX.LL.STREET"
    FLDLN = "135"
    FLDTYPE   = "A"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "XX.XX.LL.ADDRESS"
    FLDLN = "250"
    FLDTYPE   = "A"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "DATE.OF.BIRTH"
    FLDLN = "12"
    FLDTYPE<1>= "D"
    FLDTYPE<2>= "1000"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "EMP.AGE"
    FLDLN = "3"
    FLDTYPE<1>= ""
    FLDTYPE<2>= ""
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME    = "EMP.HIRE.DATE"
    FLDLN  = "12"
    FLDTYPE = "D"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME    = "EMP.GROSS.SAL"
    FLDLN  = "18"
    FLDTYPE    = "AMT"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "EMP.NET.SAL"
    FLDLN = "18"
    FLDTYPE   = "AMT"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "GROSS.SAL.IN.WORDS"
    FLDLN = "18"
    FLDTYPE<1>   = ""
    FLDTYPE<3>= "NOINPUT"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "EMP.PHONE.NO"
    FLDLN = "12"
    FLDTYPE<1> = ""
    FLDTYPE<3>   = ""
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME   = "EMP.DEPARTMENT"
    FLDLN = "4"
    FLDTYPE   = ""
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*
    FLDNAME    = "EMP.INFO.FLAG"
    FLDLN  = "40"
    FLDTYPE = "ANY"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
    
    FLDNAME = "HIKE.YEAR"
    FLDLN = "12"
    FLDTYPE = "D"
    CALL Table.addFieldDefinition(FLDNAME, FLDLN, FLDTYPE, "")
*-----------------------------------------------------------------------------
    CALL Table.addReservedField("RESERVED.3")
    CALL Table.addReservedField("RESERVED.2")
    CALL Table.addReservedField("RESERVED.1")
*
    CALL Table.addLocalReferenceField("")
    CALL Table.addOverrideField
*
    CALL Table.setAuditPosition ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END