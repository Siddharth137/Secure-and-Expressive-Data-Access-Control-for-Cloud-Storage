<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*,java.util.Random,java.security.KeyPair,java.security.KeyPairGenerator,java.security.NoSuchAlgorithmException,java.security.PublicKey,javax.crypto.Cipher,javax.crypto.NoSuchPaddingException" %>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%@ include file="connect.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>STA</title>

              <%
int uid = Integer.parseInt(request.getParameter("usid"));
try {
/*String fname=request.getParameter("fname");
*/String str="Granted";
Statement st = connection.createStatement();
String query ="update request set SearchPer='"+str+"' where id='"+uid+"' ";
st.executeUpdate (query);


SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			Date now = new Date();
			
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
					

response.sendRedirect("STA_GrantSearch.jsp");
connection.close();
}
catch(Exception e)
{
out.println(e.getMessage());
}
%> 

