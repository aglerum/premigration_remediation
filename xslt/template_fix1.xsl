<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd"
    xmlns="http://www.loc.gov/MARC21/slim" 
    exclude-result-prefixes="xd xs xsi" 
    version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 22, 2017</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>Template Fix 1</xd:p>
            <xd:p>Run this transformation on the result of the OpenReine MARC template.</xd:p>
            <xd:p>This transformation deletes subfields with 'null' values.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output indent="yes" encoding="UTF-8" method="xml"/>
    <!-- This deletes the space left by deleting the subfields with null. -->
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="institutions" select="document('../xml/SUS_codes.xml')/institutions/institution"/>

    <!-- Generic identify template -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="./*[text() = 'null']"/>
    
</xsl:stylesheet>
