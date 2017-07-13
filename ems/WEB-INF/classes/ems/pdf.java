package ems;
import java.io.FileOutputStream;
import java.io.*;
import java.util.*;
import java.sql.*; 
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
public class pdf{  
        public static void main(String[] args) throws Exception{		

				Class.forName("com.mysql.jdbc.Driver");
				Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
				PreparedStatement pst=conn.prepareStatement("select * from users");
				
				ResultSet rst=pst.executeQuery();
				Document d=new Document();
				PdfWriter.getInstance(d, new FileOutputStream("pdfreport.pdf"));
				d.open();
				
				PdfTable table=new PdfTable(6);
				PdfCell cell;
				
					while(rst.next())
					{
						String id=rst.getString("user");
						cell=new PdfPcell(new Phrase(userid));
						table.addcell(cell);
						
					//	String p=request.getParameter("ename");
					//	table.addcell("address");
						
					}
					d.add(table);
						d.close();
						pst.close();
						conn.close();
				}
		}