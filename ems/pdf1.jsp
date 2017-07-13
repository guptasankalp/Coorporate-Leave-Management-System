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
<%@ page  contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.io.*,javax.servlet.*,java.util.*, java.io.FileOutputStream, com.itextpdf.text.*, com.itextpdf.text.pdf.*" errorPage="" %>
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
 
  <div id="header-wrapper">
	<div id="header" class="container">
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="admin.jsp" accesskey="1" title="">Homepage</a></li>
				<li class="current_page_item"><a href="editleave.jsp" accesskey="2" title="">View Leave Details</a></li>
                <li class="current_page_item"><a href="changeleave.jsp" accesskey="2" title="">Change Leave Details</a></li>
			<li class="current_page_item"><a href="manageemployee.jsp" accesskey="3" title="">Manage Employee</a></li>
				<li class="current_page_item"><a href="logout.jsp" accesskey="4" title="">Logout</a></li>
			</ul>
		</div>
        <div id="logo">
			<h1><a href="#">WELCOME Admin</a></h1>
	  </div>
		</div>
</div>

   <%
   			
			try{
				 Class.forName("com.mysql.jdbc.Driver");
				Connection conn= DriverManager.getConnection

("jdbc:mysql://localhost:3306/ems","root","");

                Statement stmt = conn.createStatement();
                /* Define the SQL query */
                ResultSet query_set = stmt.executeQuery("SELECT * from emp");

                /* Step-2: Initialize PDF documents - logical objects */
                Document my_pdf_report1 = new Document();
                PdfWriter.getInstance(my_pdf_report1, new FileOutputStream("pdf_report_from_sql_using_java1.pdf"));
                my_pdf_report1.open();   
         
                //we have four columns in our table
                PdfPTable my_report_table1 = new PdfPTable(7);

                //create a cell object
                PdfPCell table_cell;
               
                while (query_set.next()) {                
                                String s1 = query_set.getString("emp_id");
                                table_cell=new PdfPCell(new Phrase(s1));
                                my_report_table1.addCell(table_cell);

                                String s2=query_set.getString("name");
                                table_cell=new PdfPCell(new Phrase(s2));
                                my_report_table1.addCell(table_cell);

                                String s3=query_set.getString("email");
                                table_cell=new PdfPCell(new Phrase(s3));
                                my_report_table1.addCell(table_cell);

                                String s4=query_set.getString("email");
                                table_cell=new PdfPCell(new Phrase(s4));
                                my_report_table1.addCell(table_cell);

		String s5=query_set.getString("past_leave");
                                table_cell=new PdfPCell(new Phrase(s5));
                                my_report_table1.addCell(table_cell);

		String s6=query_set.getString("mobile_phone");
                                table_cell=new PdfPCell(new Phrase(s6));
                                my_report_table1.addCell(table_cell);

		String s7=query_set.getString("av_leave");
                                table_cell=new PdfPCell(new Phrase(s7));
                                my_report_table1.addCell(table_cell);

                                }
                /* Attach report table to PDF */
                my_pdf_report1.add(my_report_table1);                       
                my_pdf_report1.close();
                
                /* Close all DB related objects */
                query_set.close();
                stmt.close(); 
                conn.close();               

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
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
</div>


  </body>
</html>