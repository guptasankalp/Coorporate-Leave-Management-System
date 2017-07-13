<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EMS</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
		function validation()
		{
			if(document.form7.elid.value.trim()=="")
			{
				alert("Type emp leave id");
				return false;
			}
			if(document.form7.aps.value.trim()=="")
			{
				alert("Type approval status");
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
     
<%

	try{
			String elid=request.getParameter("elid");
			String aps=request.getParameter("aps");
			String val=request.getParameter("action"); 
			//out.print(elid+",");
			//out.print(aps+",");
			//out.print(val+",");
			PreparedStatement pst;
			ResultSet rst;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			if("Update".equals(val))
			{
				pst= conn.prepareStatement("update e_leave set approved= "+aps+" where emp_leave_id= "+elid+"");	
				//out.println(pst);
				int r=pst.executeUpdate();
				//out.print(","+r);
				out.println("<h1><center>Updated leave status</center></h1>");
			}
			else
			{
				out.println("<h1><center>no records found</center></h1>");
			}
				
	}
	catch(Exception e)
	{
		e.printStackTrace();
		}
}
	%>
   <jsp:include page="changeleave.jsp"></jsp:include>
    
</body>
</html>