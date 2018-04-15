<%@ page import="java.sql.*" errorPage="error.html" %>
<%
	String check_name=(String)session.getAttribute("myname");
	if(check_name.equals(null)){
		response.sendRedirect("index.html");
	}
%>
<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
		String myfile=request.getParameter("file");
		session.setAttribute("myfile",myfile);
		
		String c1=null;
%>
<%		
			
		Statement st = null;
		ResultSet rs=null;
												
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
		st=con.createStatement();
		String sql="select c1 from share where title='"+myfile+"' and share_to='"+myname+"' ";
		rs=st.executeQuery(sql);
			if(rs.next()){
				c1=rs.getString(1);	
			}
			else{
				c1="Not a Authenticated";
			}
			session.setAttribute("c1",c1);
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
<title>Verify Key</title>
</head>
<body>
	<div class="wrapper">
	<div class="container">
		<h1>File Verification</h1>
		<h2>File name : <%=myfile%></h2><br/>
		<h2>Cipher Key of File: <%=c1%></h2>
		<form class="form" method="post" action="diffie_hellman.jsp">
			<input type="text"  name="privatekey" placeholder="Private Key">
			<button type="submit" id="login-button">Verify</button>
		</form>
		<form class="form" method="post" action="index.html">
			<a href="home.jsp"><button type="button" id="login-button">Go Home</button></a>
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
