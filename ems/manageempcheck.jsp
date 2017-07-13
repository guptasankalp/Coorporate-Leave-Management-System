<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>EMS</title>
        <script type="text/javascript">
		function validation()
		{
			if(document.form15.eid.value.trim()=="")
			{
				alert("Type emp id");
				return false;
			}
			if(document.form15.ename.value.trim()=="")
			{
				alert("Type emp name");
				return false;
			}
			if(document.form15.email.value.trim()=="")
			{
				alert("Type email");
				return false;
			}
			if(document.form15.pal.value.trim()=="")
			{
				alert("Type present leaves");
				return false;
			}
			if(document.form15.mobile.value.trim()=="")
			{
				alert("Type mobile no.");
				return false;
			}
			if(document.form15.al.value.trim()=="")
			{
				alert("Type avail. leave");
				return false;
			}
		}	
	</script>
	
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
	<table border="2" align="center" cellpadding="3" cellspacing="0" bgcolor="#FFFFFF" width="60%">
        <br />
            <tr><td>
             <form action="Pdf3" method="post">
            <input type="submit" align="middle"  name="action" value="Download pdf"><br>
             </form>
            </td>
            </tr> 
        	
			<tr>
            <td><b>NAME</b></td>
			<td><b>EMPLOYEE ID</b></td>
			<td><b>EMAIL</b></td>
			<td><b>MOBILE NO.</b></td>
			<td><b>Address</b></td>
			</tr>
<%
	try{
			String eid=request.getParameter("eid");
			String ename=request.getParameter("ename");
			String email=request.getParameter("email");
			String pal=request.getParameter("pal");
			String mob=request.getParameter("mobile");
			String al=request.getParameter("al");
			String val=request.getParameter("action"); 
			//out.println(val+","+ename);
			PreparedStatement pst;
			ResultSet rst;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			if("Add".equals(val))
			{
				pst= conn.prepareStatement("insert into emp(emp_id,name,email,past_leave,mobile_phone,av_leave)values("+eid+", '"+ename+"', '"+email+"', "+pal+", "+mob+", "+al+")");	
				//out.print(pst+",");
				int r=0;
				pst.executeUpdate();
				r=pst.getUpdateCount();
				//out.print(r+",");
				if(r!=0)
				{
					out.print("<h1><center><br><br>Details Updated</center></h1>");
				}
				else
				{
					out.print("<h1><center><br><br>errorrrr</center></h1>");
                    response.sendRedirect("manageemployee.jsp");
					}
			}
			else if("ShowALL".equals(val))
			{
				pst=conn.prepareStatement("select * from user");
				//out.println(pst);
				rst= pst.executeQuery();
				while(rst.next()) // if authorized
				{	
		%>	
				<tr>
       
                <td><%=rst.getString(1) %></td>
                <td><%=rst.getString(2) %></td>
                 <td><%=rst.getString(5) %></td>
                <td><%=rst.getString(6) %></td> 
                <td><%=rst.getString(7) %></td>
                </tr>	
                
		<%		
				}
				
				
			}
			else if("Delete".equals(val))
			{
				pst= conn.prepareStatement("delete from emp where emp_id='"+eid+"' and  name='"+ename+"'");	
				//out.print(pst);
				pst.executeUpdate();
%>	
			<h2 align="center"><br />Details updated</h2>
<%
				}
			else
			{
				out.print("error");
				}
				%>
			
            <jsp:include page="manageemployee.jsp"></jsp:include>
			</table>
<%	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	 }
%>
</body>
</html>