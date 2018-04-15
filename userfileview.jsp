<%@ page import="java.sql.*, javax.sql.*, databaseconnection.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<%
	String check_name=(String)session.getAttribute("myname");
	if(check_name.equals(null)){
		response.sendRedirect("index.html");
	}
%>
<html>
<head>
<title>File Download</title>
</head>
<%
	
	String filename = (String)session.getAttribute("filename");

	Blob file= null;
	
	Connection con1 = null;
	PreparedStatement ps1 = null;
	ResultSet rs1 = null;
	String sql1=null;

	 sql1 = "select file from share where file_name ='"+filename+"'";
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
		ps1 = con1.prepareStatement(sql1);
		//ps1.setString(1,filename);
		rs1 = ps1.executeQuery();
		rs1.next();
		file = rs1.getBlob(1);
	}
	
	catch(Exception e)
	{
		out.println("Exception :"+e);
	}
	finally
	{
		if(con1 != null)
			con1.close();
		if(ps1 != null)
			ps1.close();
		if(rs1 != null)
			rs1.close();
	}
	session.setAttribute("resumeBlob",file);
	//out.print(file);
	//out.print(filename);
   response.sendRedirect("userview.jsp");

%>


</body>
</html>