<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/books">
        <html>
            <head>
                <title>Library Books</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1>Library Books</h1>
                <form method="post">
                    <label for="searchID">Search Books:</label>
                    <input type="text" id="searchID" name="searchID" placeholder="Search by title, author, or genre" />
                    <input type="submit" value="Search" />
                </form>

                <table>
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Genre</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="book[contains(translate(concat(title, author, genre), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), translate($searchID, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'))]"/>
                    </tbody>
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
