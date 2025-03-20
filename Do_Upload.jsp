<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.style1 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
}
.style14 {color: #0e4369; font-size: 16px; font-weight: bold; }
.style16 {font-size: 12px}
.style28 {color: #5f5f5f}
.style30 {color: #0d6887}
.style31 {font-weight: bold}
.style32 {color: #FFFFFF}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style1">CryptCloud+: Secure and Expressive Data Access Control for Cloud Storage</a></h1>
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
          <h2>Select File To Upload   </h2>
          <p class="infopost">&nbsp;</p>
          <form id="form1" name="form1" method="post" action="DO_Upload1.jsp">
            <table width="491" height="433" border="0" align="center" cellpadding="0"  cellspacing="0" style="border-collapse:collapse">
              <tr>
                <td width="133" height="35" bgcolor="#FF0000"><span class="odd style14 style28"><span class="odd style11 style16 style32"> Select File :</span></span></td>
                <td width="423"><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
              </tr>
              <tr>
                <td height="35" bgcolor="#FF0000" class="odd style14 style16 style32">Index : </td>
                <td><label>
                  <input required="required" name="indexname" type="text" size="49" />
                </label></td>
              </tr>
              <tr>
                <td height="35" bgcolor="#FF0000" class="odd style14 style28"><span class="odd style11 style16 style32">File Name :</span> </td>
                <td><input required="required" name="tt" type="text" id="t42" size="49"/></td>
              </tr>
              <tr>
                <td height="252"><span class="style30"></span></td>
                <td><textarea name="text" id="textarea" cols="50" rows="15"></textarea></td>
              </tr>
              
              <tr>
                <td height="35"><div align="right"></div></td>
                <td><input type="submit" name="Submit" value="Encrypt" /></td>
              </tr>
            </table>
            <p align="right"><a href="DO_Main.jsp">Back</a></p>
          </form>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
         <ul class="sb_menu style31">
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
