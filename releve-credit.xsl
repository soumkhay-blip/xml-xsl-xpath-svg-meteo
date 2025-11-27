<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    
    version="3.0">
    

        
        <xsl:output method="html" encoding="UTF-8" indent="yes"/>
        
        <xsl:template match="/releve">
            <html>
                <head>
                    <title>Opérations CREDIT</title>
                    <style>
                        body { font-family: Segoe UI, Arial, sans-serif; margin: 20px; }
                        table { border-collapse: collapse; width: 100%; }
                        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                        th { background: #f7f7f7; }
                    </style>
                </head>
                <body>
                    <h1>Opérations de type CREDIT</h1>
                    <p><strong>RIB:</strong> <xsl:value-of select="@RIB"/></p>
                    <p><strong>Période:</strong>
                        <xsl:value-of select="operations/@dateDebut"/> – <xsl:value-of select="operations/@dateFin"/>
                    </p>
                    
                    <table>
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Montant</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="operations/operation[@type='CREDIT']">
                                <tr>
                                    <td><xsl:value-of select="@date"/></td>
                                    <td><xsl:value-of select="@montant"/></td>
                                    <td><xsl:value-of select="@description"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </body>
            </html>
        </xsl:template>
    </xsl:stylesheet>