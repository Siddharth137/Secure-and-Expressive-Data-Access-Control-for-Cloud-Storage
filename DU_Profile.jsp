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
.style2 {
	color: #0d6887;
	font-weight: bold;
}
.style3 {color: #595f61}
.style4 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style5 {color: #FFFF00}
.style6 {color: #FFFF00; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style4">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</a></h1>
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
          <h2><span><%=application.getAttribute("uname")%>'s Profile </span></h2>
          <p class="infopost">&nbsp;</p>
          <table width="546" height="311" border="2" align="center"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse; ">
            <%
						String uname = (String)application.getAttribute("uname");
						//int uid = Integer.parseInt(mid);
						String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
						int i=0;
						try 
						{
						   	String query="select * from user where name='"+uname+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		if ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(7);
								//s6=rs.getString(8);
								//s7=rs.getString(9);
								//s8=rs.getString(8);
								
								
								
								
								
					%>
            <tr>
              <td rowspan="8"><div style="margin:10px 13px 10px 13px;" >
                  <input  name="image" type="image" src="profileimage.jsp?imgid=<%=i%>" style="width:190px; height:190px;" />
              </div></td>
            </tr>
            <tr>
              <td  width="150" height="40" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left" class="style2 style5" style="margin-left:20px;">
                <div align="left">Username</div>
              </div></td>
              <td  width="300" valign="middle" height="40" style="color:#000000;"><div align="left" class="style3" style="margin-left:20px;">
                  <%out.println(s1);%>
              </div></td>
            </tr>
            <tr>
              <td  width="120" height="40" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left" class="style6" style="margin-left:20px;">
                <div align="left">E-Mail</div>
              </div></td>
              <td  width="72" valign="middle" height="40" style="color:#000000;"><div align="left" class="style3" style="margin-left:20px;">
                  <%out.println(s2);%>
              </div></td>
            </tr>
            <tr>
              <td  width="100" height="40" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left" class="style6" style="margin-left:20px;">
                <div align="left">Mobile</div>
              </div></td>
              <td  width="82" valign="middle" height="40"><div align="left" class="style3" style="margin-left:20px;">
                  <%out.println(s3);%>
              </div></td>
            </tr>
            <tr>
              <td  width="100" height="40" align="left" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left" class="style6" style="margin-left:20px;">
                <div align="left">Date Of Birth</div>
              </div></td>
              <td  width="82" align="left" valign="middle" height="40"><div align="left" class="style3" style="margin-left:20px;">
                  <%out.println(s5);%>
              </div></td>
            </tr>
            <tr>
              <td  width="100" height="40" align="left" valign="middle" bgcolor="#FF0000" style="color: #2c83b0;"><div align="left " class="style6" style="margin-left:20px;">
                <div align="left">Address</div>
              </div></td>
              <td  width="82" align="left" valign="middle" height="40"><div align="left" class="style3" style="margin-left:20px;">
                  <%out.println(s4);%>
              </div></td>
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
          <p align="right"><a href="DU_Main.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
       <div class="gadget">
        <h2 class="star">Menu</h2>
        <div class="clr"></div>
        <ul class="sb_menu">
          <li><strong><a href="DU_Main.jsp">Home</a></strong></li>
          <li><strong><a href="DU_ViewFiles.jsp">View Files </a></strong></li>
          <li><strong><a href="DU_Search.jsp">Search Files</a></strong></li>
          <li><strong><a href="DU_Ratio.jsp">Search Ratio</a></strong></li>
          <li><strong><a href="DU_TopkDoc.jsp">Top K Search</a></strong></li>
          <li><strong><a href="DU_SearchReq.jsp">Req Search Control</a></strong></li>
          <li><strong><a href="DU_Login.jsp">Logout</a></strong></li>
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
