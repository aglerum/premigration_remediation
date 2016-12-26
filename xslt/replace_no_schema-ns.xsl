<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="xs xsi"
    version="2.0">
    
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    
    <!-- Before running this program, replace...
        
        <collection xmlns="http://www.loc.gov/MARC21/slim"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">
            
        With...
        
        <collection
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            
       After running the program, replace...
       
       <collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
       
       
       With...
       
       <collection>
    -->
    
    <!-- Generic identify template -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/collection/record">
        <record><xsl:copy-of select="*"/></record>
    </xsl:template>
    
</xsl:stylesheet>