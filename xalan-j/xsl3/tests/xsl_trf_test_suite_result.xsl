<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"
                version="3.0">

   <!-- Author: Mukul Gandhi <mukulg@apache.org> -->

   <!-- Last modified : 2025-04-01 -->   
                
   <xsl:output method="html"/>
   
   <xsl:template match="/testrun">
      <html>
        <head>
          <title>Xalan-J XSL 3 transformations test suite result</title>
        </head>
        <body>           
		   <br/><h3 style="text-align: center; color: green;">Apache Xalan-J's XSL 3 transformations test suite result</h3><br/>
		   <xsl:variable name="tests" select="@tests" as="xs:integer"/>
		   <xsl:variable name="failures" select="@failures" as="xs:integer"/>
		   <xsl:variable name="errors" select="@errors" as="xs:integer"/>
		   <table align="center">		      			  
		      <tr align="center">
			    <td>Modified timestamp : <xsl:value-of select="current-dateTime()"/></td>				
			  </tr>
			  <tr>
			     <td>&#160;</td>
			  </tr>
			  <tr align="center">
				<td>No. of tests : <xsl:value-of select="$tests"/>, Tests failure count : <xsl:value-of select="$failures"/>, Tests error count : <xsl:value-of select="$errors"/></td>
			  </tr>
			  <tr>
			     <td>&#160;</td>
			  </tr>
			  <tr align="center">
			     <td><b>Xalan-J XSL 3 implementation status document : </b><a href="https://xalan.apache.org/xalan-j/xsl3/xalanj_xslt3.0_implementation_status.pdf">https://xalan.apache.org/xalan-j/xsl3/xalanj_xslt3.0_implementation_status.pdf</a></td>
			  </tr>
		   </table>
		   <br/><br/>
		   <table align="center">
		      <tr>
			     <td><b>Test group name</b></td>
				 <td><b>Test name</b></td>
				 <td><b>No. of tests in group</b></td>
			  </tr>
			  <tr>
			     <td>&#160;</td>
				 <td>&#160;</td>
				 <td>&#160;</td>
			  </tr>
		      <xsl:for-each-group select="//testcase" group-by="xs:string(../@name)">
			     <xsl:variable name="grpSize" select="count(current-group())" as="xs:integer"/>
		         <tr>
				    <xsl:variable name="groupingKeyValue" select="current-grouping-key()"/>
					<xsl:variable name="testGrpName" select="if (starts-with($groupingKeyValue, 'org.apache.xalan.tests.xslt3.')) 
					                                                     then substring-after($groupingKeyValue, 'org.apache.xalan.tests.xslt3.') 
																		   else substring-after($groupingKeyValue, 'org.apache.xalan.tests.xpath3.')"/>
			        <td><xsl:value-of select="$testGrpName"/></td>
					<td>&#160;</td>
					<td>&#160;</td>
			     </tr>
				 <xsl:for-each select="current-group()">
				    <tr>
			          <td>&#160;</td>
					  <td><xsl:value-of select="@name"/></td>
					  <td><xsl:value-of select="if (position() eq 1) then $grpSize else ''"/></td>
			        </tr>
				 </xsl:for-each>
		      </xsl:for-each-group>
		   </table>
		   <br/><br/>
		   <p style="text-align: center;">Copyright © 1999-2025 The Apache Software Foundation</p><br/>
		</body> 
      </html>
   </xsl:template>
   
   <!--
      * Licensed to the Apache Software Foundation (ASF) under one
      * or more contributor license agreements. See the NOTICE file
      * distributed with this work for additional information
      * regarding copyright ownership. The ASF licenses this file
      * to you under the Apache License, Version 2.0 (the "License");
      * you may not use this file except in compliance with the License.
      * You may obtain a copy of the License at
      *
      *     http://www.apache.org/licenses/LICENSE-2.0
      *
      * Unless required by applicable law or agreed to in writing, software
      * distributed under the License is distributed on an "AS IS" BASIS,
      * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
      * See the License for the specific language governing permissions and
      * limitations under the License.
   -->

</xsl:stylesheet>