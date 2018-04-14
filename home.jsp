<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
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
		<h1>Welcome <%=myname%></h1>
		<br/>
		<!-- <a href="search_users.jsp"><img src="https://cdn4.iconfinder.com/data/icons/flatified/512/plane.png" height="60%" width="30%"></a> -->
		<form action="search_users.jsp">
		<button type="submit" >Share</button><br/>
		</form>
		<!-- <img src="https://cdn0.iconfinder.com/data/icons/large-glossy-icons/512/Save_data.png" height="50%" width="25%"> -->
		<form class="form" method="post" action="index.html">
			<!-- <input type="text" placeholder="Username" name="name">
			<input type="password" placeholder="Password" name="password">
			New user? <a href="register.html">Click here to Signup</a><br/> -->
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
