<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    
    version="3.0">
    
  
        
        <xsl:output method="html" encoding="UTF-8" indent="yes"/>
        
        <!-- Totaux via sum() (montant est xs:decimal dans le XSD) -->
        <xsl:variable name="totalCredit" select="sum(/releve/operations/operation[@type='CREDIT']/@montant)"/>
        <xsl:variable name="totalDebit"  select="sum(/releve/operations/operation[@type='DEBIT']/@montant)"/>
        
        <xsl:template match="/releve">
            <html>
                <head>
                    <title>Relevé bancaire</title>
                    <style>
                        body { font-family: Segoe UI, Arial, sans-serif; margin: 20px; }
                        table { border-collapse: collapse; width: 100%; }
                        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                        th { background: #f7f7f7; }
                        .totaux { margin-top: 16px; }
                    </style>
                </head>
                <body>
                    <h1>Relevé bancaire</h1>
                    
                    <p><strong>RIB:</strong> <xsl:value-of select="@RIB"/></p>
                    <p><strong>Date du relevé:</strong> <xsl:value-of select="dateReleve"/></p>
                    <p><strong>Solde:</strong> <xsl:value-of select="solde"/></p>
                    <p><strong>Période:</strong>
                        <xsl:value-of select="operations/@dateDebut"/> – <xsl:value-of select="operations/@dateFin"/>
                    </p>
                    
                    <h2>Opérations</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Type</th>
                                <th>Date</th>
                                <th>Montant</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="operations/operation">
                                <tr>
                                    <td><xsl:value-of select="@type"/></td>
                                    <td><xsl:value-of select="@date"/></td>
                                    <td><xsl:value-of select="@montant"/></td>
                                    <td><xsl:value-of select="@description"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                    
                    <div class="totaux">
                        <p><strong>Total CREDIT:</strong> <xsl:value-of select="$totalCredit"/></p>
                        <p><strong>Total DEBIT:</strong> <xsl:value-of select="$totalDebit"/></p>
                    </div>
                </body>
            </html>
        </xsl:template>
   
    
</xsl:stylesheet>

