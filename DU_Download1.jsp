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
.style23 {color: #595f61}
.style24 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style25 {
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
          <h2><span>Download File</span></h2>
          <p class="infopost">&nbsp;</p>
          <form action="DU_Download2.jsp" method="post" name="form1" id="form1">
            <p>
              <%
		  
	try 
	{
		String file = request.getParameter("t1");
		String trapdoor="";
		String sk="",pk1="",pk2="";
		String user=(String) application.getAttribute("uname");
		
		String yes="Permitted";
			
			/*String Query="select * from request  where user='"+user+"' and fname='"+file+"' and decrypt='"+yes+"'"; 
       		Statement st=connection.createStatement();
       		ResultSet rs=st.executeQuery(Query);
			if ( rs.next() )
			{*/
			
				String Query1 = "select * from cloudserver where fname='"+file+"'";
				ResultSet rs1 = connection.createStatement().executeQuery(Query1);
					if(rs1.next()==true)
					{
						trapdoor=rs1.getString(5);
						sk=rs1.getString(6);
%>
            </p>
            <table width="522" border="0" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
              <tr>
                <td width="143" height="35" bgcolor="#FF0000"><span class="style25">Enter File Name :</span></td>
                <td width="379"><span class="style23">
                  <label>
                  <input required="required" name="t1" type="text" value="<%=file%>" size="40" />
                  </label>
                </span></td>
              </tr>
              <tr>
                <td height="41" bgcolor="#FF0000"><span class="style25">MAC :</span></td>
                <td><input name="t12" type="text" value="<%=trapdoor%>" size="40" /></td>
              </tr>
              <tr>
                <td height="40" bgcolor="#FF0000"><span class="style25">Secret Key :</span></td>
                <td><input name="t13" type="text" value="<%=sk%>" size="40" /></td>
              </tr>
              <tr>
                <td height="41"><div align="right"></div></td>
                <td><input name="Submit2" type="submit" value="Download" /></td>
              </tr>
            </table>
            <p>
              <%
							
			
					
					}
					else
					{
						%>
            </p>
            <h3 class="style23">File Doesn't Exist !!!</h3>
            <p>
              <%
					}
			
		connection.close();
	}
	
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
            </p>
            <p align="right"><a href="DU_Search.jsp">Back</a> </p>
          </form>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
       <div class="gadget">
        <h2 class="star">Menu</h2>
        <div class="clr"></div>
        <ul class="sb_menu style26">
          <li><a href="DU_Main.jsp">Home</a></li>
          <li><a href="DU_Profile.jsp">My Profile</a></li>
          <li><a href="DU_ViewFiles.jsp">View Files </a></li>
          <li><a href="DU_Search.jsp">Search Files</a></li>
          <li><a href="DU_Ratio.jsp">Search Ratio</a></li>
          <li><a href="DU_TopkDoc.jsp">Top K Search</a></li>
          <li><a href="DU_SearchReq.jsp">Req Search Control</a></li>
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
