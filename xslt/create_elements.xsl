<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xd xs"
    version="2.0">  
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated: </xd:b>December 25, 2016</xd:p>
            <xd:p><xd:b>Author: </xd:b>Annie Glerum</xd:p>
            <xd:p><xd:b>Organization: </xd:b>Florida State University Libraries</xd:p>
            <xd:p><xd:b>Title: </xd:b>Create Elements</xd:p>
            <xd:p>Transformation of MARCXML to bibliographic element set.</xd:p>
            <xd:p>The result of this transformation is edited for pre-migration processing.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output indent="yes" encoding="UTF-8" method="xml"/>

    <xsl:variable name="institutions" select="document('XML/SUS_codes.xml')/institutions/institution"/>

    <!-- Run this program on the MARCXML without namespaces or schema -->

    <xsl:template match="/collection">
        <records>
            <!-- Selects records that have 500 or 590 fields -->
            <xsl:for-each select="record[datafield[@tag = '500'] or datafield[@tag = '590']]">
                <record>
                    <!-- Aleph BIB number -->
                    <bib>
                        <xsl:value-of select="controlfield[@tag = '001']"/>
                    </bib>
                    <!-- 
                        Note: Test files did not have OCLC number. Production files should have OCLC number.
                        <oclc><xsl:value-of select="oclc"/></oclc>
                    -->
                    <!-- 500 field elements -->
                    <xsl:for-each select="datafield[@tag = '500']">
                        <field>
                            <!-- Field tag -->
                            <tag>
                                <xsl:value-of select="@tag"/>
                            </tag>
                            <!-- Field text -->
                            <text>
                                <xsl:value-of select="subfield[@code = 'a']"/>
                            </text>
                            <codes>
                                <xsl:for-each select="subfield[@code='5']">
                                    <xsl:sort select="." order="ascending"/>
                                    <xsl:variable name="code" select="."/>
                                    <xsl:variable name="institution">
                                        <xsl:for-each select=".">
                                            <xsl:value-of select="$institutions[code=current()]/*[(self::branch)]"/>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <!-- Element name is created from $5 Subfield code  -->
                                    <xsl:element name="{$code}">
                                        <!-- The institution's branch name is the value -->
                                        <xsl:value-of select="$institution"/>
                                    </xsl:element>
                                </xsl:for-each>
                            </codes>
                        </field>
                    </xsl:for-each>
                    <!-- 590 field elements -->
                    <xsl:for-each select="datafield[@tag = '590']">
                        <xsl:variable name="text" select="subfield[@code = 'a']"/>
                        <field>
                            <!-- Field tag -->
                            <tag>
                                <xsl:value-of select="@tag"/>
                            </tag>
                            <!-- Field text -->
                            <text>
                                <!-- This conditional adds the institution's prefix to local notes. Duplicate prefixes are deleted during the review for remediation. -->
                                <xsl:value-of
                                    select="
                                        if (count(subfield[@code = '5']) eq 1) then
                                            concat($institutions[code = current()/subfield[@code = '5']]/*[(self::branch)], ': ', $text)
                                        else
                                            $text"
                                />
                            </text>
                            <codes>
                                <xsl:for-each select="subfield[@code='5']">
                                    <xsl:sort select="." order="ascending"/>
                                    <xsl:variable name="code" select="."/>
                                    <xsl:variable name="institution">
                                        <xsl:for-each select=".">
                                            <xsl:value-of select="$institutions[code=current()]/*[(self::branch)]"/>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <!-- Element name is created from $5 Subfield code  -->
                                    <xsl:element name="{$code}">
                                        <!-- The institution's branch name is the value -->
                                        <xsl:value-of select="$institution"/>
                                    </xsl:element>
                                </xsl:for-each>
                            </codes>
                        </field>
                    </xsl:for-each>
                </record>
            </xsl:for-each>
        </records>
    </xsl:template>
</xsl:stylesheet>
