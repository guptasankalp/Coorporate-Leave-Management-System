<%@page import="javax.servlet.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.*"%>

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
		try
		{
			
			//ems.DConnection db=new ems.DConnection();
			
			String user=request.getParameter("user");
			String pass=request.getParameter("pass");
			String val=request.getParameter("t");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			PreparedStatement pst;
			ResultSet rst;
			
			if(user.equals(null) | pass.equals(null))
				{
									//request.getRequestDispatcher("index.jsp").include(request, response); 
		%>				
						<jsp:forward page="invalidip.jsp"></jsp:forward>
						<%	
					}
				else
				{
				if("Manager".equals(val))
				{
					session.setAttribute("user", user);
					pst= conn.prepareStatement("select * from user where userid='"+user+"' and password='"+pass+"' and usertype='manager'");	
					out.print(pst);
					rst= pst.executeQuery();  
					if(rst.next()) // if authorized
					{	
						response.sendRedirect("admin.jsp?user="+user);
						%>
						<jsp:forward page="admin.jsp"></jsp:forward>
						<%
					}
					else //if unauthorized
					{
						//request.getRequestDispatcher("index.jsp").include(request, response); 
		%>				
						<jsp:forward page="invalidip.jsp"></jsp:forward>
						<%	out.print("<br><center><h1>Invalid user or password</h1></center>"); %>
						<jsp:include page="index.jsp"></jsp:include>
		<%				
					}
				}
				else if("Employee".equals(val))
				{
					
						session.setAttribute("user", user);
						pst= conn.prepareStatement("select * from user where userid='"+user+"' and password='"+pass+"' and usertype='employee'");		
						out.print(pst);
						rst= pst.executeQuery();				
						if(rst.next()) // if authorized
						{	
							response.sendRedirect("employee.jsp?user="+user);
							%>
							<jsp:forward page="employee.jsp"></jsp:forward>
							<%
						}
						else //if unauthorized
						{
							//request.getRequestDispatcher("index.jsp").include(request, response); 
			%>				
							<jsp:forward page="invalidip.jsp"></jsp:forward>
							<%	out.print("<br><center><h1>Invalid user or password</h1></center>"); %>
							<jsp:include page="index.jsp"></jsp:include>
			<%				
						}
					
				}
				else
				{
							out.print("<br><center><h1>Invalid user or password</h1></center>"); 
					}
				}
		}
		catch(Exception e)
		{
			out.print(e.getMessage());
		}
	 
	%>
	</body>
</html>