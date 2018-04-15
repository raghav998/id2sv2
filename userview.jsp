<%@ page import="java.sql.*, javax.sql.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<html>
<head>
<title>ID2S</title>
</head>

<body>
<%
         try{

		Blob b = (Blob)session.getAttribute("resumeBlob");

		if(b != null)
		{
			String fileName =(String)session.getAttribute("filename");
			fileName+="";
			byte[] ba = b.getBytes(1, (int)b.length());
			response.setContentType("text/plain");
			response.setHeader("Content-Disposition","attachment; filename=\""+fileName+"\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
			response.sendRedirect("home.jsp");
			//session.removeAttribute("document1");
			}
			else
		{
			//response.sendRedirect("agentsuccess.jsp");
		}
			}
			catch(Exception e)
			{
			out.println("Exception :"+e);
			}



%>

</body>
</html>
