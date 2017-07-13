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
 <%
 	if((session.getAttribute("user")== null) || (session.getAttribute("user")== ""))
	{
 %>
 <h1><center><br>You are Not Logged<br>
<a href="index.jsp">Login Here</a></center></h1>
	 <%
     }else{
     %>
  <div id="header-wrapper">
	<div id="header" class="container">
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="#" accesskey="1" title="">Homepage</a></li>
				<li><a href="applyleave.jsp" accesskey="3" title="">Apply Leave</a></li>
				<li><a href="editdetails.jsp" accesskey="4" title="">Edit Details</a></li>
				<li><a href="logout.jsp" accesskey="5" title="">Logout</a></li>
                </ul>
		</div>
		<div id="logo">
			<h1><a href="#">Congrats!! new Account created</a></h1>
	  </div>
	</div>
</div>
   
<div id="wrapper4">
	<div id="footer" class="container">
		<div>
			<header class="title">
				<h2>Get in touch</h2>
				<span class="byline">Phasellus nec erat sit amet nibh pellentesque congue</span> </header>
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

<%}%>
  </body>
</html>