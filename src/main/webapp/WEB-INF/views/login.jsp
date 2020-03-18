<jsp:include page="master.jsp" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
	</head>
	<body>
	
	<div class = "sidenav" align="center">
		
		<div id="loginlbl" align="left">Login</div>
		<form:form id="loginForm" method="post" action="home" modelAttribute="loginBean"> 
		
		<table style="width: 100%">

				<tr>
				<td>
			<form:label path="username">Username</form:label>
			</td>
			<td>
			<form:input id="txtUserName" name="txtUserName" path="username" /><br>
			</td>
			</tr>
			<tr>
			<td>
			<form:label path="password">Password</form:label>
			</td>
			<td>
			<form:password id="txtPassword" name="txtPassword" path="password" /><br>
			</td>
			</tr>
			<tr valign="bottom" align="right">
			<td align="right" valign="bottom">
			<!-- <input type="submit" value="Submit">-->
			<form:button type="submit" id="btnSignin" value="Submit">Submit</form:button>
			</td>
			</tr>
			</table>
			
		</form:form>
		</div>
	</body>
</html>