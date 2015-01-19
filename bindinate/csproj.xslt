<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msb="http://schemas.microsoft.com/developer/msbuild/2003"
	exclude-result-prefixes="xsl msb">
	
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:strip-space elements="*" />
	
	<xsl:param name="srcListPath" select="''" />
	<xsl:variable name="srcList" select="document($srcListPath)" />
	<xsl:variable name="msbUri" select="'http://schemas.microsoft.com/developer/msbuild/2003'" />
	
	<xsl:template match="node()|@*">
		<xsl:copy>
			<xsl:apply-templates select="node()|@*"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="/msb:Project/msb:ItemGroup[msb:Compile]">
		<xsl:element name="ItemGroup" namespace="{$msbUri}">
			<xsl:for-each select="$srcList/SourceFiles/Compile/@Include">
				<xsl:element name="Compile" namespace="{$msbUri}">
					<xsl:attribute name="Include">
						<xsl:value-of select="." />
					</xsl:attribute>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
