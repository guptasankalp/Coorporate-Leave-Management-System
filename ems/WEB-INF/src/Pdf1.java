//package ems;

import java.io.FileOutputStream;
import java.sql.*; 
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

public class Pdf1 extends GenericServlet
{
	public void service(ServletRequest request,ServletResponse response)throws ServletException,IOException
	{

	try{   
	
	   // response.setContentType("application/pdf");               
	//	 response.setContentType("text/plain");               
                /* Create Connection objects */
                Class.forName("com.mysql.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");

                Statement stmt = conn.createStatement();
                /* Define the SQL query */
                ResultSet query_set = stmt.executeQuery("SELECT * from emp");

                /* Step-2: Initialize PDF documents - logical objects */
                Document my_pdf_report1 = new Document();
                PdfWriter.getInstance(my_pdf_report1, new FileOutputStream("pdf_report_from_sql_using_java1.pdf"));
                my_pdf_report1.open();   
                
                //we have four columns in our table
                PdfPTable my_report_table1 = new PdfPTable(6);

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

                         
		String s4=query_set.getString("past_leave");
                                table_cell=new PdfPCell(new Phrase(s4));
                                my_report_table1.addCell(table_cell);

		String s5=query_set.getString("mobile_phone");
                                table_cell=new PdfPCell(new Phrase(s5));
                                my_report_table1.addCell(table_cell);

		String s6=query_set.getString("av_leave");
                                table_cell=new PdfPCell(new Phrase(s6));
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
                
        }
}