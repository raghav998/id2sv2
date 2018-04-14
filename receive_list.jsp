<%@page import="java.sql.*,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
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
		<h1>Received Files</h1>
		<br/>

		<%
			Statement st = null;
			ResultSet rs = null;
			int file_count=0;
			String myname=(String)session.getAttribute("myname");
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
				st=con.createStatement();
				String sql="select count(id) from share where share_to=\""+myname+"\"";
				rs=st.executeQuery(sql);
				while(rs.next())
					file_count=rs.getInt(1);
			}catch(Exception e){
				System.out.println("Error");
			}
		%>

<%if(file_count!=0) {%>
		<table align="center" border="1" width="100%">
			<tr>
				<th width="10%">No.</th>
				<th width="30%">From</th>
				<th width="40%">File Name</th>
				<th width="20%">Operation</th>
			</tr>
			<%
				String sql1="select share_from,title from share where share_to=\""+myname+"\"";
				rs=st.executeQuery(sql1);
				int count=1;
				while(rs.next()){

					%>
					<tr class="row">
						<td><%=count%></td>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<!-- <td> <form action="check_key.jsp?file=<%=rs.getString(2)%>" method="get"><button type="submit"  class="download">Download</button></form> </td> -->
						<td> <form method="get"><a href="check_key.jsp?file=<%=rs.getString(2)%>"><button type="button" class="download">Download</button></a></form> </td>
					</tr>
					<%
					count++;

				}
			%>
		</table>

<%}
else {%>

		No Files available
	<%}%>


		<form class="form" method="post" action="home.jsp">
			<button type="submit" id="login-button">Go Back</button>
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
