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
<h1>Detail CV</h1>
<form action="detailCV.action">
	<input name="method" value="detail" type="hidden" />
<input name="cid" value="${cv.cid}" type="hidden" />
<br><h2 id="h2">Basic information</h2>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin-left: 0" width="70%" color=#987cb9 SIZE=3>
		<table class="info_table" border="0">
		<br>
		<tr>
			<th>name</th>
			<td><input type="text" name="name" value="${cv.name}" disabled="disabled"/></td>
			<th>phone</th>
			<td><input type="text" name="phone" value="${cv.phone}" disabled="disabled"/></td>
		</tr>
		<tr>
			<th>sex</th>
			<td><input type="text" name="sex" value="${cv.sex}" disabled="disabled"/></td>
			<th>age</th>
			<td><input type="text" name="age" value="${cv.age}" disabled="disabled"/></td>
		</tr>
		<tr>
			<th>e-mail</th>
			<td><input type="text" name="email" value="${cv.email}" disabled="disabled"/></td>
			<th>address</th>
			<td><input type="text" name="address" value="${cv.address}" disabled="disabled"/></td>
		</tr>
		<tr>
			<th>school</th>
			<td><input type="text" name="school" value="${cv.school}" disabled="disabled"/></td>
			<th>major</th>
			<td><input type="text" name="major" value="${cv.major}" disabled="disabled"/></td>
		</tr>
		<tr>
			<th>education</th>
		<td><input type="text" name="education" value="${cv.education}" disabled="disabled"/></td>
			<th>location</th>
			<td><input type="text" name="location" value="${cv.location}" disabled="disabled"/></td>
		</tr>
	</table>
	<br><br>
	<h2 id="h2">Work related</h2>
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=1); margin-left: 0" width="70%" color=#987cb9 SIZE=3>
	<table class="winfo_table" border="0">
	<br>
	<tr>
		<th>experience</th>
		<td><input type="text" name="experience" value="${cv.experience}" disabled="disabled"/></td>
	</tr>
	<tr>
		<th>technical</th>
		<td><input type="text" name="technical" value="${cv.technical}" disabled="disabled"/></td>
		</tr>
		<tr>
		<th>language</th>
			<td><input type="text" name="language" value="${cv.language}" disabled="disabled"/></td>
		</tr>
		<tr>
			<th>self assessment</th>
			<td><textarea name="self_assessment" rows="4" cols="40" disabled="disabled"	>${cv.self_assessment}</textarea></td>
		</tr>
		<tr>
			<th>CV</th>
			<td><input type="file" name="cv" size="80%" /></td>
		</tr>
		<tr>
			<th>status</th>
			<td><input type="text" name="status" value="${cv.status}" disabled="disabled"/></td>
		</tr>
		<tr>
			<th>recruiter</th>
			<td><input type="text" name="rid" value="${cv.rid}" disabled="disabled"/></td>
		</tr>
	<tr>
		<td colspan="2">
			<input style="width: 80px; height: 30px; margin-left: 10px;"type="button" value="copy" onclick="self.location.href='user/mcv.do?method=copyTL&cid=${cv.cid}&rid=${cv.rid}&newrid=<%=userID%>'"/>
			<input style="width: 80px; height: 30px; margin-left: 10px;"type="button" value="delete" onclick="self.location.href='user/mcv.do?method=deleteTL&cid=${cv.cid}&rid=${cv.rid}&newrid=<%=userID%>'"/>
			<input style="width: 150px; height: 30px; margin-left: 10px;"type="button" value="check interview" onclick="self.location.href='user/mcv.do?method=interviewList&cid=${cv.cid}&rid=${cv.rid}&newrid=<%=userID%>'" />
	    	<input style="width: 150px; height: 30px; margin-left: 10px;" type="button" value="add new interview"  onclick="self.location.href='user/mcv.do?method=addInterview&cid=${cv.cid}&rid=${cv.rid}&newrid=<%=userID%>'"/>
			<input style="width: 80px; height: 30px; margin-left: 10px;"type="button" value="update" onclick="self.location.href='user/mcv.do?method=updateCV&cid=${cv.cid}&rid=${cv.rid}&newrid=<%=userID%>'" />
	 		<input style="width: 80px; height: 30px; margin-left: 100px;"type="button" value="back" onclick="javascript:window.history.back();" />
		</td>
	</tr>
</table>
</form>
<br/><br/><br/>
</center>
</body>
</html>