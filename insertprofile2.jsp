<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>

<html>
<head>
</head>
<body>

<%
		System.out.println("****************");
	        System.out.println("\n");
	        System.out.println("Server 2 Registration");
	        System.out.println("\n");
	    System.out.println("****************");

		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		Connection con=null;

	try{

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server2","root","toor");
		System.out.println("Connection established");

			st=con.createStatement();

			System.out.println("Statement created");

			String sql1="select max(id) from profile";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;

					System.out.println("max id is "+id);

		String name=null,gender=null,email=null,password=null,status="Allow",image=null,pkey=null,location=null;

		name=request.getParameter("name");
		session.setAttribute("myname",name);
		email=request.getParameter("email");
		session.setAttribute("myemail",email);
		password=request.getParameter("password");

		location=request.getParameter("location");
		pkey=request.getParameter("pkey");
		session.setAttribute("privatekey",pkey);

		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;

		 System.out.println("Data - Name :"+name+" mail "+email+" password "+password+" location "+location+" key "+pkey+" date "+date+" simple date "+strDateNew);


		try {



			PreparedStatement ps=con.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?)");

               	ps.setInt(1,id);
				ps.setString(2,name);
       			ps.setString(3,email);
       			ps.setString(4,password);
			    ps.setString(5,location);
			    ps.setString(6,pkey);
			int x=ps.executeUpdate();

			if(x!=0)
			{
				// response.sendRedirect("home.html?message=Successfully Registered");

				response.sendRedirect("sendkey.jsp?message=SuccessfullyRegistered");
			}
			else
			{
				// response.sendRedirect("home.html?message=fail");

				response.sendRedirect("sendkey.jsp?message=fail");
			}

		}
		catch (Exception e)
		{
			out.println(e.getMessage());
		}
			}
	}
	catch (Exception eq)
		{
			out.println(eq.getMessage());
		}
		finally{
			con.close();
			System.out.println("Connection closed");
		}


 %>
</body>
</html>
