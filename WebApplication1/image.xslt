﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

  <xsl:template match="channel">
    <channel>
      <xsl:for-each select="image">
        <image>
          <xsl:attribute name="url">
            <xsl:value-of select="url"/>
          </xsl:attribute>
          </image>
          </xsl:for-each>     
    </channel>
    </xsl:template>
</xsl:stylesheet>
