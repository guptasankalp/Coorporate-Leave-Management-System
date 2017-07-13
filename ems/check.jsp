<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.* "%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>EMS</title>
        <script type="text/javascript">
			function validation()
			{
				if(document.form8.Name.value.trim()=="")
				{
					alert("Type your name");
					return false;
				}
				if(document.form8.userid.value=="")
				{
					alert("Type your userid");
					return false;
				}
				if(document.form8.pass.value=="")
				{
					alert("Type your password");
					return false;
				}
				if(document.form8.repass.value=="")
				{
					alert("ReType your password");
					return false;
				}
				if(document.form8.pass.value != document.form1.repass.value)
				{
					alert("password & retype password mismatch");
					return false;
				}
				if(document.form8.email.value=="")
				{
					alert("Enter email ");
					return false;
				}
				if(isNaN(document.form8.contact.value) || document.form1.contact.value.trim()=="")
				{
					alert("Invalid contact");
					return false;
				}
				if(document.form8.address.value=="")
				{
					alert("Type address");
					return false;
				}
				if(document.form8.email.value=="")
				{
					alert("Type email");
					return false;
				}
			}
		</script>
	</head>
	<body>
		
<%
try{
		String s1= request.getParameter("Name");
		String s2= request.getParameter("userid");
		String s3= request.getParameter("pass");
		String s4= request.getParameter("repass");
		String s5= request.getParameter("email");
		String s6= request.getParameter("contact");
		String s7= request.getParameter("address");
		
		PreparedStatement pst;
			ResultSet rst;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		
			if(s2.equals(s3))
			{
				
				pst= conn.prepareStatement("insert into user(name,userid, password,repassword,email,contact,address,usertype)VALUES('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','employee')");
				//out.print(s1);out.print(s3);
				//out.print(s2);
				//out.println(pst);
				pst.executeUpdate();
				out.print("<h1><center>Account Created</center></h1>");
            }
			else
			{
			out.print("error occurred password not match ");
			
			}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		}
	 
//<jsp:include page="mail.jsp?mode=newaccount&email="+s4+"&pass="+s2></jsp:include>
%>
	
		<jsp:include page="sign_up.jsp"></jsp:include>
	</body>
</html>


