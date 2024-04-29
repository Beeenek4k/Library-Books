<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>

    <xsl:param name="searchID"/>

    <xsl:template match="/books">
        <html>
            <head>
                <title>LIBRARY BOOKS</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1>PILAPIL, MIGUEL V. | 3 BSIT-2 | LIBRARY BOOKS</h1>
                <form method="post">
                    <label for="searchID">ENTER BOOK TITLE OR GENRE: </label>
                    <input type="text" id="searchID" name="searchID"/>
                    <!-- Changed input type to button element -->
                    <button id="Btn">Search</button>
                </form>

                <table border="1">
                    <tr>
                        <th>BOOK NAME:</th>
                        <th>AUTHOR:</th>
                        <th>GENRE:</th>
                    </tr>
                    <xsl:apply-templates select="book[contains(translate(name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), translate($searchID, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))]"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <tr>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="author"/></td>
            <td><xsl:value-of select="genre"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
