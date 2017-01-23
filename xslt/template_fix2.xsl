<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd"   
    exclude-result-prefixes="xd xs xsi" 
    version="2.0">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>January 22, 2017</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>Template Fix</xd:p>
            <xd:p>Run this transformation on the result template_fix2.xsl.</xd:p>
            <xd:p>This transformation swaps institution name for code.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output indent="yes" encoding="UTF-8" method="xml"/>
    <xsl:variable name="institutions" select="document('../xml/SUS_codes.xml')/institutions/institution"/>
    <!-- Generic identify template -->
        <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- This swaps the institution name for the institution code in SUS_codes.xml. -->
    <xsl:template match="/*/*/*/marc:subfield[@code = '5']">
        <marc:subfield code="5">
            <xsl:value-of select="$institutions[branch = current()]/*[(self::code)]"/>
        </marc:subfield>
    </xsl:template>
</xsl:stylesheet>
