<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:dc="http://purl.org/dc/elements/1.1/">
	<xsl:output indent="yes"/>
	
	<xsl:param name="date"/>
	
	
	<xsl:include href="../xsl/common.xsl"/>
	
	<xsl:template match="/">
		<add>
			<doc>
				<field name="id">
					<xsl:value-of select="/TEI/@xml:id"/>
				</field>
				
				<field name="itemCategory"><xsl:value-of select="/TEI/teiHeader/profileDesc/textClass/keywords[@n='category']/term"/></field>
				
				<field name="titleMain">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/titleStmt/title[@type='main']"/>
				</field>
				
				<field name="author">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/author"/>
				</field>
				
				<field name="dateSearch">
					
					<xsl:choose>
						<xsl:when test="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date/@when">
							<xsl:value-of
								select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date/@when"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date"/>
						</xsl:otherwise>
					</xsl:choose>
				</field>
				
				<field name="dateDisp">
					<xsl:choose>
						<xsl:when test="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date/@when">
							<xsl:call-template name="extractDate">
								<xsl:with-param name="date"
									select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date/@when"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="extractDate">
								<xsl:with-param name="date"
									select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					
					
				</field>
				
				<field name="place">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/pubPlace"/>
				</field>
				
				<field name="state">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/pubPlace"/>
				</field>
				
				
				<field name="source">
					<xsl:if test="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='j']">
						<xsl:value-of
							select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='j']"/>
					</xsl:if>
					
					<xsl:if test="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='m']">
						<xsl:value-of
							select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='m']"/>
					</xsl:if>
					
					
					
				</field>
				
				<field name="text">
					
					<xsl:for-each select="descendant::note[@type='project']">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</xsl:for-each>
					
					<xsl:for-each select="descendant::text">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</xsl:for-each>
				</field>
			</doc>
		</add>
		
	</xsl:template>
	
	
</xsl:stylesheet>
