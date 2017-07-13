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
			String lt=request.getParameter("leavetype");
			String sd=request.getParameter("startdate");
			String ed=request.getParameter("enddate");
			String desc=request.getParameter("description");
			PreparedStatement pst1,pst2;
			ResultSet rst;
			int app=1;	
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			
			if(lt.equals(null))
			{
					out.println("<h1><center>enter a valid date</h1></center>");					
			}
			else if(sd.equals(null))
			{
					out.println("<h1><center>password not match</center></h1> ");
			}
			else if(desc.equals(null))
			{
					out.println("enter a description");					
			}
			else 
			{				
				pst1=conn.prepareStatement("select * from user where userid='"+eid+"' and password='"+pass+"'");
				//out.print(pst1);
				rst=pst1.executeQuery();
				if(rst.next()) // if authorized
				{
					pst2 = conn.prepareStatement("insert into  e_leave(emp_id,leavetype,start_date,end_date,description,approved,approval_emp_id)values('"+eid+"' , '"+lt+"', '"+sd+"','"+ed+"','"+desc+"',0,1)");
					pst2.executeUpdate();
					//out.print(pst2);
					out.print("<h1><center>Leave request sent</center></h1>");
				}
				else
				{
					out.print("<h1><center>Incorrect ID or password</center></h1>");
					}
				conn.close();
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			}	
			
			
		//	try{
		//		Driver d=new com.mysql.jdbc.Driver();
		//		DriverManager.registerDriver(d);
		//	}
		//	catch(ClassNotFoundException e)
		//	{
		//		e.printStackTrace();
		//		}
		//	try{
		//		Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		//	}
		//	catch(SQLException e){
		//		e.printStackTrace();
		//		}
			
			//ResultSet rst=db.getdata("select * from users where userid='"+user+"' and password='"+pass+"' and usertype='manager'");
			//pst.setString(1, userid);
			//pst.setString(2, password);
	 }
		%>
        <jsp:include page="applyleave.jsp"></jsp:include>
     
    </body>
</html>