import java.io.FileOutputStream;
import java.io.*;
import java.util.*;
import java.sql.*; 
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
public class sample {  
        public static void main(String[] args) throws Exception{
                
                /* Create Connection objects */
                Class.forName("com.mysql.jdbc.Driver");
				Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");

                Statement stmt = conn.createStatement();
                /* Define the SQL query */
                ResultSet query_set = stmt.executeQuery("SELECT * from users");
                /* Step-2: Initialize PDF documents - logical objects */
                Document my_pdf_report = new Document();
                PdfWriter.getInstance(my_pdf_report, new FileOutputStream("pdf_report_from_sql_using_java.pdf"));
                my_pdf_report.open();            
                //we have four columns in our table
                PdfPTable my_report_table = new PdfPTable(4);
                //create a cell object
                PdfPCell table_cell;
               
                while (query_set.next()) {                
                                String dept_id = query_set.getString("userid");
                                table_cell=new PdfPCell(new Phrase(dept_id));
                                my_report_table.addCell(table_cell);

                                String dept_name=query_set.getString("password");
                                table_cell=new PdfPCell(new Phrase(dept_name));
                                my_report_table.addCell(table_cell);

                                String manager_id=query_set.getString("usertype");
                                table_cell=new PdfPCell(new Phrase(manager_id));
                                my_report_table.addCell(table_cell);

                                String location_id1=query_set.getString("email");
                                table_cell=new PdfPCell(new Phrase(location_id1));
                                my_report_table.addCell(table_cell);

		String location_id2=query_set.getString("contact");
                                table_cell=new PdfPCell(new Phrase(location_id2));
                                my_report_table.addCell(table_cell);

		String location_id3=query_set.getString("address");
                                table_cell=new PdfPCell(new Phrase(location_id3));
                                my_report_table.addCell(table_cell);

                                }
                /* Attach report table to PDF */
                my_pdf_report.add(my_report_table);                       
                my_pdf_report.close();
                
                /* Close all DB related objects */
                query_set.close();
                stmt.close(); 
                conn.close();               
                
        }
}