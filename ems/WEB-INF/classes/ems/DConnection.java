package ems;
import java.sql.*;
public class DConnection 
{
	Connection conn;
	Statement stmt;
	ResultSet rst;
	public DConnection()
	{
		
		setdata("create table if not exists users(userid char(10), password char(10), usertype enum('manager','employee'), email varchar(40), contact varchar(40) ,address varchar(60) )");
		close();
		int cnt=0;
		try
		{
			rst=getdata("select count(*) from users");
			rst.next();
			cnt=rst.getInt(1);
			close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		if(cnt==0)
		{
			setdata("insert into users values('manager','manager','manager','','','')");
			close();
		}

		setdata("CREATE TABLE IF NOT EXISTS designation(desig_id int(11),name varchar(45),PRIMARY KEY (desig_id),UNIQUE KEY desig_id_UNIQUE (desig_id)) ");
		close();

		setdata("CREATE TABLE IF NOT EXISTS emp_leave(emp_leave_id int(10) unsigned NOT NULL AUTO_INCREMENT, emp_id int(11) unsigned NOT NULL,start_date date NOT NULL DEFAULT '0000-00-00',end_date date NOT NULL DEFAULT '0000-00-00',  workdays decimal(4,1) unsigned NOT NULL DEFAULT '0.0',  type_id int(11) unsigned NOT NULL,  submit_date date NOT NULL,  approved tinyint(1) DEFAULT '0',  approval_date date NOT NULL,  approval_emp_id int(10) unsigned NOT NULL,PRIMARY KEY (emp_leave_id),KEY idx_type (type_id),KEY idx_start (start_date),KEY fk_emp_leave_emp (emp_id)) ");
		close();

		setdata("CREATE TABLE IF NOT EXISTS employees (emp_id int(11) unsigned NOT NULL AUTO_INCREMENT,  title_id int(11) unsigned NOT NULL,name varchar(60) NOT NULL DEFAULT 'unknown',fileno varchar(20) NOT NULL DEFAULT 'TBD',  max_leave int(11) NOT NULL,  mobile_phone varchar(15) NOT NULL,leave_left int(10) unsigned NOT NULL DEFAULT '0',designation_desig_id int(11) NOT NULL,PRIMARY KEY (emp_id),KEY idx_title (title_id),KEY idx_payroll (fileno),KEY idx_name (name),KEY fk_employees_designation1 (designation_desig_id)) ");		
		close();

		setdata("CREATE TABLE IF NOT EXISTS leave_types (leave_type_id int(11) unsigned NOT NULL AUTO_INCREMENT,name varchar(20) NOT NULL, description varchar(200) NOT NULL,isPaid tinyint(1) unsigned NOT NULL DEFAULT '0',  isAWOL tinyint(1) unsigned NOT NULL DEFAULT '0',isAnnual tinyint(1) unsigned NOT NULL DEFAULT '0',PRIMARY KEY (leave_type_id)) ");
		close();

	}
	public int setdata(String qry)//insert,delete,update
	{
		int cnt=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			stmt=conn.createStatement();
			cnt=stmt.executeUpdate(qry);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return cnt;
	}
	public ResultSet getdata(String qry)//select
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			stmt=conn.createStatement();
			rst=stmt.executeQuery(qry);
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();	
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}		
		return rst;
	}
	public void close()
	{
		try
		{
			stmt.close();
			conn.close();
		}
		catch(SQLException e)
		{
			
		}
	}
}
