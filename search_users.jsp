<%@ page import="java.sql.*" errorPage="error.html" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/style-users.css" />

<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="wrapper">
	<div class="container">
		<h1>Select user to send file</h1>
		<br/>
		<form class="form" method="get" action="index.html">

			<%		
				Statement st = null;
				ResultSet rs = null;
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
					st=con.createStatement();
					String sql="select * from profile";
					rs=st.executeQuery(sql);
					while(rs.next()){%>
                        <a href="send_file.jsp?user=<%=rs.getString("name")%>"><button><%=rs.getString("name")%></button></a><br/><br/> 
            <%}	
			}
			catch (Exception eq4) {
				out.println(eq4.getMessage());
			  }
			%>


			<!-- <a href="send_file.jsp"><button>test</button></a><br/><br/> -->





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
