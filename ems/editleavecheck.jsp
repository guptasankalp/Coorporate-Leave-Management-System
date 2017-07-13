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
			if(document.form3.dname.value.trim()=="")
			{
				alert("Type job id");
				return false;
			}
			if(document.form3.ename.value.trim()=="")
			{
				alert("Type emp name");
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
       	<table border="1" align="center" cellspacing="0" cellpadding="2" bgcolor="#FFFFFF" width="60%" contenteditable="false">
        	<br />
            <tr><td>
             <form action="Pdf1" method="post">
            <input type="submit" align="middle"  name="action" value="Download pdf"><br>
             </form>
            </td>
            </tr> 
			<tr>
			<td>EMP_ID</td>
			<td>NAME</td>
			<td>EMAIL</td>
			<td>PAST applied LEAVE</td>
			<td>MOBILE NO.</td>
			<td>AVALABLE LEAVE</td>
			</tr>
                    
<%
	try{
			String dn=request.getParameter("dname");
			String en=request.getParameter("ename");
			String val=request.getParameter("action"); 
			String sav=request.getParameter("edit");
			//out.println(val+",");
			//out.println(dn+",");
			//out.println(sav+",");
			PreparedStatement pst;
			ResultSet rst;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			if("Search".equals(val))
			{
				pst= conn.prepareStatement("select * from emp where emp_id='"+dn+"' and name='"+en+"'");	
				
				//out.print(pst);
				rst= pst.executeQuery();
				if(rst.next()) // if authorized
				{	
		%>		
				<tr><td><%=rst.getInt(1) %></td>
                <td><%=rst.getString(2) %></td>
                <td><%=rst.getString(3) %></td>
                <td><%=rst.getInt(4) %></td>
                <td><%=rst.getString(5) %></td>
                <td><%=rst.getInt(6) %></td>
                </tr>	 
               
		<%		
				
				}
				else
				{
						out.println("<h1><center>no records found</center></h1>");
				}
				
			}
			
			else if("Edit".equals(sav))
			{
				pst= conn.prepareStatement("select * from e_leave");	
				out.print(pst);
				rst= pst.executeQuery();
				if(rst.next()) // if authorized
					{	
			%>		
            <table border="2" align="center" cellspacing="0" cellpadding="2" bgcolor="#FFFFFF" width="60%" contenteditable="false">
            <br />
            <tr><td>
             <form action="Pdf1" method="post">
            <input type="submit" align="middle"  name="action" value="Download pdf"><br>
             </form>
            </td>
            </tr> 
        	
            <tr>
			<td>EMP Leave ID</td>
            <td>EMP ID</td>
			<td>Leavetype</td>
			<td>Start date</td>
			<td>End Date</td>
			<td>Description</td>
			<td>Approved</td>
            <td>Approval ID</td>
            </tr>
            
					<tr><td><%=rst.getInt(1) %></td>
					<td><%=rst.getInt(2) %></td>
					<td> <%=rst.getString(3) %></td>
					<td> <%=rst.getString(4) %></td>
					<td> <%=rst.getString(5) %></td>
					<td> <%=rst.getString(6) %></td>
					<td><%=rst.getInt(7) %></td>
					<td><%=rst.getInt(8) %></td>
					</tr>	
            		                  
            </table>
			<%		
					}
				else
				{
							out.println("<h1><center>no records found</center></h1>");
				}
					
				
			}
			else
			{
				pst= conn.prepareStatement("select * from emp");	
				
				rst= pst.executeQuery();
				while(rst.next()) // if authorized
				{	
		%>		
				<tr><td><%=rst.getInt(1) %></td>
                <td><%=rst.getString(2) %></td>
                <td><%=rst.getString(3) %></td>
                <td><%=rst.getInt(4) %></td>
                <td><%=rst.getString(5) %></td>
                <td><%=rst.getInt(6) %></td>
                </tr>	
                
		<%		
				}
				
			}
				%>
<jsp:include page="editleave.jsp"></jsp:include>
           
            </table>
           
            <%			
			rst.close();
			pst.close();
			conn.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
		}
	 }
%>
</body>
</html>