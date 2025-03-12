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
.style18 {color: #0d6887}
.style19 {font-weight: bold; font-size: 24;}
.style20 {color: #595f61}
.style25 {font-size: 18px}
.style26 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style27 {font-weight: bold}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style26">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</a></h1>
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
          <h2><span>Keyword Search Model </span></h2>
          <p>&nbsp;</p>
          <h3 align="center" class="style25 style18"><strong>Keyword Data Search Model </strong></h3>
          <table width="465" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td width="227"><div align="center" class="style18"><span class="style19">File Name</span></div></td>
              <td width="232"><div align="center" class="style18"><span class="style19">Count</span></div></td>
            </tr>
            <%	  
			  
			  
	String s1="",s3="",s4="",s6="",s7="",s8="",s9="",s10="",s11,s12,s13;
	int i=0,j=0,k=0,s2=0,s5=0;
    String user=(String)application.getAttribute("uname");
try 
	{
		String query="SELECT distinct(fname),count(keyword) FROM searchhistory group by fname"; 
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery(query);
		while ( rs.next() )
		{
			s1=rs.getString(1);
			s2=rs.getInt(2);
			
			%>
			<tr>
			<td><div align="center" class="style20 style20"><%=s1%></div></td>
			<td><div align="center" class="style20 style20"><%=s2%></div></td>
			</tr>
			<%  
		}
		%>
		</table>
		<p align="center"><a href="C_PersonalizedGraph.jsp">View Keyword Search Graph </a></p>
		<p>&nbsp;</p>
		<h3 align="center" class="infopost style25 style18">Highest Keyword Data Search Model </h3>
		<table width="465" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
		<tr>
		<td width="227"><div align="center" class="style18"><span class="style19">File Name</span></div></td>
		<td width="232"><div align="center" class="style18"><span class="style19">Count</span></div></td>
		</tr>
		<%	  
		
		int count=0;
		String query1="SELECT  fname, cnt FROM (select fname,count(keyword) as cnt from searchhistory group by fname order by count(keyword) desc) searchhistory"; 
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(query1);
		while ( rs1.next() )
		{
		
			s4=rs1.getString(1);
			s5=rs1.getInt(2);
			/*al.add(s4);
			al1.add(s5);*/
			
			String quer="select fname,count(keyword) from searchhistory group by fname order by count(keyword) desc"; 
			Statement st2=connection.createStatement();
			ResultSet rs2=st2.executeQuery(quer);
			if ( rs2.next() )
			{
				count=rs2.getInt(2);
				//int fname=rs2.getInt(1);
			}
			
				if (count==s5)
				{
					
					%>
					<tr>
					<td><div align="center" class="style20 style20"><%=s4%></div></td>
					<td><div align="center" class="style20 style20"><%=s5%></div></td>
					</tr>
					
					<% 
				}
			
		}
		
		connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </table>
          <p align="center"><span class="infopost"><a href="C_HighestPersonalizedGraph.jsp">View Highest Keyword Search Graph </a></span></p>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu style27">
          <li><a href="C_Main.jsp">Home</a></li>
          <li><a href="C_ViewFiles.jsp">View Files</a></li>
          <li><a href="C_Transactions.jsp">Transactions</a></li>
          <li><a href="C_TopSearched.jsp">Top Searched</a></li>
          <li><a href="C_Attackers.jsp">View Attackers</a> </li>
          <li><a href="C_UserAutho.jsp">Authorize Users</a></li>
          <li><a href="C_OwnerAutho.jsp">Authorize Owners</a></li>
          <li><a href="C_GrantSearch.jsp">Search Requests</a></li>
          <li><a href="C_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
