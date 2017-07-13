<%--
 Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@ page  contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>EMS</title>
    <meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
	 </head>
     
  <body>
 
  <div id="header-wrapper">
	<div id="header" class="container">
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="admin.jsp" accesskey="1" title="">Homepage</a></li>
				<li class="current_page_item"><a href="editleave.jsp" accesskey="2" title="">View Leave Details</a></li>
				<li class="current_page_item"><a href="changeleave.jsp" accesskey="3" title="">Change Leave Details</a></li>
				<li class="current_page_item"><a href="logout.jsp" accesskey="4" title="">Logout</a></li>
			</ul>
		</div>
        <div id="logo">
			<h1><a href="#">WELCOME Admin</a></h1>
	  </div>
		</div>
</div>


  
  <form action="manageempcheck.jsp" method="post" name="form15" title="Find Balance Leaves" align="center">
<center>
		<table border="0" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
		<tr>
        <tr>
		<td>Emp ID</td>
		<td><Input type="text"  name="eid"><br /><br /></td>
		</tr>
		<td>Employee Name</td>
		<td><Input type="text"  name="ename"><br /><br /></td>
		</tr>	
        <tr>
		<td>Email</td>
		<td><Input type="email"  name="email"><br /><br /></td>
		</tr>
        <tr>
		<td>Past applied leaves</td>
		<td><Input type="text"  name="pal"><br /><br /></td>
		</tr>
        <tr>
		<td>Mobile</td>
		<td><Input type="tel" name="mobile"><br /><br /></td>
		</tr>
        <tr>
		<td>Available leave</td>
		<td><Input type="text"  name="al"><br /><br /></td>
		</tr>
          <td><input type="hidden" name="buttonname" /></td>
		<tr>
      
		<td><input type="submit"  name="action" value="Add" onClick="return validation()"></td>
		<td><input type="submit"  name="action" value="Delete" onClick="return validation()"></td> 
        <td><input type="submit"  name="action" value="ShowALL" ></td>
		</tr>
		</table>
		</center>
  </form>

   
<div id="wrapper4">
	<div id="footer" class="container">
		<div>
			<header class="title">
				
			<ul class="contact">
				<li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
				<li><a href="#" class="icon icon-facebook"><span></span></a></li>
				<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
				<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
				<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
			</ul>
		</div>
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">EMS</a>.</p>
</div>


  </body>
</html>