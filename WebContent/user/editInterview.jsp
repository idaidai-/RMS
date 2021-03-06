<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userID = (String) session.getAttribute("uId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>Homepage for Applicants</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="styles/style.css">
<script language="javaScript" src="./js/Calendar4.js"></script>
</head>

<body>
	<div style="text-align: center;">
		<img src="<%=request.getContextPath()%>/images/RecHome.jpg">
	</div>
	<hr>
	<div class="nav">
	   <ul>
	     <li class="bgno"><a href="user/CreateJobOpening.jsp">Manage job opening</a></li>
		 <li><a href="user/manageCV.jsp">Manage CV</a></li>
		 <li><a href="user/CreateReport.jsp">Make report</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
		 
	   </ul>
	 </div>
<br><center></br>
<form action="user/mcv.do">
	<input name="method" value="updateInterview" type="hidden" />
	<input name="sid" value="${interview.sid}" type="hidden" /> 
<br />
<h2 id="h2">Edit Interview</h2>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin-left: 0" width="70%" color=#987cb9 SIZE=3>
	<table class="info_table" border="0">
	<br>
	<tr><th>ID</th><td>${interview.sid}</td></tr>
	<tr>
		<th>place</th><td><input type="text" name="place" value="${interview.place}" /></td>
	</tr>
	<tr>
		<th>date</th>
		<td>
		<input style="width: 120px;" type="text" name="date" id="date" value="${interview.date}"/>
		<input style="width: 45px;" name="" type="button" onclick="MyCalendar.SetDate(this,document.getElementById('date'))" value="Date" />
		</td>
	</tr>
	<tr>
		<th>consequence</th>
		<td><select name="consequence">
		<option value=""></option>
		<option value="success">success</option>
		<option value="failure">failure</option>
		</select></td>
	</tr>
	<tr>
		<th>comment</th>
		<td><textarea name="comment" rows="4" cols="40"	>${interview.comment}</textarea></td>
	</tr>
	<tr>
	<td colspan="2">
	 <input style="width: 80px; height: 30px; margin-left: 200px;" type="submit" value="submit" />
	 <input style="width: 80px; height: 30px; margin-left: 30px;" type="reset" value="reset" />
	 <input style="width: 80px; height: 30px; margin-left: 30px;" type="button" value="back" onclick="javascript:window.history.back();" />
	 </td>
	</tr>
</table>
</form>
</center>
</body>
</html>