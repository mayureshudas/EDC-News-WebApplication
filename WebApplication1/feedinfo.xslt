<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

      <xsl:template match="channel">
        <feedinfo>
          <xsl:for-each select="item">
            <title> 
                <xsl:attribute name="title">
                  <xsl:value-of select="title"/>
                </xsl:attribute>
                <xsl:attribute name="description">
                  <xsl:value-of select="substring-before(description, 'img')"/>
                </xsl:attribute>
              <xsl:attribute name="link">
                <xsl:value-of select="link"/>
              </xsl:attribute>
              <xsl:attribute name="category">
                <xsl:value-of select="category"/>
              </xsl:attribute>
              <xsl:attribute name="Date">
                <xsl:value-of select="pubDate"/>
              </xsl:attribute>
            </title>
          </xsl:for-each>
        </feedinfo>
    </xsl:template>
</xsl:stylesheet>
