<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:param name="searchID" select="''"/>

    <xsl:template match="/books">
        <html>
            <head>
                <title>Book Search</title>
                <link rel="stylesheet" type="text/css" href="design.css"/>
            </head>
            <body>
                <h1>PILAPIL, MIGUEL V. | 3 BSIT-2 | LIBRARY BOOKS</h1>
                <form method="get" action="">
                    <label for="searchID">ENTER BOOK TITLE OR GENRE:</label>
                    <input type="text" id="searchID" name="searchID" value="{searchID}"/>
                    <input type="submit" value="Search"/>
                </form>

                <table border="1">
                    <tr>
                        <th>BOOK NAME</th>
                        <th>AUTHOR</th>
                        <th>GENRE</th>
                    </tr>
                    <xsl:apply-templates select="book[contains(lower-case(title), lower-case($searchID)) or contains(lower-case(genre), lower-case($searchID))]"/>
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
