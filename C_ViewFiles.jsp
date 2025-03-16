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
<title>Cloud </title>
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
.style1 {font-size: 36px}
.style26 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style27 {font-size: 14px; color: #FF0000; font-weight: bold; }
.style28 {color: #FFFFFF}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1"><span class="style26">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</span><br />
        </a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="C_Main.jsp">Cloud</a></li>
          <li><a href="C_Login.jsp"><span>Logout </span></a></li>
          <li></li>
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
          <h2>View Files </h2>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <table width="634" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
				%>
            <tr>
              <td width="34" height="30" bgcolor="#FFFF00"><div align="center" class="style27"> ID </div></td>
              <td width="98" bgcolor="#FFFF00"><div align="center" class="style27">File Name </div></td>
              <td width="241" bgcolor="#FFFF00"><div align="center" class="style27">Index Name </div></td>
              <td width="145" bgcolor="#FFFF00"><div align="center" class="style27">Date &amp; Time </div></td>
              <td width="104" bgcolor="#FFFF00"><div align="center" class="style27">Data Owner </div></td>
            </tr>
            <%
				
				String query1="Select *from cloudserver   "; 
				Statement st=connection.createStatement();
				ResultSet rs1=st.executeQuery(query1);
				while ( rs1.next()==true )
				{
				
					i=rs1.getInt(1);
					s1=rs1.getString(2);
					s2=rs1.getString(3);
					s3=rs1.getString(8);
					s4=rs1.getString(9);
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.ENCRYPT_MODE, key);
					String do1 = new String(Base64.encode(s4.getBytes()));
					
					%>
					<tr>
					<td height="28" bgcolor="#000000"><div align="center" class="style28"><%=i%></div></td>
					<td bgcolor="#000000"><div align="center" class="style28"><a href="C_FileDetails.jsp?usid=<%=i%>"><%=s1%></a></div></td>
					<td bgcolor="#000000"><div align="center" class="style28"><%=s2%></div></td>
					<td bgcolor="#000000"><div align="center" class="style28"><%=s3%></div></td>
					<td bgcolor="#000000"><div align="center" class="style28"><%=do1%></div></td>
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
          <p>&nbsp;</p>
          <p align="right"><a href="C_Main.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
          <li><em><strong><a href="C_Main.jsp">Home</a></strong></em></li>
          <li><em><strong><a href="C_Transactions.jsp">Transactions</a></strong></em></li>
          <li><em><strong><a href="C_TopSearched.jsp">Top Searched</a></strong></em></li>
          <li><em><strong><a href="C_Attackers.jsp">View Attackers</a> </strong></em></li>
          <li><em><strong><a href="C_UserAutho.jsp">Authorize Users</a></strong></em></li>
          <li><em><strong><a href="C_OwnerAutho.jsp">Authorize Owners</a></strong></em></li>
          <li><em><strong><a href="C_GrantSearch.jsp">Search Requests</a></strong></em></li>
          <li><em><strong><a href="C_PersonalizedModel.jsp">
Multikeyword Search Model</a></strong></em></li>
          <li><em><strong><a href="C_Login.jsp">Logout</a></strong></em></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&nbsp;</p>
      <p class="rf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
