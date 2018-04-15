<%@page import="com.oreilly.servlet.*,java.sql.*,java.math.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import="ElGamal.*"%>
<html>
<head>
</head>
<body>

<%
		//Key Generation
		KeyGeneration keygen=new KeyGeneration();

		System.out.println("****************");
	        System.out.println("\n");
	        System.out.println("Server 1 Registration");
	        System.out.println("\n");
	    System.out.println("****************");

		String bint = keygen.generate_Primekey();
		String temp[]=bint.split(",",3);
		BigInteger b1=new BigInteger(temp[0]);
		BigInteger b2=new BigInteger(temp[1]);

		int y= (int)(Math.random()*200);

		Statement st = null;
		ResultSet rs=null;
		int id=0;
		Connection con=null;

	try{

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/server1","root","toor");
			

			System.out.println("Connection established");
			System.out.println("before Statement");

			st=con.createStatement();
			String sql1="select max(id) from profile";

			System.out.println("after Statement");


			rs=st.executeQuery(sql1);
			System.out.println("query for id is executed");

			while(rs.next())
				if(rs.getInt(1)==0)
					id=1;
				else
					id=rs.getInt(1)+1;

			System.out.println("max id is "+id);


		String name=null,gender=null,email=null,password=null,status="Allow",image=null,mobile=null,location=null;

		name=request.getParameter("name");
		email=request.getParameter("email");
		password=request.getParameter("password");

		location=request.getParameter("location");

		sql1="select count(id) from profile where name=\""+name+"\"";
		rs=st.executeQuery(sql1);
		rs.next();
		if(rs.getInt(1)!=0){
			response.sendRedirect("register.jsp");
		}

		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;

		 System.out.println("name "+name+" mail "+email+" password "+password+" location "+location+" date "+date+" simple date "+strDateNew);
		 System.out.println("primekey "+ temp[0]+"generatorkey " + temp[1]+"sc"+ temp[2]);


		try {

			PreparedStatement ps=con.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?,?)");

               	ps.setInt(1,id);
				ps.setString(2,name);
       			ps.setString(3,email);
       			ps.setString(4,password);
			    ps.setString(5,location);
			    ps.setString(6,temp[0]);
				ps.setString(7,temp[1]);
				ps.setString(8,temp[2]);

			int x=ps.executeUpdate();
			System.out.println("data updated");
			if(x==0)
			{
				response.sendRedirect("error.html");
			}

		}
		catch (Exception e)
		{
			out.println(e.getMessage()+" Error Here");
		}
	}
	catch (Exception eq)
		{
			out.println(eq.getMessage()+" Error Here too");
			eq.printStackTrace();
		}
		finally{
			con.close();
			System.out.println("Connection closed");
			
		}


		System.out.println("****************");
	        System.out.println("\n");
	        System.out.println("Server 2 Registration");
	        System.out.println("\n");
	    System.out.println("****************");

		Statement st1 = null;
		ResultSet rs1=null;
		id=0;
		Connection con1=null;	    

			try{

		Class.forName("com.mysql.jdbc.Driver");
		con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/server2","root","toor");
		System.out.println("Connection established");

			st1=con1.createStatement();

			System.out.println("Statement created");

			String sql1="select max(id) from profile";
			rs1=st1.executeQuery(sql1);
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



			PreparedStatement ps=con1.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?)");

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

				// response.sendRedirect("successfull-signup.html");
				
				response.sendRedirect("sendkey.jsp");
			}
			else
			{
				// response.sendRedirect("home.html?message=fail");

				response.sendRedirect("error.html");
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
			con1.close();
			System.out.println("Connection closed");
		}


 %>
</body>
</html>
