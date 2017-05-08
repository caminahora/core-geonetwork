<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink" 
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#"  
  xmlns:gn="http://www.fao.org/geonetwork"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="#all">

  <xsl:template name="get-foaf-is-service">
    <xsl:value-of
            select="false()"/>
  </xsl:template>
  
  
  <xsl:template name="get-foaf-title">
    <xsl:value-of select="$metadata/foaf:Person/foaf:name"/>
  </xsl:template>

  <xsl:template name="get-foaf-extents-as-json">[  ]
  </xsl:template>
  
  
  <xsl:template name="get-foaf-online-source-config">
    <xsl:param name="pattern"/>
    <config>
      
    </config>
  </xsl:template>

</xsl:stylesheet>
