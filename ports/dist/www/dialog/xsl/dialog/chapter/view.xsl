<?xml version="1.0" encoding="iso-8859-1"?>
<!--
 ! Stylesheet for home page
 !
 ! $Id$
 !-->
<xsl:stylesheet
 version="1.0"
 xmlns:exsl="http://exslt.org/common"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:func="http://exslt.org/functions"
 extension-element-prefixes="func"
>
  <xsl:include href="../layout.xsl"/>
  
  <!--
   ! Function that draws the images of a chapter
   !
   ! @see      ../layout.xsl
   ! @purpose  Define main content
   !-->
  <func:function name="func:chapter-images">
    <xsl:param name="album"/>
    <xsl:param name="chapter"/>
    <xsl:param name="images"/>
    <xsl:param name="i" select="1"/>
    <xsl:param name="max" select="4"/>
    
    <func:result>
      <tr>
        <xsl:for-each select="exsl:node-set($images)/image[position() &gt;= $i and position() &lt; $i + $max]">
          <td>
            <a href="{func:link(concat('image/view?', $album, ',i,', $chapter, ',', $i))}">
              <img width="150" height="113" border="0" src="/albums/{$album}/thumb.{name}"/>
            </a>
          </td>
        </xsl:for-each>
      </tr>
      <xsl:if test="$i &lt; count(exsl:node-set($images)/image)">
        <xsl:copy-of select="func:chapter-images($album, $chapter, exsl:node-set($images), $i + $max)"/>
      </xsl:if>
    </func:result>  
  </func:function>
  
  <!--
   ! Template for content
   !
   ! @see      ../layout.xsl
   ! @purpose  Define main content
   !-->
  <xsl:template name="content">
    <h3>
      <a href="{func:link('static')}">Home</a> &#xbb; 
      <a href="{func:link(concat('album/view?', /formresult/album/@name))}">
        <xsl:value-of select="/formresult/album/@title"/>
      </a>
      &#xbb; 
      <a href="{func:link(concat('chapter/view?', /formresult/album/@name, ',', /formresult/chapter/@id - 1))}">
        Chapter #<xsl:value-of select="/formresult/chapter/@id"/>
      </a>
    </h3>
    <br clear="all"/>

    <xsl:variable name="total" select="count(/formresult/chapter/images/image)"/>
    <xsl:variable name="oldest" select="/formresult/chapter/images/image[1]"/>

    <div class="datebox">
      <h2><xsl:value-of select="/formresult/chapter/@id"/></h2> 
    </div>
    <h2>
      <xsl:value-of select="concat(
        exsl:node-set($oldest)/exifData/dateTime/weekday, ', ',
        exsl:node-set($oldest)/exifData/dateTime/mday, ' ',
        exsl:node-set($oldest)/exifData/dateTime/month, ' ',
        exsl:node-set($oldest)/exifData/dateTime/hours, ':00'
      )"/>
    </h2>
    <p>
      This chapter contains
      <xsl:choose>
        <xsl:when test="$total = 1">1 image</xsl:when>
        <xsl:otherwise><xsl:value-of select="$total"/> images</xsl:otherwise>
      </xsl:choose>
    </p>

    <center>
      <a title="Previous image" class="pager" id="{/formresult/chapter/@previous != ''}">
        <xsl:if test="/formresult/chapter/@previous != ''">
          <xsl:attribute name="href"><xsl:value-of select="func:link(concat(
            'chapter/view?', 
            /formresult/album/@name, ',',
            /formresult/chapter/@previous
          ))"/></xsl:attribute>
        </xsl:if>
        <img alt="&#xab;" src="/image/prev.gif" border="0" width="19" height="15"/>
      </a>
      <a title="Next image" class="pager" id="{/formresult/chapter/@next != ''}">
        <xsl:if test="/formresult/chapter/@next != ''">
          <xsl:attribute name="href"><xsl:value-of select="func:link(concat(
            'chapter/view?', 
            /formresult/album/@name, ',',
            /formresult/chapter/@next
          ))"/></xsl:attribute>
        </xsl:if>
        <img alt="&#xbb;" src="/image/next.gif" border="0" width="19" height="15"/>
      </a>
    </center>

    <table border="0" class="chapter">
      <xsl:copy-of select="func:chapter-images(
        /formresult/album/@name, 
        /formresult/chapter/@id - 1,
        /formresult/chapter/images
      )"/>
    </table>
  </xsl:template>
  
</xsl:stylesheet>
