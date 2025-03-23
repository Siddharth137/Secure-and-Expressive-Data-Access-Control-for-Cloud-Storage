<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data User </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style30 {
	font-size: 16px;
	font-weight: bold;
	color: #595f61;
}
.style6 {
	font-size: 16px;
	font-weight: bold;
	color: #595f61;
}
.style31 {
	color: #595f61;
	font-size: 16px;
}
.style33 {font-size: 12px; }
.style34 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style35 {font-weight: bold}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style34">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="DU_Main.jsp">Data User</a></li>
          <li><a href="DU_Login.jsp"> Logout </a><a href="about.html"></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Request Search Control</span></h2>
          <p class="infopost style31">&nbsp;</p>
          <p class="style31">&nbsp;</p>
          <span class="style31">
          <%
try
{
	
	String owner = request.getParameter("t142");
	String fname = request.getParameter("t14");
	String uname=(String)application.getAttribute("uname");
	String generate ="Requested";
	String s="null";
	
	
	String query="select * from request  where user='"+uname+"' and SearchPer!='"+s+"'"; 
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery(query);
	
	if ( rs.next()==true)
	{
		%>
          </span>
          <p class="style30">Request Already Sent To Semi Trusted Authority!</p>
          <p class="style30"><a href="DU_SearchReq.jsp" class="style33">Back</a></p>
          <span class="style31">
          <%	
	}
	else
	{	
			String query4="insert into request(user,SearchPer) values('"+uname+"','"+generate+"')";
			connection.createStatement().executeUpdate(query4); 
			
			
					
					%>
		  </span>
					<p class="style30">Request Sent <span class="style6">To Semi Trusted Authority</span> ! </p>
					<p class="style6"><a href="DU_SearchReq.jsp" class="style33">Back</a></p>
					<p class="style6">
					<%
			
		}
	
	connection.close();
} 
catch(Exception e)
{
out.println(e.getMessage());
}
	%></p>
        </div>
      </div>
      <div class="sidebar">
       <div class="gadget">
        <h2 class="star">Menu</h2>
        <div class="clr"></div>
        <ul class="sb_menu style35">
          <li><a href="DU_Main.jsp">Home</a></li>
          <li><a href="DU_Profile.jsp">My Profile</a></li>
          <li><a href="DU_ViewFiles.jsp">View Files </a></li>
          <li><a href="DU_Search.jsp">Search Files</a></li>
          <li><a href="DU_Ratio.jsp">Search Ratio</a></li>
          <li><a href="DU_TopkDoc.jsp">Top K Search </a></li>
          <li><a href="DU_Login.jsp">Logout</a></li>
          </ul>
       </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
