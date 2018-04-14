<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%

String emailid=(String)session.getAttribute("myemail");
String pkey=(String)session.getAttribute("privatekey");

String myname=(String)session.getAttribute("myname");

String host="", user="", pass="";

host ="smtp.gmail.com"; //"smtp.gmail.com";

user ="id2s.no.reply@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

pass ="vijayvijay"; //Your gmail password

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to =emailid; // out going email id

String from ="id2s.no.reply@gmail.com"; //Email id of the recipient
String subject="Successfully Registered on both servers";
//String subject ="welcome";

String messageText ="Hello "+myname+",\nYou have successfully registered on both servers.\nYour Private Key is "+pkey+ "\nNote:- Keep this key secure.This is the key used to transfer files over secure ID2S Protocol\n Thanks";


session.setAttribute("emailid",emailid);
boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());
//out.println("message successfully sended"); // assume it was sent
//response.sendRedirect("home.html?message=Successfully key sent to your mail id");
response.sendRedirect("successfull-signup.html");
}
catch (Exception err) {

out.println("message not successfully sended"); // assume it�s a fail
}
transport.close();

%>
