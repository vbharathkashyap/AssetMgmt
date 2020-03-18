<jsp:include page="master.jsp" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Asset Manager – Home</title>
	</head>
	<body>
	
	<div class = "sidenav" align="center">
		<form:form id="homeForm" method="post"> 
		
		 <input type = "button" name = "btnAddEmployee" value="Add Employee" onclick="location.href='addemployee'"/>
		      <input type = "button" name = "btnViewAssets" value="View Asset List" onclick="location.href='viewassetlist'"/> 
     <input type = "button" name = "btnAddAsset" value="Add Asset" onclick="location.href='addasset'"/> 
		</form:form>
		</div>
	</body>
</html>