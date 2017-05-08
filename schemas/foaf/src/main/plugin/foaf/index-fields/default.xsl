<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- ========================================================================================= -->

  <xsl:output method="xml" version="1.0" encoding="UTF-8"
    indent="yes" />

  <!-- ========================================================================================= -->

  <xsl:template match="/">
    <Document>
      <Field name="_locale" string="eng" store="true" index="true" />
      <Field name="_docLocale" string="eng" store="true" index="true" />

      <xsl:apply-templates select="*" mode="metadata" />

      <Field name="any" store="false" index="true" token="true">
        <xsl:attribute name="string">
        <xsl:apply-templates select="." mode="allText" />
      </xsl:attribute>
      </Field>

    </Document>
  </xsl:template>


  <xsl:template match="*" mode="metadata">

    <xsl:for-each select="foaf:Person">

      <xsl:for-each select="foaf:openid">
        <Field name="identifier" string="{normalize-space(string(.))}"
          store="true" index="true" token="false" />
      </xsl:for-each>

      <xsl:for-each select="foaf:name">
        <Field name="title" string="{normalize-space(string(.))}"
          store="true" index="true" token="true" />
        <!-- not tokenized title for sorting -->
        <Field name="_title" string="{normalize-space(string(.))}"
          store="true" index="true" token="false" />
      </xsl:for-each>

    </xsl:for-each>


    <xsl:apply-templates select="*" mode="metadata" />

  </xsl:template>


</xsl:stylesheet>
