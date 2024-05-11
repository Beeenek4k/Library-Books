<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>

    <xsl:param name="searchID"/>

    <xsl:template match="/books">
        <html>
            <head>
                <title>LIBRARY BOOKS</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <script type="text/javascript">
                    <![CDATA[
                        function searchBooks() {
                            var searchID = document.getElementById('searchID').value.toLowerCase();
                            var rows = document.getElementsByTagName('tr');

                            for (var i = 1; i < rows.length; i++) {
                                var title = rows[i].getElementsByTagName('td')[0].textContent.toLowerCase();
                                var author = rows[i].getElementsByTagName('td')[1].textContent.toLowerCase();
                                var genre = rows[i].getElementsByTagName('td')[2].textContent.toLowerCase();

                                if (title.includes(searchID) || author.includes(searchID) || genre.includes(searchID)) {
                                    rows[i].style.display = '';
                                } else {
                                    rows[i].style.display = 'none';
                                }
                            }
                        }
                    ]]>
                </script>
            </head>
            <body>
                <h1>PILAPIL, MIGUEL V. | 3 BSIT-2 | LIBRARY BOOKS</h1>
                <form>
                    <label for="searchID">ENTER BOOK TITLE, AUTHOR, OR GENRE: </label>
                    <input type="text" id="searchID" name="searchID"/>
                    <button type="button" id="Btn" onclick="searchBooks()">SEARCH</button>
                </form>

                <table border="1">
                    <tr>
                        <th>BOOK NAME:</th>
                        <th>AUTHOR:</th>
                        <th>GENRE:</th>
                    </tr>
                    <xsl:apply-templates select="book"/>
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
