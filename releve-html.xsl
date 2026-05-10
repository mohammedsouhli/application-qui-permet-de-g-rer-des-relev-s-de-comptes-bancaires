<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes" encoding="UTF-8"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Releve Bancaire</title>
				<style>
					body { font-family: Arial, sans-serif; margin: 20px; }
					h1 { color: #2c3e50; text-align: center; }
					h2 { color: #c0392b; margin-top: 30px; }
					table { border-collapse: collapse; margin: 10px 0; width: 60%; }
					th { background-color: #3498db; color: white; padding: 10px; border: 1px solid #2980b9; }
					td { padding: 8px; border: 1px solid #ddd; text-align: center; }
					tr:nth-child(even) { background-color: #f2f2f2; }
				</style>
			</head>
			<body>
				<h1>Releve Bancaire</h1>

				<p>RIB : <xsl:value-of select="releve/@RIB"/></p>
				<p>Date du releve : <xsl:value-of select="releve/dateReleve"/></p>
				<p>Solde : <xsl:value-of select="releve/solde"/></p>
				<p>Periode : du <xsl:value-of select="releve/operations/@dateDebut"/>
				   au <xsl:value-of select="releve/operations/@dateFin"/></p>

				<h2>Liste des operations</h2>
				<table>
					<tr>
						<th>Type</th>
						<th>Date</th>
						<th>Montant</th>
						<th>Description</th>
					</tr>
					<xsl:for-each select="releve/operations/operation">
						<tr>
							<td><xsl:value-of select="@type"/></td>
							<td><xsl:value-of select="@date"/></td>
							<td><xsl:value-of select="@montant"/></td>
							<td><xsl:value-of select="@description"/></td>
						</tr>
					</xsl:for-each>
				</table>

				<h2>Totaux</h2>
				<p>Total CREDIT :
					<xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/>
				</p>
				<p>Total DEBIT :
					<xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/>
				</p>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
