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
</head>

<body>
	<div style="text-align: center;">
		<img src="<%=request.getContextPath()%>/images/RecHome.jpg">
	</div>
	<hr>
	<div class="nav">
	   <ul>
	     <li><a href="user/RecHomepage.jsp">Manage job opening</a></li>
		 <li class="bgno"><a href="user/manageCV.jsp">Manage CV</a></li>
		 <li><a href="user/CreateReport.jsp">Make report</a></li>
		 <li id="username">Welcome,<%=userID%></li>
		 <a href="user/login.jsp" id="logout">Logout</a>
		 
	   </ul>
	 </div>
<br><center></br>
<h1 id="h2">Interview List</h1>
<form action="user/mcv.do">
  <input name="method" value="interviewList" type="hidden" />
<table class="response_table" border='1'>
	<tr>
		<th width="100" scope="col">No</th>
		<th width="100" scope="col">place</th>
		<th width="200" scope="col">date</th>
		<th width="100" scope="col">consequence</th>
		<th width="200" scope="col">action</th>
	</tr>
	<c:forEach var="interview" items="${interviews}" varStatus="status">
		<tr>
			<td>${interview.sid}</td>
			<td>${interview.place}</td>
			<td>${interview.date}</td>
			<td>${interview.consequence}</td>
			<td><a href="user/mcv.do?method=editInterview&sid=${interview.sid}">edit</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="user/mcv.do?method=deleteInterview&sid=${interview.sid }" onclick="return confirm('Are you sure to delete?')">delete</a></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
			<input style="width: 80px; height: 30px; margin-left: 30px;" type="button" value="back" onclick="javascript:window.history.back();" />
		</td>
	</tr>
</table>
</center>
</body>
</html>