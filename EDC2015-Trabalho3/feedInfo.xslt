<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="xml" indent="yes"/>
  <xsl:template match="channel">
    <feedinfo>
      <feed>
          <xsl:attribute name="title">
            <xsl:value-of select="title"/>
          </xsl:attribute>
          <xsl:attribute name="link">
            <xsl:value-of select="link"/>
          </xsl:attribute>
          <xsl:attribute name="description">
            <xsl:value-of select="description"/>
          </xsl:attribute>
          <xsl:attribute name="language">
            <xsl:value-of select="language"/>
          </xsl:attribute>
          <xsl:if test="pubDate">
          <xsl:attribute name="pubDate">
            <xsl:value-of select="pubDate"/>
          </xsl:attribute>
          </xsl:if>
          <xsl:if test="lastBuildDate">
          <xsl:attribute name="lastBuildDate">
            <xsl:value-of select="lastBuildDate"/>
          </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="category">
            <xsl:value-of select="category"/>
          </xsl:attribute>
      </feed>
    </feedinfo>
  </xsl:template>
</xsl:stylesheet>
