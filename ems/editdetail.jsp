<%@ page  contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>EMS</title>
    <script>

       			function validation()
				{
					if(document.form9.eid.value.trim()=="")
					{
						alert("Type employee id");
						return false;
					}
					if(document.form9.pass.value.trim()=="")
					{
						alert("Type password");
						return false;
					}
					if(document.form9.repass.value.trim()=="")
					{
						alert("Type password");
						return false;
					}
					if(document.form9.email.value.trim()=="")
					{
						alert("Type email");
						return false;
					}
					if(document.form9.contact.trim()=="")
					{
						alert("Type contact no");						
						return false;
					}
					if(document.form9.address.value.trim()=="")
					{
						alert("Type address");
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
				<li class="current_page_item"><a href="applyleave.jsp" accesskey="3" title="">Apply Leave</a></li>
				<li class="current_page_item"><a href="logout.jsp" accesskey="5" title="">Logout</a></li>
                
			</ul>
		</div>
		
        <div id="logo">
			<h1><a href="#">Edit Details</a></h1> 	
        </div>
        </div>
        </div>
        </div>
        
        <form action="editcheck.jsp" method="post" name="form9">
<center>
		<table border="0" style="border-collapse:collapse;width:50%;height:150px;text-align:center;margin:50px;">
        <tr>
		<td>User ID</td>
		<td><span class="before" >*    </span><Input type="text" name="eid"><br /><br /></td>
		</tr>
        <tr>
        <td>Password</td>
		<td><span class="before" >*    </span><Input type="password" name="pass"><br /><br /></td>
		</tr>
        <tr>
        <td>RE-TypePassword</td>
		<td><span class="before" >*    </span><Input type="password" name="repass"><br /><br /></td>
		</tr>
        <tr>
        <td>Email</td>
		<td><span class="before" >*    </span><Input type="email" name="email"><br /><br /></td>
		</tr>
        <tr>
		<td>Contact no.</td>
		<td><span class="before" >*    </span><Input type="text" maxlength="10"  name="contact"><br /><br /></td>
		</tr>
        <tr>
		<td>Address</td>
		<td><textarea rows="1" cols="3" name="address"></textarea><br /><br /></td> 
       </tr>
		<tr>
		<td><input type="submit" value="Update" name="action"  onclick="return validation()" border="3" height="4px"></td>
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
<%}%>
  </body>
        
</body>
</html>