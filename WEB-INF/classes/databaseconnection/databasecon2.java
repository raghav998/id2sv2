package databaseconnection;
import java.sql.*;

public class databasecon2
{
	static Connection con;
	public static Connection getconnection()
	{


		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server2","root","toor");
		}
		catch(Exception e)
		{
			System.out.println("class error");
		}
		return con;
	}

}
