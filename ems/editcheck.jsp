<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>EMS</title>
        
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
    <%
	try{
			String eid=request.getParameter("eid");
			String pass=request.getParameter("pass");
			String repass=request.getParameter("repass");
			String email=request.getParameter("email");
			String contact=request.getParameter("leavetype");
			String addr=request.getParameter("startdate");
			String val=request.getParameter("action");
			PreparedStatement pst;
			ResultSet rst;
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			if(pass.equals(repass))
			{
				if("Update".equals(val))
				{				
					pst=conn.prepareStatement("update user set password='"+pass+"'  ,repassword='"+repass+"' email='"+email+"'  ,contact="+contact+"  , address='"+addr+"'  where userid='"+eid+"'");
					//out.print(pst1);
					rst=pst.executeQuery();
					conn.close();
				}
			}
			else
			{
				out.print("<h1><center>Incorrect ID or password</center></h1>");
				}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			}	
	 }
		%>
       <jsp:include page="editdetail.jsp"></jsp:include>
     
    </body>
</html>