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
<title>Auditor File Details</title>
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
.style32 {
	font-size: 12px;
	font-weight: bold;
	color: #FF0000;
}
.style33 {font-size: 12px; color: #6d6d6d; }
.style34 {
	font-size: 24px;
	font-weight: bold;
}
.style35 {
	color: #FF0000;
	font-weight: bold;
}
.style36 {font-weight: bold}
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
          <li><a href="C_Main.jsp">AUDITOR</a></li>
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
          <h2> Auditor File Details </h2>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
	int uid = Integer.parseInt(request.getParameter("usid"));
try 
	{
      		String query="Select  * from auditorf where id='"+uid+"'"; 
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(query);
			while ( rs.next() )
			{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(3);
					s4=rs.getString(4);
					s5=rs.getString(5);
					s6=rs.getString(6);
					s7=rs.getString(7);
					s8=rs.getString(8);
					s9=rs.getString(9);
				}	

		
						%>
          <table width="549" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td width="142" height="36" bgcolor="#FFFF00"><div align="center" class="style29 style32">
                  <div align="left"> ID :</div>
              </div></td>
              <td width="394"><label>
                <input readonly="readonly"  name="textfield" type="text" value="<%=i%>" size="49" />
                </label>              </td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FFFF00"><div align="center" class="style32">
                  <div align="left">File Name : </div>
              </div></td>
              <td><input readonly="readonly"  name="textfield2" type="text" size="49" value="<%=s2%>" />              </td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FFFF00"><div align="center" class="style32">
                  <div align="left">Index : </div>
              </div></td>
              <td><input readonly="readonly"  name="textfield22" type="text" size="49" value="<%=s3%>" /></td>
            </tr>
            <tr>
              <td height="186" bgcolor="#FFFF00"><div align="center" class="style32">
                  <div align="left">Contents :</div>
              </div></td>
              <td><label>
                <textarea readonly="readonly" rows="10"  cols="50"  name="textarea"><%=s4%></textarea>
                </label>              </td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FFFF00"><div align="center" class="style32">
                  <div align="left">MAC :</div>
              </div></td>
              <td><input readonly="readonly"  name="textfield3" type="text" value="<%=s5%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FFFF00"><div align="center" class="style32">
                  <div align="left">Rank : </div>
              </div></td>
              <td><input readonly="readonly"  name="textfield32" type="text" value="<%=s7%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FFFF00"><div align="center" class="style32">
                  <div align="left">Date &amp; Time :</div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s8%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FFFF00"><div align="center" class="style33">
                  <div align="left" class="style35">Data Owner : </div>
              </div></td>
              <td><input readonly="readonly"  name="textfield34" type="text" value="<%=s9%>" size="49" /></td>
              <%
			 		
           connection.close();
	  }
	 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
            </tr>
          </table>
          <p align="right"><a href="A_ViewFiles.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu style36">
          <li><a href="C_Main.jsp">Home</a></li>
          <li><a href="C_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">v</div>
</div>
<div align=center></div>
</body>
</html>
