<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes" encoding="UTF-8"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Operations CREDIT</title>
				<style>
					body { font-family: Arial, sans-serif; margin: 20px; }
					h1 { color: #27ae60; text-align: center; }
					table { border-collapse: collapse; margin: 10px 0; width: 60%; }
					th { background-color: #27ae60; color: white; padding: 10px; border: 1px solid #1e8449; }
					td { padding: 8px; border: 1px solid #ddd; text-align: center; }
					tr:nth-child(even) { background-color: #f2f2f2; }
				</style>
			</head>
			<body>
				<h1>Operations de type CREDIT</h1>

				<p>RIB : <xsl:value-of select="releve/@RIB"/></p>
				<p>Date du releve : <xsl:value-of select="releve/dateReleve"/></p>

				<table>
					<tr>
						<th>Date</th>
						<th>Montant</th>
						<th>Description</th>
					</tr>
					<xsl:for-each select="releve/operations/operation[@type='CREDIT']">
						<tr>
							<td><xsl:value-of select="@date"/></td>
							<td><xsl:value-of select="@montant"/></td>
							<td><xsl:value-of select="@description"/></td>
						</tr>
					</xsl:for-each>
				</table>

				<p>Total CREDIT :
					<xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/>
				</p>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
