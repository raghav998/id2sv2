<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="ElGamal.*"%>
<%
	KeyGeneration keygen=new KeyGeneration();
		
	int y= (int)(Math.random()*500);
	String myname=(String)session.getAttribute("myname");
	String myemail=(String)session.getAttribute("myemail");
	String name=request.getParameter("user");
	
	String x=null,p=null,b=null,sname=null,sc=null,myx=null;				
	Statement st = null;
	ResultSet rs=null;
	int id;

	session.setAttribute("y",y);
	session.setAttribute("name",name);

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server2","root","toor");
		st=con.createStatement();
		String sql="select * from profile where name='"+name+"'";
		rs=st.executeQuery(sql);
		while(rs.next()){
			x=rs.getString("pkey");
			session.setAttribute("x",x);
			sname=rs.getString("name");
		}	
	}
	catch (Exception eq) 
	{
		out.println(eq.getMessage());
	}
	
%>
<%		
				
	Statement st1 = null;
	ResultSet rs1 =null;
												
	try{
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
	st1=con1.createStatement();
	String sql1="select * from profile where name='"+name+"'";
	rs1=st1.executeQuery(sql1);
	while(rs1.next()){
			p=rs1.getString("primekey");
			b=rs1.getString("generatorkey");
			sc=rs1.getString("sc");
			session.setAttribute("p",p);
			session.setAttribute("b",b);
			session.setAttribute("sc",sc);
		}	
	}
	catch (Exception eq) 
	{
		out.println(eq.getMessage());
	}
%>
<%		
				
	Statement st2 = null;
	ResultSet rs2=null;
												
	try{
		Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
		st2=con2.createStatement();
		String sql2="select * from profile where email='"+myemail+"'";
		rs2=st2.executeQuery(sql2);
		while(rs2.next()){
			myx=rs2.getString("primekey");
			session.setAttribute("myx",myx);
			
		}	
	}
	catch (Exception eq) 
	{
		out.println(eq.getMessage());
	}
%>
<%
	Thread.sleep(100);
	
	String pkey = keygen.generate_Publickey(p,b,x);
	session.setAttribute("c",pkey);
	
	Thread.sleep(100);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/style.css" />

<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="wrapper">
	<div class="container">
		<h1>Send to <%=name%></h1>
		<br/>
		<form method="post" name="contact" action="uploadfile.jsp" enctype="multipart/form-data">
			<input type="text" name="title" placeholder="File Name">
			Random Message Key is <%=y%>
			<input type="file" name="myfile">
			<input type="submit" name="submit" value="Share">
		</form>
		<form class="form" method="post" action="index.html">
			<button type="submit" id="login-button">Logout</button>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
 <%
// 	try{
// 			con1.close();
// 			con2.close();
// 			con.close();
// 		}
// 		catch(Exception e){
// 			e.printStackTrace();
// 		}
// 	}
%>
<script type="text/javascript" src="script/script.js"></script>
</body>
</html>
