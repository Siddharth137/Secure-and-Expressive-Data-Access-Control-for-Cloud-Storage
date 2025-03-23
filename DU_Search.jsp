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
.style15 {color: #fff;
	font-weight: bold;
}
.style16 {	font-size: 12px;
	color: #FF0000;
}
.style17 {
	color: #595f61;
	font-size: 16px;
	font-weight: bold;
}
.style18 {
	color: #595f61;
	font-weight: bold;
}
.style19 {font-size: 16px}
.style20 {font-size: 16; }
.style21 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style21">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</a></h1>
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
          <h2><span>Search Files</span></h2>
          <p class="infopost">&nbsp;</p>
		  
		  <%
	String user=(String)application.getAttribute("uname");
	
	String strQuery1 = "select * from request where user='"+user+"'";
	ResultSet rs = connection.createStatement().executeQuery(strQuery1);
	if(rs.next()==true)
	{
	
		String Searchper=rs.getString(3);
		if(Searchper.equalsIgnoreCase("Granted"))
		{
			  %>
		  <form id="form1" name="form1" method="post" action="DU_Search1.jsp">
		<table width="572" border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
				  <tr>
				<th width="236" height="40" bgcolor="#FFFF00" scope="row"><div align="left"><span class="style15"><span class="odd  style16">Enter Multi Keyword To Search : </span></span></div></th>
					<td width="320"><span class="style15">
					  <input required="required" name="t14" type="text" value="" size="30" />
					  <input type="submit" name="Submit2" value="SEARCH DATA" />
					</span></td>
				  </tr>
			</table>
				<p align="center" class="style15">&nbsp;</p>
		  </form>
			<%
		}
		else
		{
				%>
				<h3 class="style33 style17">Search Control Not Granted From Cloud !!</h3>
				<a href="DU_Main.jsp">Back</a><br />
				<%
		}	
	}
	else
	{
			%>
			<h3 class="style33 style18"><span class="style19">You Have Not Requested For Search Control</span> <a href="DU_SearchReq.jsp" class="style20">Click Here To Request</a> !!</h3>
			<a href="DU_Main.jsp">Back</a><br />
			<%
	}	
		%>  
		  
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
          <li><strong><a href="DU_ViewFiles.jsp">View Files </a></strong></li>
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
