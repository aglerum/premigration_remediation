<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd"
    exclude-result-prefixes="xs xsi"
    version="2.0">
    
    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    
    <xsl:template match="/">
        <xsl:copy-of select="." copy-namespaces="no"/>
    </xsl:template>
</xsl:stylesheet>