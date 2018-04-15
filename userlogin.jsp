<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*"%>
<html>
<head>
<title>Logging in</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
System.out.println("user login jsp file");
Statement st = null;
ResultSet rs = null;
String name = request.getParameter("name");
String password = request.getParameter("password");
if(name.equals("admin@gmail.com") && password.equals("admin")){
	response.sendRedirect("addquestion.jsp");
}
session.setAttribute("password",password);
session.setAttribute("name",name);

	System.out.println("username "+name+" password "+password);

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");

	System.out.println("connection established");

	st = con.createStatement();

	System.out.println("Statement created");

	String qry ="select * from profile where  name='"+name+"' AND password='"+password+"'";
	rs = st.executeQuery(qry);

	System.out.println("query executed.query was "+qry);

	if(!rs.next()){
		System.out.println("username or password errror");
	   // out.println("Enter correct Username, password"); 
		response.sendRedirect("index-error.html");
	}
	else{
		System.out.println("---------------------");
		System.out.println("Successfully login by "+rs.getString("name"));
		System.out.println("---------------------");
		session.setAttribute("myid",Integer.toString(rs.getInt("id")));
		session.setAttribute("myname",rs.getString("name"));
		session.setAttribute("myemail",rs.getString("email"));

		session.setAttribute("mylocation",rs.getString("location"));
		response.sendRedirect("home.jsp");
	}
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>
