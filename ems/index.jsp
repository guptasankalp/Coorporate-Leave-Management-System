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
<%@page import="javax.servlet.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.* "%>
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>EMS</title>
    <script type="text/javascript">
		function validation()
		{
			if(document.form1.user.value.trim()=="")
			{
				alert("Type user ID");
				return false;
			}
			if(document.form1.pass.value.trim()=="")
			{
				alert("Type password");
				return false;
			}
		}
		
	</script>
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
				<li class="current_page_item"><a href="index.jsp" accesskey="1" title="">Homepage</a></li>
				<li class="current_page_item"><a href="#" accesskey="3" title="">About Us</a></li>
				<li class="current_page_item"><a href="contact.jsp" accesskey="5" title="">Contact Us</a></li>
			</ul>
		</div>
		<div id="logo">
			<h1><a href="#">WELCOME to EMS</a></h1>
	  </div>
	</div>
</div>

<form action="logincheck.jsp" method="post" name="form1">
<center>
		<table border="0" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
		<tr>
		<td>User Type</td><br>
		<td><Input type="radio"  name="t" value="Manager" >Manager</td><br>
        <td><Input type="radio"  name="t" value="Employee" checked>Employee<br></td>
		</tr>
        <tr>
		<td>User ID</td>
		<td><span class="before" >*  </span><Input type="text" class="required"  name="user"></td>
		</tr>
		<tr>
		<td>User Password</td>
		<td><span class="before">*  </span><Input type="password" class="required" name="pass"></td>
		</tr>	
		<tr>
		<td><input type="submit" value="Login" onClick="return validation()"></td>
		<br >
		<td><a href="sign_up.jsp">NewUserSignup</a></td>
        
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