<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:foaf="http://xmlns.com/foaf/0.1"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:dcat="http://www.w3.org/ns/dcat"
  xmlns:dct="http://purl.org/dc/terms" xmlns:dctype="http://purl.org/dc/dcmitype"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema"
  xmlns:skos="http://www.w3.org/2004/02/skos/core" xmlns:vcard="http://www.w3.org/2006/vcard/ns">


  <xsl:template match="/root">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
