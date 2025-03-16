<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner Main</title>
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
.style24 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style25 {
	font-size: 14px;
	color: #FFFF00;
	font-weight: bold;
}
.style26 {font-weight: bold}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style24">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="DO_Main.jsp"><span>Data Owner </span></a></li>
          <li><a href="DO_Login.jsp">Logout</a></li>
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
          <h2>Verify  File</h2>
          <p>&nbsp;</p>
           
          <%
	 	
	 	String csmac=null, ownermac=null,ocon=null,csname=null;
		
			
				String omac="";

	 	try {
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		
			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
		
		
			
	 		String file = request.getParameter("fname");
	
	 		Statement st = connection.createStatement();

	 		String on=(String)application.getAttribute("doname");


	 		String strQuery2 = "select * from cloudserver where fname='"
	 				+ file + "' and downer='" + on + "'";
	 	

	 		ResultSet rs = st.executeQuery(strQuery2);
	 		if (rs.next()) {
	 			
	 			csmac = rs.getString("trapdoor");//mac
			
	 			
	 			}
				
				
				else if (rs.next()!=true) {
								%>
<p>
<h2><%=file %>  is Not Found in the Cloud Server !!!</h2>
</p>
<%				
					 		}
        
					String strQuery3 = "Select * FROM dataowner where fname='"
									+ file + "' and downer='" + on + "' ";

							ResultSet rss = st.executeQuery(strQuery3);
							if (rss.next()) {
								
								ownermac = rss.getString("trapdoor");//mac
								
								}

							
					
							if(csmac.equals(ownermac) )
							{
							%>
<p>
<h1><%=file %>  is Secured !!!</h1>
</p>

<%
							}	
							else {
							
							
						
								%>
<p>
<h2><%=file %>  is Attacked by Attacker !!! </h2>  <br />

</p>
<%				
					 		}
							
							
							
						 						
		  	connection.close();

		  	}catch (Exception e) {
		  		out.println(e.getMessage());
		  		e.printStackTrace();
		  	} %>
        

          <p>&nbsp;</p>
          <p align="right"><a href="DO_Main.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
         <ul class="sb_menu style26">
          <li><a href="DO_Main.jsp">Home</a></li>
          <li><a href="DO_Attackers.jsp">Attackers</a></li>
          <li><a href="DO_Upload.jsp">Upload File</a></li>
          <li><a href="DO_Delete.jsp">Delete Files</a></li>
          <li><a href="DO_Transactions.jsp">Transactions</a></li>
          <li><a href="DO_Login.jsp">Logout</a></li>
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
