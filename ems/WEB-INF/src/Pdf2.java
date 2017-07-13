
import java.io.FileOutputStream;
import java.sql.*; 
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

public class Pdf2 extends GenericServlet
{
	public void service(ServletRequest request,ServletResponse response)throws ServletException,IOException
	{

	try{   
	
	      response.setContentType("application/pdf");               
		// response.setContentType("text/plain");               
                /* Create Connection objects */
                Class.forName("com.mysql.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");

                Statement stmt = conn.createStatement();
                /* Define the SQL query */
                ResultSet query_set2 = stmt.executeQuery("SELECT * from e_leave");

                /* Step-2: Initialize PDF documents - logical objects */
                Document my_pdf_report2 = new Document();
	
                PdfWriter.getInstance(my_pdf_report2, new FileOutputStream("pdf_report_from_sql_using_java2.pdf"));
                my_pdf_report2.open();   
         
                //we have four columns in our table
                PdfPTable my_report_table2 = new PdfPTable(7);

                //create a cell object
                PdfPCell table_cell2;
               
                while (query_set2.next()) {                
                                String s1 = query_set2.getString("emp_leave_id");
                                table_cell2=new PdfPCell(new Phrase(s1));
                                my_report_table2.addCell(table_cell2);

                                String s2=query_set2.getString("emp_id");
                                table_cell2=new PdfPCell(new Phrase(s2));
                                my_report_table2.addCell(table_cell2);

                                String s3=query_set2.getString("leavetype");
                                table_cell2=new PdfPCell(new Phrase(s3));
                                my_report_table2.addCell(table_cell2);

                         
		String s4=query_set2.getString("start_date");
                                table_cell2=new PdfPCell(new Phrase(s4));
                                my_report_table2.addCell(table_cell2);

		String s5=query_set2.getString("end_date");
                                table_cell2=new PdfPCell(new Phrase(s5));
                                my_report_table2.addCell(table_cell2);

		String s6=query_set2.getString("description");
                                table_cell2=new PdfPCell(new Phrase(s6));
                                my_report_table2.addCell(table_cell2);
		String s7=query_set2.getString("approved");
                                table_cell2=new PdfPCell(new Phrase(s7));
                                my_report_table2.addCell(table_cell2);

                                }
	
                /* Attach report table to PDF */
                my_pdf_report2.add(my_report_table2);                       
                my_pdf_report2.close();
                
                /* Close all DB related objects */
                query_set2.close();
                stmt.close(); 
                conn.close();  
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}             
                
        }
}