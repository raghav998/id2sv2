<%@page import="com.oreilly.servlet.*,java.sql.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="ElGamal.*"%>
<%
	String check_name=(String)session.getAttribute("myname");
	if(check_name.equals(null)){
		response.sendRedirect("index.html");
	}
%>
<%
	Elgamal_Decryption elgam=new Elgamal_Decryption();

	String myname=(String)session.getAttribute("myname");
	String myfile=(String)session.getAttribute("myfile");

	String myc2=(String)session.getAttribute("c2");
	String ckey=(String)session.getAttribute("ckey");

	String c2=null,p=null,k1=null,sname=null,c1=null,myx=null,fname=null;
	Statement st4 = null;
	ResultSet rs4=null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
	try{


	st4=con.createStatement();
	String sql4="select primekey from profile where name='"+myname+"'";
	rs4=st4.executeQuery(sql4);
		while(rs4.next()){
			p=rs4.getString(1);
			session.setAttribute("p",p);
			//out.println(p);
		}
	}
	catch (Exception eq4)
	{
		out.println(eq4.getMessage());
	}
%>
<%

	Statement st = null;
	ResultSet rs=null;

	try{


	st=con.createStatement();
	String sql="select k,c1,c2,share_from,file_name from share where title='"+myfile+"'";
	rs=st.executeQuery(sql);
		while(rs.next()){
			k1=rs.getString(1);
			c1=rs.getString(2);
			c2=rs.getString(3);
			sname=rs.getString(4);
			fname=rs.getString(5);
			//out.println(k1);
		}
	}
	catch (Exception eq)
	{
		out.println(eq.getMessage());
	}
%>

<%
	Thread.sleep(100);

	String m = elgam.decrypt(ckey,myc2,p);
	session.setAttribute("mym",m);
			%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/style.css" />

<meta charset="UTF-8">
<title>File Key</title>
</head>
<body>
	<div class="wrapper">
	<div class="container">
		<h1>File Ready</h1><br/>
		<h2>Recovered file key is <%=m%></h2>
		<form class="form" method="post" action="recover_key1.jsp">
			<button type="submit" id="login-button">Decrypt & Download</button>
		</form>
		<form class="form" method="post" action="home.jsp">
			<button type="submit" id="login-button">Go Home</button>
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
