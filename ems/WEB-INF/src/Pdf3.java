//package ems;
import java.io.FileOutputStream;
import java.sql.*; 
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

public class Pdf3 extends GenericServlet
{
	public void service(ServletRequest request,ServletResponse response)throws ServletException,IOException
	{

	try{   
	
	    response.setContentType("application/pdf");               
	//	 response.setContentType("text/plain");               
                /* Create Connection objects */
                Class.forName("com.mysql.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");

                Statement stmt = conn.createStatement();
                /* Define the SQL query */
                ResultSet query_set = stmt.executeQuery("SELECT * from emp");

                /* Step-2: Initialize PDF documents - logical objects */
                Document my_pdf_report3 = new Document();
	File f=new File("/path/to/files","pdf_report_from_sql_using_java3.pdf");
                PdfWriter.getInstance(my_pdf_report3, new FileOutputStream(f));
                my_pdf_report3.open();   
         
                //we have four columns in our table
                PdfPTable my_report_table3 = new PdfPTable(5);

                //create a cell object
                PdfPCell table_cell;
               
                while (query_set.next()) {                
                                String s1 = query_set.getString("name");
                                table_cell=new PdfPCell(new Phrase(s1));
                                my_report_table3.addCell(table_cell);

                                String s2=query_set.getString("userid");
                                table_cell=new PdfPCell(new Phrase(s2));
                                my_report_table3.addCell(table_cell);

                                String s3=query_set.getString("email");
                                table_cell=new PdfPCell(new Phrase(s3));
                                my_report_table3.addCell(table_cell);

                         
		String s4=query_set.getString("contact");
                                table_cell=new PdfPCell(new Phrase(s4));
                                my_report_table3.addCell(table_cell);

		String s5=query_set.getString("address");
                                table_cell=new PdfPCell(new Phrase(s5));
                                my_report_table3.addCell(table_cell);

                                }
	
                /* Attach report table to PDF */
                my_pdf_report3.add(my_report_table3);                       
                my_pdf_report3.close();
                
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