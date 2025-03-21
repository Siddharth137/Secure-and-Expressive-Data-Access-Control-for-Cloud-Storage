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
.style16 {font-size: 12px}
.style10 {font-size: 24px;
	color: #3f3f3f;
	font-weight: bold;
}
.style7 {font-size: 16px}
.style17 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style18 {font-weight: bold}
-->
</style>

</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style17">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</a></h1>
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
          <h2> Upload Status   </h2>
          <div class="img">
            <%

      	try 
	{
	
			long stime=System.currentTimeMillis();
      		String file=request.getParameter("t42");
      		String cont=request.getParameter("text2");
      		String mac =request.getParameter("t4");
      		String index =request.getParameter("enIndex");
			
			String dname=(String)application.getAttribute("doname");
			
      		String keys = "ef50a0ef2c3e3a5f";

      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
				byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String dt1 = new String(Base64.encode(dt.getBytes()));
			
      		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
				Cipher encoder = Cipher.getInstance("RSA");
				KeyPair kp = kg.generateKeyPair();

				Key pubKey = kp.getPublic();

				byte[] pub = pubKey.getEncoded();
//				System.out.println("PUBLIC KEY" + pub);
		
				String pk = String.valueOf(pub);
				String rank="0";
			
				String pkey1=pk.substring(0,5);
				String pkey2=pk.substring(5);
			
				Statement st=connection.createStatement();
				Statement st111=connection.createStatement();

				String task="Upload";
				String strQuery2 = "insert into transaction(user,fname,task,dt) values('"+dname+"','"+file+"','"+task+"','"+dt+"')";
				st.executeUpdate(strQuery2);
				
				String No="No";
st.executeUpdate("insert into  cloudserver(fname,ct,findex,trapdoor,sk,rank,dt,downer) values ('"+file+"','"+cont+"','"+index+"','"+mac+"','"+pk+"','"+rank+"','"+dt1+"','"+dname+"')"); 



st111.executeUpdate("insert into  auditorf(fname,ct,findex,trapdoor,sk,rank,dt,downer) values ('"+file+"','"+cont+"','"+index+"','"+mac+"','"+pk+"','"+rank+"','"+dt1+"','"+dname+"')"); 



Statement st11=connection.createStatement();
st11.executeUpdate("insert into  DataOwner(fname,ct,findex,trapdoor,sk,rank,dt,downer) values ('"+file+"','"+cont+"','"+index+"','"+mac+"','"+pk+"','"+rank+"','"+dt1+"','"+dname+"')"); 




   					long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont.length())/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+file+"','"+ttime+"','"+tpt+"')");    		


%>
            <p></p>
            <pre class="pages style10">Data Uploaded Successfully !!</pre>
                <%

	   

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
            <p class="style7">
              <!-- end of center content -->
            <a href="DO_Main.jsp" class="style16">Back</a></p>
          </div>
          <p class="infopost">&nbsp;</p>
          <p class="infopost">&nbsp;</p>
          <p class="infopost">&nbsp;</p>
          <p class="infopost">&nbsp;</p>
          <p class="infopost">&nbsp;</p>
          <p class="infopost">&nbsp;</p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
         <ul class="sb_menu style18">
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
