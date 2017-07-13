package ems;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.FileOutputStream;
import java.io.*;
import java.util.*;
import java.sql.*; 
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
public class pdf1 extends HttpServlet{
protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
{	doPost(request,response);
}
protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
{
	
	try{   
	res.setContentType("application/pdf");
	                      
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
	rst.close();
	pst.close();
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