<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%
	String check_name=(String)session.getAttribute("myname");
	if(check_name.equals(null)){
		response.sendRedirect("index.html");
	}
%>
<html>
<head>
</head>
<body>

<%
	String myname=(String)session.getAttribute("myname");
	String myfile=(String)session.getAttribute("myfile");
	String mym=(String)session.getAttribute("mym");
	String filename =null;
	String m=null;
	
	Statement st = null;
	ResultSet rs1=null;
	int count=0;
		
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");			
		st=con.createStatement();
		String sql1="select message_key,file_name from share where title='"+myfile+"' ";
		rs1=st.executeQuery(sql1);
		if(rs1.next()){
			m=rs1.getString(1);
			filename=rs1.getString(2);
			session.setAttribute("filename",filename);
			if(mym.equals(m)){
				response.sendRedirect("userfileview.jsp");
			}
			else{
				out.println("Enter Correct Key");
			}
			
		}	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
		
	
 %>

</body>
</html>