<jsp:include page="master.jsp"></jsp:include>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
<div class = "sidenav" align="center">
		<div id="lblEmp" align="left">Add Employee</div><br>
		<form:form id="employeeForm" method="post" action="addemployee" modelAttribute="employeeBean" onsubmit="return getStatus();"> 
		
		<table style="width: 100%">

				<tr>
				<td>
			<form:label path="employeeID">EmployeeID</form:label>
			</td>
			<td>
			<form:input id="txtEmployeeID" name="txtEmployeeID" path="employeeID"/><br>
			</td>
			</tr>
			
			<tr>
				<td>
			<form:label path="employeeSurname">Employee Surname</form:label>
			</td>
			<td>
			<form:input id="txtSurname" name="txtSurname" path="employeeSurname" /><br>
			</td>
			</tr>
			
			<tr>
				<td>
			<form:label path="employeeName">Employee Name</form:label>
			</td>
			<td>
			<form:input id="txtName" name="txtName" path="employeeName" /><br>
			</td>
			</tr>
			
			<tr>
				<td>
			<form:label path="employeeMobNum">Mobile Number</form:label>
			</td>
			<td>
			<form:input id="txtMobile" name="txtMobile" path="employeeMobNum" /><br>
			</td>
			</tr>
			
			<tr>
				<td>
			<form:label path="employeeLocation">Location</form:label>
			</td>
			<td>
			<form:input id="txtLocation" name="txtLocation" path="employeeLocation" /><br>
			</td>
			</tr>
			
			<tr>
				<td>
			<form:label path="employeeDesignation">Designation</form:label>
			</td>
			<td>
			<form:input id="txtDesignation" name="txtDesignation" path="employeeDesignation" /><br>
			</td>
			</tr>
			
			<tr valign="bottom" align="right">
			<td align="right" valign="bottom">
			<!-- <input type="submit" value="Submit">-->
			<form:button type="submit" id="addEmployee" value="Submit" onclick='status=false;callValidation();'>Add Employee</form:button>
			</td>
			</tr>
			</table>
			
		</form:form>
		</div>
		
		<script type="text/javascript">
		var status = true;
		function callValidation()
		{
		if(status == false || status == "false")
			{
		var fields = ["txtEmployeeID", "txtName", "txtDesignation"];
		var form = "employeeForm";
		status = validateForm(form,fields);
		if(status == true || status == "true")
			{
			var fields = ["txtEmployeeID"];
			status = alphanumeric(form,fields);
			}
		else if(status == true || status == "true")
		{
		var fields = ["txtSurname", "txtLocation", "txtDesignation","txtName"];
		status = allLetter(form,fields);
		}
		else if(status == true || status == "true")
		{
		var fields = ["txtMobile"];
		status = allnumeric(form,fields);
		}
			}
		}
		
		function getStatus()
		{
			if(status == false || status == "false")
			{
				return false;
			}
			else
				{
				return true;
				}
		}
		</script>
</body>
</html>