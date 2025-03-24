<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp"%>




<html>
<head>
<title>Transaction Results</title>
<script type="text/javascript" src="sources/jscharts.js"></script>
</head>
<body>
<div id="graph">Loading graph...</div>
<script type="text/javascript">
var myData=new Array();
var colors=[];
<%
String s4="",s6="",s7="",s8="",s9="",s10="",s11,s12,s13;
		int i=0,j=0,k=0,s5=0;
		int count=0;
try
	{
		String query1="SELECT distinct(user) ,fname,count(fname) FROM searchhistory group by fname order by count(fname) desc"; 
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(query1);
		while ( rs1.next() )
		{
			s4=rs1.getString(1);
			s6=rs1.getString(2);
			s5=rs1.getInt(3);
			
			String quer="select distinct(user),fname,count(fname) from searchhistory group by fname order by count(fname) desc"; 
			Statement st2=connection.createStatement();
			ResultSet rs2=st2.executeQuery(quer);
			if ( rs2.next() )
			{
				count=rs2.getInt(3);
			}
	
			if (count==s5)
			{
			
				
				String s1=null,s2=null;
				
				if(rs2.next())
				{
					s1=s4;
					s2=s6;
					int s3=s5;
					%>
					myData["<%=i%>"]=["<%= s1%>(<%= s2%>)",<%= s3%>];
					<%
					i++;
				}
	
			}
		}	

	%>
	var myChart = new JSChart('graph', 'pie');
	myChart.setDataArray(myData);
	myChart.setBarColor('#42aBdB');
	myChart.setBarOpacity(0.8);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setAxisValuesColor('#777E81');
	myChart.draw();
	
</script>

</body>
</html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>

