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
.style26 {color: #FFFFFF}
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
          <h2><span>View Files</span></h2>
          <p class="infopost">&nbsp;</p>
          <table width="451" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
				%>
            <tr>
              <td width="61" height="30" bgcolor="#FF0000"><div align="center" class="style25"> ID </div></td>
              <td width="111" bgcolor="#FF0000"><div align="center" class="style25">File Name </div></td>
              <td width="124" bgcolor="#FF0000"><div align="center" class="style25">Data Owner </div></td>
              <td width="145" bgcolor="#FF0000"><div align="center" class="style25">Date &amp; Time </div></td>
            </tr>
            <%
				
				String query1="Select *from cloudserver  "; 
				Statement st=connection.createStatement();
				ResultSet rs1=st.executeQuery(query1);
				while ( rs1.next()==true )
				{
					i=rs1.getInt(1);
					s1=rs1.getString(2);
					s2=rs1.getString(8);
					s3=rs1.getString(9);
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String dt1 = new String(Base64.decode(s2.getBytes()));
				

					
					%>
            <tr>
              <td height="28" bgcolor="#000000"><div align="center" class="style26"><%=i%></div></td>
              <td bgcolor="#000000"><div align="center" class="style26"><%=s1%></div></td>
              <td bgcolor="#000000"><div align="center" class="style26"><%=s3%></div></td>
              <td bgcolor="#000000"><div align="center" class="style26"><%=dt1%></div></td>
            </tr>
            <%
			
		}	
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </table>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
       <div class="gadget">
        <h2 class="star">Menu</h2>
        <div class="clr"></div>
        <ul class="sb_menu">
          <li><strong><a href="DU_Main.jsp">Home</a></strong></li>
          <li><strong><a href="DU_Profile.jsp">My Profile</a></strong></li>
          <li><strong><a href="DU_Search.jsp">Search Files</a></strong></li>
          <li><strong><a href="DU_Ratio.jsp">Search Ratio</a></strong></li>
          <li><strong><a href="DU_TopkDoc.jsp">Top K Search </a></strong></li>
          <li><strong><a href="DU_SearchReq.jsp">Req Search Control</a></strong></li>
          <li><strong><a href="DU_Login.jsp">Logout</a></strong></li>
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
