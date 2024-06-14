* @ValidationCode : MjoxNjUxMzM0MTAyOkNwMTI1MjoxNjc3MDQxNjgzMzAxOlNhaWNoYXJhbjotMTotMTowOjA6dHJ1ZTpOL0E6UjE4X1NQMTcuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 22 Feb 2023 10:24:43
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
SUBROUTINE PG.H.EXTRACTDATA.FIELDS
*-----------------------------------------------------------------------------
*COMPANY NAME : PAGE SOLUTIONS PVT.LTD
*DEVELOPED BY : N SAI CHARAN
*-----------------------------------------------------------------------------
*SUBROUTINE TYPE : TEMPLATE.FIELDS FOR PG.H.EXTRACTDATA
*ATTACHED TO   : N/A
*DEVELOPED FOR : ENTERING APPLICATION NAMES FOR WHICH THE DATA TO BE EXTRACTED
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine PG.H.EXTRACTDATA.FIELDS
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
*
*-----------------------------------------------------------------------------
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
    ID.F = "APPL.ID"
    ID.N = "10"
    ID.T = ""
    ID.T<2> = "SYSTEM"
   
*   CALL Table.defineId("TABLE.NAME.ID", T24_String) ;* Define Table id
*-----------------------------------------------------------------------------


    FLD.NAME = "XX<APPLICATION.NAME"
    FLD.LGTH = "35"
    FLD.TYPE = "ANY"
    CALL Table.addFieldDefinition(FLD.NAME,FLD.LGTH,FLD.TYPE,"")

    FLD.NAME = "XX>XX.FIELD.NAME"
    FLD.LGTH = "35"
    FLD.TYPE = "ANY"
    CALL Table.addFieldDefinition(FLD.NAME,FLD.LGTH,FLD.TYPE,"")

    FLD.NAME = "DELIMITER"
    FLD.LGTH = "3"
    FLD.TYPE = "ANY"
    CALL Table.addFieldDefinition(FLD.NAME,FLD.LGTH,FLD.TYPE,"")

    FLD.NAME = "FILE.FORMAT"
    FLD.LGTH = "10"
    FLD.TYPE = "ANY"
    CALL Table.addFieldDefinition(FLD.NAME,FLD.LGTH,FLD.TYPE,"")
    
*CALL Table.addField(fieldName, fieldType, args, neighbour) ;* Add a new fields
*CALL Field.setCheckFile(fileName)        ;* Use DEFAULT.ENRICH from SS or just field 1
*CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour) ;* Add a new field
*CALL Table.addFieldWithEbLookup(fieldName,virtualTableName,neighbour) ;* Specify Lookup values
*CALL Field.setDefault(defaultValue) ;* Assign default value
*-----------------------------------------------------------------------------
    CALL Table.addReservedField("RESERVED.5")
    CALL Table.addReservedField("RESERVED.4")
    CALL Table.addReservedField("RESERVED.3")
    CALL Table.addReservedField("RESERVED.2")
    CALL Table.addReservedField("RESERVED.1")
    
    CALL Table.setAuditPosition ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
