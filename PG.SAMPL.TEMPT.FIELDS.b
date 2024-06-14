* @ValidationCode : Mjo1MjI5NDYxODg6Q3AxMjUyOjE2ODY1NzE0MTM2NTE6U2FpY2hhcmFuOi0xOi0xOjA6MDp0cnVlOk4vQTpSMThfU1AxNy4wOi0xOi0x
* @ValidationInfo : Timestamp         : 12 Jun 2023 17:33:33
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
SUBROUTINE PG.SAMPL.TEMPT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine PG.SAMPL.TEMPT.FIELDS
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
    CALL Table.defineId("SAMPLE.ID", T24_String) ;* Define Table id
*-----------------------------------------------------------------------------
*    CALL Table.addField(fieldName, fieldType, args, neighbour) ;* Add a new fields
*    CALL Field.setCheckFile(fileName)        ;* Use DEFAULT.ENRICH from SS or just field 1
*    CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour) ;* Add a new field
*    CALL Table.addFieldWithEbLookup(fieldName,virtualTableName,neighbour) ;* Specify Lookup values
*    CALL Field.setDefault(defaultValue) ;* Assign default value

    fieldName = "SAMPL.1"
    fieldLength = "15"
    fieldType = "A"
    neighbour = ""
    CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour)
    
    fieldName = "SAMPL.2"
    fieldLength = "15"
    fieldType = "A"
    neighbour = ""
    CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour)
    
    fieldName = "XX<SAMPL.3"
    fieldLength = "15"
    fieldType = "A"
    neighbour = ""
    CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour)
    
    fieldName = "XX-SAMPL.4"
    fieldLength = "15"
    fieldType = "A"
    neighbour = ""
    CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour)
   
    fieldName = "XX.SAMPL.5"
    fieldLength = "15"
    fieldType = "A"
    neighbour = ""
    CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour)
    
    fieldName = "XX>SAMPL.6"
    fieldLength = "15"
    fieldType = "A"
    neighbour = ""
    CALL Table.addFieldDefinition(fieldName, fieldLength, fieldType, neighbour)
    
    CALL Table.addLocalReferenceField("")
*-----------------------------------------------------------------------------
    CALL Table.setAuditPosition ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
