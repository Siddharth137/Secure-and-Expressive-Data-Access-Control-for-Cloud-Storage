<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data Owner </title>
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
.style13 {font-size: 12px;
	color: #504b4b;
}
.style31 {font-size: 16px}
.style32 {color: #0d6887}
.style33 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style34 {font-weight: bold}
.style35 {color: #FFFF00}
-->
</style>

</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style33">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</a></h1>
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
          <h2>Upload  Encrypted File </h2>
          <p class="infopost">&nbsp;</p>
          <form action="DO_Upload2.jsp" method="post">
            <p>
    <%
      	try 
		{
      		String file=request.getParameter("tt");
			application.setAttribute("file1",file);
      		String cont=request.getParameter("text");
      		String index=request.getParameter("indexname");
			
			String query1="select * from cloudserver  where fname='"+file+"' "; 
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query1);
	
		if ( rs1.next())
		{
			 %>
            </p>
            <h3 class="pages style10 style31">File Name <span class="style32">Already Exists</span> !</h3>
            <p>
             <%
		}
		else
		{

      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
			String namefile=request.getRealPath("file");
			
			byte[] keyValue = keys.getBytes();
			Key key = new SecretKeySpec(keyValue, "AES");
			Cipher c = Cipher.getInstance("AES");
			c.init(Cipher.ENCRYPT_MODE, key);
			String encryptedValue = new String(Base64.encode(cont.getBytes()));
			String encryptedIndex = new String(Base64.encode(index.getBytes()));
			
			
      		PrintStream p = new PrintStream(new FileOutputStream(namefile+"/"));
			p.print(new String(cont));
			
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(namefile+"/");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
			//Read the bis so SHA1 is auto calculated at dis
			while (true) 
			{
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
%>
            </p>
            <table width="491" border="0" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
              <tr>
                <td width="113" height="35" bgcolor="#FF0000"><span class="odd style13 style35"><strong>File Name : </strong> </span></td>
                <td width="432"><input name="t42" type="text" id="t42" size="49" value="<%= file %>" readonly="readonly" /></td>
              </tr>
              <tr>
                <td height="35" bgcolor="#FF0000"><span class="odd style13 style35"><strong>Index : </strong> </span></td>
                <td><input name="enIndex" type="text" size="49" value="<%= encryptedIndex %>" readonly="readonly"/></td>
              </tr>
              <tr>
                <td height="252" bgcolor="#FF0000"><span class="style35"></span></td>
                <td><textarea name="text2" cols="50" rows="15" readonly="readonly"><%= encryptedValue %></textarea></td>
              </tr>
              <tr>
                <td height="35" bgcolor="#FF0000"><span class="odd style13 style32"><strong>MAC : </strong></span></td>
                <td><input name="t4" type="text" id="t4" size="49" value="<%= h1 %>" readonly="readonly" /></td>
              </tr>
              <tr>
                <td height="35"><div align="right"> </div></td>
                <td><input type="submit" name="Submit2" value="Upload" /></td>
              </tr>
            </table>
            <label></label>
            <p align="right">
              <%

	   
			}
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
            <a href="DO_Main.jsp">Back</a>            </p>
          </form>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
         <ul class="sb_menu style34">
          <li><a href="DO_Main.jsp">Home</a></li>
          <li><a href="DO_Attackers.jsp">Attackers</a></li>
          <li><a href="DO_ViewFiles.jsp">View Files</a></li>
          <li><a href="DO_Delete.jsp">Delete Files</a></li>
          <li><a href="DO_Transactions.jsp">Transactions</a></li>
          <li><a href="DO_Login.jsp">Logout</a></li>
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
