<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#"  
	exclude-result-prefixes="sml swe gml exslt geonet xlink rdf ns2 rdfs skos xs"
  version="2.0">
  
  <xsl:template name="metadata-fop-foaf">
    <xsl:param name="schema"/>

		<xsl:call-template name="blockElementFop">
			<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/siteIdentification"/>
			<xsl:with-param name="block">

			<!-- Metadata identifier -->
     	<xsl:apply-templates mode="simpleElementFop-foaf" select="sml:member/sml:System/sml:identification/sml:IdentifierList/sml:identifier[@name='GeoNetwork-UUID' or @name=$ogcID]">
				<xsl:with-param name="schema" select="$schema"/>
				<xsl:with-param name="id" select="'GeoNetwork-UUID'"/>
			</xsl:apply-templates>
   	 
			<!-- Effective date -->
      <xsl:apply-templates mode="simpleElementFop" select="sml:member/sml:System/sml:validTime/gml:TimeInstant/gml:timePosition">
				<xsl:with-param name="schema" select="$schema"/>
			</xsl:apply-templates>
	
			<!-- Abstract -->
     	<xsl:apply-templates mode="simpleElementFop-foaf"
      		select="sml:member/sml:System/gml:description">
				<xsl:with-param name="schema" select="$schema"/>
				<xsl:with-param name="id"     select="'abstract'"/>
			</xsl:apply-templates>

			<!-- Site Status -->
     	<xsl:apply-templates mode="simpleElementFop-foaf"
      	select="sml:member/sml:System//sml:capabilities/swe:DataRecord/swe:field[@name='siteStatus']">
				<xsl:with-param name="schema" select="$schema"/>
				<xsl:with-param name="id"     select="'siteStatus'"/>
			</xsl:apply-templates>

			<!-- Contact Information -->
			<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:contact/sml:ContactList/sml:member/sml:ResponsibleParty|sml:member/sml:System/sml:contact/sml:ResponsibleParty">
				<xsl:with-param name="schema" select="$schema"/>
			</xsl:apply-templates>

			<!-- InputList -->
			<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:inputs/sml:InputList">
				<xsl:with-param name="schema" select="$schema"/>
			</xsl:apply-templates>
	
			<!-- Point location of sensor site -->
			<xsl:call-template name="blockElementFop">
				<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/pointLocation"/>
				<xsl:with-param name="block">

					<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:position/swe:Position">
						<xsl:with-param name="schema" select="$schema"/>
						<xsl:with-param name="suffix" select="'site'"/>
					</xsl:apply-templates>
				</xsl:with-param>
   		</xsl:call-template> 

			<!-- Observed bounding box of site -->
			<xsl:call-template name="blockElementFop">
				<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/observationBoundingBox"/>
				<xsl:with-param name="block">

					<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:capabilities/swe:DataRecord/swe:field[@name='observedBBOX']/swe:Envelope/*/swe:Vector/swe:coordinate">
						<xsl:with-param name="schema" select="$schema"/>
						<xsl:with-param name="suffix" select="'site'"/>
					</xsl:apply-templates>
				</xsl:with-param>
   		</xsl:call-template> 

			<!-- Event History of site -->
			<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:history/sml:EventList/sml:member/sml:Event">
				<xsl:with-param name="schema" select="$schema"/>
			</xsl:apply-templates>

			<!-- Documents relating to/about site -->
			<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:documentation/sml:DocumentList/sml:member/sml:Document">
				<xsl:with-param name="schema" select="$schema"/>
			</xsl:apply-templates>

			<!-- IdentifierList -->
			<xsl:call-template name="blockElementFop">
				<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/identifiers"/>
				<xsl:with-param name="block">
					<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:identification/sml:IdentifierList/sml:identifier[@name!='GeoNetwork-UUID' and @name!=$ogcID]">
						<xsl:with-param name="schema" select="$schema"/>
					</xsl:apply-templates>
				</xsl:with-param>
   		</xsl:call-template> 

			<!-- ClassifierList -->
			<xsl:call-template name="blockElementFop">
				<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/classifiers"/>
				<xsl:with-param name="block">
					<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:classification/sml:ClassifierList/sml:classifier">
						<xsl:with-param name="schema" select="$schema"/>
					</xsl:apply-templates>
				</xsl:with-param>
   		</xsl:call-template> 

			<!-- Keywords -->
			<xsl:call-template name="blockElementFop">
				<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/keywords"/>
				<xsl:with-param name="block">
					<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:keywords/sml:KeywordList/sml:keyword">
						<xsl:with-param name="schema" select="$schema"/>
					</xsl:apply-templates>
				</xsl:with-param>
   		</xsl:call-template> 

			<!-- Component sensors deployed at this site -->
			<xsl:apply-templates mode="foaf-fop" select="sml:member/sml:System/sml:components/sml:ComponentList/sml:component/sml:Component">
				<xsl:with-param name="schema" select="$schema"/>
			</xsl:apply-templates>

		</xsl:with-param>
   </xsl:call-template> <!-- siteIdentification -->

  </xsl:template>

	<!-- =================================================================== -->
	
	<!-- not needed at present - but useful for adding a gap where required to
	     vertically space blocks -->
	<xsl:template name="add-gap">
		<fo:table-row height=".3cm">
			<fo:table-cell>
				<fo:block/>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template name="bboxId">
		<xsl:param name="suffix"/>

		<xsl:choose>
			<xsl:when test="(@name='easting' or @name='longitude') and ancestor::swe:lowerCorner">
				<xsl:value-of select="concat('w_',$suffix)"/>
			</xsl:when>
			<xsl:when test="(@name='northing' or @name='latitude') and ancestor::swe:lowerCorner">
				<xsl:value-of select="concat('s_',$suffix)"/>
			</xsl:when>
			<xsl:when test="(@name='easting' or @name='longitude') and ancestor::swe:upperCorner">
				<xsl:value-of select="concat('e_',$suffix)"/>
			</xsl:when>
			<xsl:when test="(@name='northing' or @name='latitude') and ancestor::swe:upperCorner">
				<xsl:value-of select="concat('n_',$suffix)"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template name="handleTerm">
		<xsl:param name="schema"/>

    <xsl:apply-templates mode="simpleElementFop" select="sml:Term/sml:value">
			<xsl:with-param name="schema" select="$schema"/>
			<xsl:with-param name="title">
				<xsl:call-template name="getTitle-foaf">
					<xsl:with-param name="name"   select="name()"/>
					<xsl:with-param name="schema" select="$schema"/>
					<xsl:with-param name="id"     select="@name"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="text">
				<xsl:value-of select="sml:Term/sml:value"/><xsl:text>&#10;</xsl:text>
				<xsl:if test="normalize-space(sml:Term/@definition)!='' and normalize-space(sml:Term/sml:codeSpace/@xlink:href)!=''">
     			<xsl:value-of select="concat(/root/gui/schemas/foaf/strings/term,': ',sml:Term/@definition)"/><xsl:text>&#10;</xsl:text>
     			<xsl:value-of select="concat(/root/gui/schemas/foaf/strings/thesaurus,': ',sml:Term/sml:codeSpace/@xlink:href)"/><xsl:text>&#10;</xsl:text>
   			</xsl:if> 
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template name="handleObservableProperty">
		<xsl:param name="schema"/>

    <xsl:apply-templates mode="simpleElementFop" select="swe:ObservableProperty">
			<xsl:with-param name="schema" select="$schema"/>
			<xsl:with-param name="title">
				<xsl:call-template name="getTitle-foaf">
					<xsl:with-param name="name"   select="name()"/>
					<xsl:with-param name="schema" select="$schema"/>
					<xsl:with-param name="id"     select="'observedPhenomenon'"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="text">
				<xsl:value-of select="@name"/><xsl:text>&#10;</xsl:text>
				<xsl:if test="normalize-space(swe:ObservableProperty/@definition)!='' and normalize-space(@xlink:href)!=''">
     			<xsl:value-of select="concat(/root/gui/schemas/foaf/strings/term,': ',swe:ObservableProperty/@definition)"/><xsl:text>&#10;</xsl:text>
     			<xsl:value-of select="concat(/root/gui/schemas/foaf/strings/thesaurus,': ',@xlink:href)"/><xsl:text>&#10;</xsl:text>
   			</xsl:if> 
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<!-- =================================================================== -->

	<!-- template to help with putting in simpleElements from foaf -->
  <xsl:template mode="simpleElementFop-foaf" match="*|@*">
		<xsl:param name="name" select="name()"/>
		<xsl:param name="schema"/>
		<xsl:param name="id"/>

		<xsl:message>Doing <xsl:value-of select="name()"/> ID: <xsl:value-of select="$id"/></xsl:message>

		<xsl:apply-templates mode="simpleElementFop" select=".">
			<xsl:with-param name="schema" select="$schema"/>
			<xsl:with-param name="title">
				<xsl:call-template name="getTitle-foaf">
			 		<xsl:with-param name="name"   select="$name"/>
					<xsl:with-param name="schema" select="$schema"/>
					<xsl:with-param name="id"     select="$id"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="text" select="normalize-space(string())"/>
    </xsl:apply-templates>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="sml:InputList">
		<xsl:param name="schema"/>

		<xsl:call-template name="blockElementFop">
			<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/inputs"/>
			<xsl:with-param name="block">
				<xsl:for-each select="sml:input">
					<xsl:call-template name="handleObservableProperty">
						<xsl:with-param name="schema" select="$schema"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:with-param>
   	</xsl:call-template> 
	</xsl:template> 

	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="sml:ResponsibleParty">
		<xsl:param name="schema"/>

		<xsl:call-template name="blockElementFop">
			<xsl:with-param name="label">
				<xsl:call-template name="getTitle-foaf">
					<xsl:with-param name="name"   select="'sml:contact'"/>
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="block">

     		<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:individualName">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

     		<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:organizationName">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

     		<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:positionName">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

     		<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:contactInfo/sml:phone/sml:voice">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

     		<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:contactInfo/sml:phone/sml:facsimile">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:contactInfo/sml:address/sml:deliveryPoint">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:contactInfo/sml:address/sml:city">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:contactInfo/sml:address/sml:administrativeArea">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:contactInfo/sml:address/sml:postalCode">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:contactInfo/sml:address/sml:country">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:contactInfo/sml:address/sml:electronicMailAddress">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
						select="sml:contactInfo/sml:onlineResource/@xlink:href">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
						select="sml:contactInfo/sml:hoursOfService">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

 				<xsl:apply-templates mode="simpleElementFop-foaf"
						select="sml:contactInfo/sml:contactInstructions">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="swe:Position">
		<xsl:param name="schema"/>
		<xsl:param name="suffix"/>
		
   	<xsl:apply-templates mode="simpleElementFop-foaf"
    			select="@referenceFrame">
			<xsl:with-param name="schema" select="$schema"/>
		</xsl:apply-templates>

   	<xsl:for-each	select="swe:location/swe:Vector/swe:coordinate">
   		<xsl:apply-templates mode="simpleElementFop-foaf"
      				select="swe:Quantity/swe:value">
				<xsl:with-param name="name"   select="name()"/>
				<xsl:with-param name="schema" select="$schema"/>
				<xsl:with-param name="id"     select="concat(@name,'_',$suffix)"/>
			</xsl:apply-templates>
		</xsl:for-each>

	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="swe:coordinate">
		<xsl:param name="schema"/>
		<xsl:param name="suffix"/>
		
   	<xsl:apply-templates mode="simpleElementFop-foaf" select="swe:Quantity/swe:value">
			<xsl:with-param name="name"   select="name()"/>
			<xsl:with-param name="schema" select="$schema"/>
			<xsl:with-param name="id">
				<xsl:call-template name="bboxId">
					<xsl:with-param name="suffix" select="$suffix"/>
				</xsl:call-template>
			</xsl:with-param>
		</xsl:apply-templates>

	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="sml:Event">
		<xsl:param name="schema"/>

		<xsl:call-template name="blockElementFop">
			<xsl:with-param name="label">
				<xsl:call-template name="getTitle-foaf">
					<xsl:with-param name="name"   select="name(..)"/>
					<xsl:with-param name="schema" select="$schema"/>
					<xsl:with-param name="context" select="name(../..)"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="block">
				<!-- event date in sml:date -->
   			<xsl:apply-templates mode="simpleElementFop-foaf"
						select="sml:date">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

				<!-- event description in gml:description -->
     		<xsl:apply-templates mode="simpleElementFop-foaf"
							select="gml:description">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

				<!-- event classifiers in sml:classification -->
				<!-- FIXME: apply-templates using sml:classifier -->
				<xsl:for-each select="sml:classification/sml:ClassifierList/sml:classifier">
					<xsl:call-template name="handleTerm">
						<xsl:with-param name="schema" select="$schema"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="sml:Component">
		<xsl:param name="schema"/>

		<xsl:call-template name="blockElementFop">
			<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/component"/>
			<xsl:with-param name="block">

				<xsl:variable name="link" select="normalize-space(../@xlink:href)"/>
				<xsl:choose>
					<xsl:when test="$link!=''">
   					<xsl:apply-templates mode="simpleElementFop-foaf" select="../@xlink:href">
							<xsl:with-param name="schema" select="$schema"/>
						</xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<!-- sensor description in gml:description -->
     				<xsl:apply-templates mode="simpleElementFop-foaf"
									select="gml:description">
							<xsl:with-param name="schema" select="$schema"/>
						</xsl:apply-templates>

						<!-- Sensor Status -->
     				<xsl:apply-templates mode="simpleElementFop-foaf"
      				select="sml:capabilities/swe:DataRecord/swe:field[@name='sensorStatus']">
							<xsl:with-param name="schema" select="$schema"/>
							<xsl:with-param name="id"     select="'sensorStatus'"/>
						</xsl:apply-templates>

						<!-- IdentifierList -->
						<xsl:call-template name="blockElementFop">
							<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/identifiers"/>
							<xsl:with-param name="block">
								<xsl:apply-templates mode="foaf-fop" select="sml:identification/sml:IdentifierList/sml:identifier">
									<xsl:with-param name="schema" select="$schema"/>
								</xsl:apply-templates>
							</xsl:with-param>
   					</xsl:call-template> 

						<!-- ClassifierList -->
						<xsl:call-template name="blockElementFop">
							<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/classifiers"/>
							<xsl:with-param name="block">
								<xsl:apply-templates mode="foaf-fop" select="sml:classification/sml:ClassifierList/sml:classifier">
									<xsl:with-param name="schema" select="$schema"/>
								</xsl:apply-templates>
							</xsl:with-param>
   					</xsl:call-template> 

						<!-- Keywords -->
						<xsl:call-template name="blockElementFop">
							<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/keywords"/>
							<xsl:with-param name="block">
								<xsl:apply-templates mode="foaf-fop" select="sml:keywords/sml:KeywordList/sml:keyword">
									<xsl:with-param name="schema" select="$schema"/>
								</xsl:apply-templates>
							</xsl:with-param>
   					</xsl:call-template> 

						<!-- Point location of sensor -->
						<xsl:call-template name="blockElementFop">
							<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/pointLocation"/>
							<xsl:with-param name="block">
			
								<xsl:apply-templates mode="foaf-fop" select="sml:position/swe:Position">
									<xsl:with-param name="schema" select="$schema"/>
									<xsl:with-param name="suffix" select="'sensor'"/>
								</xsl:apply-templates>
							</xsl:with-param>
   					</xsl:call-template> 

						<!-- Observed bounding box of sensor -->
						<xsl:call-template name="blockElementFop">
							<xsl:with-param name="label" select="/root/gui/schemas/foaf/strings/observationBoundingBox"/>
							<xsl:with-param name="block">
			
								<xsl:apply-templates mode="foaf-fop" select="sml:capabilities/swe:DataRecord/swe:field[@name='observedBBOX']/swe:Envelope/*/swe:Vector/swe:coordinate">
									<xsl:with-param name="schema" select="$schema"/>
									<xsl:with-param name="suffix" select="'site'"/>
								</xsl:apply-templates>
							</xsl:with-param>
   					</xsl:call-template> 

					</xsl:otherwise>
				</xsl:choose>

			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template	mode="foaf-fop" match="sml:Document">
		<xsl:param name="schema"/>

		<xsl:call-template name="blockElementFop">
			<xsl:with-param name="label">
				<xsl:call-template name="getTitle-foaf">
					<xsl:with-param name="name"   select="name(..)"/>
					<xsl:with-param name="schema" select="$schema"/>
					<xsl:with-param name="id"     select="../@name"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="block">
				<!-- related document -->
     		<xsl:apply-templates mode="simpleElementFop-foaf"
							select="sml:onlineResource/@xlink:href">
					<xsl:with-param name="schema" select="$schema"/>
					<xsl:with-param name="text">
						<xsl:variable name="value" select="normalize-space(sml:onlineResource/@xlink:href)"/>
						<xsl:choose>
							<xsl:when test="$value!='' and @name='relatedDataset-GeoNetworkUUID'">
								<xsl:value-of select="concat($url,'/',$value)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$value"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:apply-templates>

				<!-- document description in gml:description -->
     		<xsl:apply-templates mode="simpleElementFop-foaf"
						select="gml:description">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>

				<!-- document format in sml:format -->
     		<xsl:apply-templates mode="simpleElementFop-foaf"
						select="sml:format">
					<xsl:with-param name="schema" select="$schema"/>
				</xsl:apply-templates>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="sml:identifier[@name!='GeoNetwork-UUID' and @name!=$ogcID]">
		<xsl:param name="schema"/>

		<xsl:call-template name="handleTerm">
			<xsl:with-param name="schema" select="$schema"/>
		</xsl:call-template>
	</xsl:template> 
	
	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="sml:classifier">
		<xsl:param name="schema"/>

		<xsl:call-template name="handleTerm">
			<xsl:with-param name="schema" select="$schema"/>
		</xsl:call-template>
	</xsl:template>

	<!-- =================================================================== -->

	<xsl:template mode="foaf-fop" match="sml:keyword">
		<xsl:param name="schema"/>

 		<xsl:apply-templates mode="simpleElementFop-foaf" select=".">
			<xsl:with-param name="schema" select="$schema"/>
			<xsl:with-param name="id" select="'siteKeyword'"/>
		</xsl:apply-templates>
	</xsl:template>

</xsl:stylesheet>
