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
				<li class="current_page_item"><a href="employee.jsp" accesskey="1" title="">Homepage</a></li>
				<li class="current_page_item"><a href="applyleave.jsp" accesskey="3" title="">Apply for Leave</a></li>
				<li class="current_page_item"><a href="editdetail.jsp" accesskey="4" title="">Edit Details</a></li>
				<li class="current_page_item"><a href="logout.jsp" accesskey="5" title="">Logout</a></li>
			</ul>
		</div>
        <div id="logo">
			<h1><a href="#">WELCOME Employee</a><br /><br />
           
                    <h1 align="center">Your current Leave status is as:</h1>  
                    
            </h1>
	  </div>
		</div>
</div>
<table border="2" align="center" cellspacing="0" cellpadding="2" bgcolor="#FFFFFF" width="60%" contenteditable="false">
        	<br />
			<tr>
            <td><b>EMP Leave ID</b></td>
			<td><b>EMP ID</b></td>
			<td><b>Leave type</b></td>
			<td><b>Start date</b></td>
			<td><b>End date</b></td>
			<td><b>Descriptio</b>.</td>
			<td bgcolor="#CCCCCC"><b>Approval status</b></td>
            <td><b>Approved emp ID</b></td>
			</tr>
<%
try{
			String user=request.getParameter("user");
			PreparedStatement pst;
			ResultSet rst;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			pst= conn.prepareStatement("select * from e_leave where emp_id='"+user+"'");	
				
				rst= pst.executeQuery();
				if(rst.next())
				{
					
				
					while(rst.next())
					{
					%>	
					<tr>
					<td><%=rst.getInt(1) %></td>
					<td><%=rst.getString(2) %></td>
					<td><%=rst.getString(3) %></td>
					<td><%=rst.getString(4) %></td>
					<td><%=rst.getString(5) %></td>
					<td><%=rst.getString(6) %></td>
					<td bgcolor="#CCCCCC"><%=rst.getInt(7) %></td>
					<td ><%=rst.getInt(8) %></td>
					</tr>	 
					</table>
					<br /><br />
						
					<%    
					}
				}
				else
				{
					%>
                    </table>
                    <table align="center" border="0"  cellspacing="0" cellpadding="2">
					<td><b>No records found!</b></td>
                    </table>
					<br /><br />
					
                    <%
				}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		}
%>
  
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