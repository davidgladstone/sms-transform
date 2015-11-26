<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/ArrayOfMessage">
      <smses>
        <xsl:attribute name="count">
          <xsl:value-of select="count(Message)"/>
        </xsl:attribute>
        <xsl:for-each select="Message/IsIncoming[text() = 'true']/..">
          <sms protocol="0" type="1" subject="null" toa="null" sc_toa="null" service_centre="null" read="1" status="-1" locked="0">
            <xsl:attribute name="address">
              <xsl:value-of select="Sender" />
            </xsl:attribute>
            <xsl:attribute name="body">
              <xsl:value-of select="Body"/>
            </xsl:attribute>
            <xsl:variable name="in_timestamp" select="LocalTimestamp[text()]"/>
            <xsl:variable name="out_timestamp" select="ceiling(($in_timestamp div 10000000 - 11644473600)*1000)"/>
            <xsl:attribute name="date">
              <xsl:value-of select="$out_timestamp"/>
            </xsl:attribute>
            <xsl:attribute name="date_sent">
              <xsl:value-of select="$out_timestamp"/>
            </xsl:attribute>
          </sms>
        </xsl:for-each>
        <xsl:for-each select="Message/IsIncoming[text() = 'false']/..">
          <sms protocol="0" type="2" subject="null" toa="null" sc_toa="null" service_centre="null" read="1" status="-1" locked="0">
            <xsl:attribute name="address">
              <xsl:value-of select="Recepients/string" />
            </xsl:attribute>
            <xsl:attribute name="body">
              <xsl:value-of select="Body"/>
            </xsl:attribute>
            <xsl:variable name="in_timestamp" select="LocalTimestamp[text()]"/>
            <xsl:variable name="out_timestamp" select="ceiling(($in_timestamp div 10000000 - 11644473600)*1000)"/>
            <xsl:attribute name="date">
              <xsl:value-of select="$out_timestamp"/>
            </xsl:attribute>
            <xsl:attribute name="date_sent">
              <xsl:value-of select="$out_timestamp"/>
            </xsl:attribute>
          </sms>
        </xsl:for-each>
      </smses>
    </xsl:template>
</xsl:stylesheet>