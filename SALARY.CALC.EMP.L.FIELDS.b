* @ValidationCode : MjotMzgwMDM1NDk5OkNwMTI1MjoxNjcyNzI3ODc4NTA4OlNhaWNoYXJhbjotMTotMTowOjA6dHJ1ZTpOL0E6UjE4X1NQMTcuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 03 Jan 2023 12:07:58
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
SUBROUTINE SALARY.CALC.EMP.L.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine SALARY.CALC.EMP.L.FIELDS
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
* CALL Table.addField(fieldName, fieldType, args, neighbour) ;* Add a new fields
* CALL Field.setCheckFile(fileName)        ;* Use DEFAULT.ENRICH from SS or just field 1
* CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour) ;* Add a new field
* CALL Table.addFieldWithEbLookup(fieldName,virtualTableName,neighbour) ;* Specify Lookup values
* CALL Field.setDefault(defaultValue) ;* Assign default value
*-----------------------------------------------------------------------------

    FLD.NM = "DATE.OF.BIRTH"
    FLD.LNGTH = "12"
    FLD.TYPE = "D"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "EMP.HIRE.DATE"
    FLD.LNGTH = "12"
    FLD.TYPE = "D"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX<SAL.HIKE.YEAR"
    FLD.LNGTH = "4"
    FLD.TYPE = "D"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX-TOTAL.CTC"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX-BASIC.SALARY"
    FLD.LNGTH = 17
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX-HRA"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX-TRANSPORT"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX-CCA"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX-MEDICAL"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX-OTHER.BENEFITS"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")

    FLD.NM = "XX-EMP.PF"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")
    
    FLD.NM = "XX-PROF.TAX"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")
    
    FLD.NM = "XX>COMP.TAX"
    FLD.LNGTH = "17"
    FLD.TYPE = "AMT"
    CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")
* CALL Table.addFieldDefinition(FLD.NM,FLD.LNGTH,FLD.TYPE,"")
*-----------------------------------------------------------------------------
    CALL Table.addReservedField("RESERVED.10")
    CALL Table.addReservedField("RESERVED.9")
    CALL Table.addReservedField("RESERVED.8")
    CALL Table.addReservedField("RESERVED.7")
    CALL Table.addReservedField("RESERVED.6")
    CALL Table.addReservedField("RESERVED.5")
    CALL Table.addReservedField("RESERVED.4")
    CALL Table.addReservedField("RESERVED.3")
    CALL Table.addReservedField("RESERVED.2")
    CALL Table.addReservedField("RESERVED.1")
*-----------------------------------------------------------------------------
    CALL Table.setAuditPosition ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
