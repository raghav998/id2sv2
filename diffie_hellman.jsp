<%@page import="com.oreilly.servlet.*,java.sql.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="ElGamal.*"%>
<%	
	Diffie_Hellman dh=new Diffie_Hellman();
		
	String myname=(String)session.getAttribute("myname");
	String myfile=(String)session.getAttribute("myfile");
	
	String myc1=(String)session.getAttribute("c1");
	String privatekey=request.getParameter("privatekey");
	
	String c2=null,p=null,k1=null,sname=null,c1=null,myx=null,fname=null;				
	Statement st = null;
	ResultSet rs=null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");										
	try{
										
	
	st=con.createStatement();
	String sql="select primekey from profile where name='"+myname+"'";
	rs=st.executeQuery(sql);
		while(rs.next()){
			p=rs.getString(1);
			//out.println(p); 
		}	
	}
	catch (Exception eq4) 
	{
		System.out.println(eq4.getMessage());
	}
%>
<%		
				
	Statement st1 = null;
	ResultSet rs1=null;
													
	try{
										
	
	st1=con.createStatement();
	String sql="select k,c1,c2,share_from,file_name from share where title='"+myfile+"'";
	rs1=st1.executeQuery(sql);
		while(rs1.next()){
			k1=rs1.getString(1);
			c1=rs1.getString(2);
			c2=rs1.getString(3);
			sname=rs1.getString(4);
			fname=rs1.getString(5);
			//out.println(k1);
		}	
	}
	catch (Exception eq) 
	{
		out.println(eq.getMessage());
	}
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
		<%
			Thread.sleep(100);
			String k2 = dh.key_exchange(myc1,privatekey,p);
			if(c1.equals(myc1) && k1.equals(k2)){
				System.out.println("***********");
				System.out.println("Common Key");
				System.out.println("***********");
				System.out.println(myname+" : "+k2);
				System.out.println(sname+" : "+k1);
				System.out.println("***********");
				session.setAttribute("ckey",k2);
				session.setAttribute("c2",c2);%>
		<h1>File Key</h1>
		<h2>Common Key : <%=k2%></h2>
		<h2>Cipher Key : <%=c2%></h2>
		<form class="form" method="post" action="recover_key.jsp">
			<button type="submit" id="login-button">Recover Key</button>
		</form>
		<%}
		else{%>
			<h1 style="color: red;">Private Key Wrong</h1>
		<%}%>
		<form class="form" method="post" action="home.jsp">
			<button type="submit" id="login-button">Go back</button>
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

<script type="text/javascript" src="script/script.js"></script>
</body>
</html>
