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
try
{
		String s1="",s4="",s6="",s7="",s8="",s9="",s10="",s11,s12,s13;
		int i=0,j=0,k=0,s2=0,s5=0;
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
			
				if(rs2.next())
				{
					s1=s4;
					int s3=s5;
					
					%>
					myData["<%=i%>"]=["<%= s1%>",<%= s3%>];
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

