<%
	String check_name=(String)session.getAttribute("myname");
	if(check_name.equals(null)){
		response.sendRedirect("index.html");
	}
%>
<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/style.css" />

<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<div class="wrapper">
	<div class="container">
		<h1>Welcome <%=myname%></h1>
		<br/>
		<!-- <a href="search_users.jsp"> <img src="https://cdn4.iconfinder.com/data/icons/flatified/512/plane.png" height="60%" width="30%"><img src="/home/raghav/Pictures/send.gif"> </a> -->
		<form action="search_users.jsp">
		<button type="submit" >Share</button>
		</form>
		<form action="receive_list.jsp">
		<button type="submit" >Received List</button>
		</form>
		<!-- <img src="https://cdn0.iconfinder.com/data/icons/large-glossy-icons/512/Save_data.png" height="50%" width="25%"> -->
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
