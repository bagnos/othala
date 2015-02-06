<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/TR/REC-html40" version="1.0">
	<xsl:decimal-format name="euro" decimal-separator=","
		grouping-separator="." />
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			</head>
			<body
				style="padding:4px;font-family: Helvetica Neue,Helvetica,Arial,sans-serif;line-height: 1.42857143;font-size:14px;">
				<br />
				<div>
					<img>
						<xsl:attribute name="src">
					    <xsl:value-of select="imgLogo" />
					    </xsl:attribute>
					</img>
				</div>
				<br />
				<p style="margin-top:20px">
					<img>
						<xsl:attribute name="src">
					    <xsl:value-of select="imgContenuto" />
					    </xsl:attribute>
					</img>
				</p>
				<p style="margin-top:20px">
					Gentile Cliente,					
					<br />
					<br />
					<xsl:value-of select="testo" />
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>