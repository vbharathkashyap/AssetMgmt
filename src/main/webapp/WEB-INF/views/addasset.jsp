<jsp:include page="master.jsp"></jsp:include>
<%@page import="com.tp.asset.common.SessionVariables"%>
<%@page import="com.tp.asset.controller.AssetController"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Asset</title>

</head>
<body>
	<div class="sidenav" align="center">
		<form:form id="assetForm" method="post" action="addasset"
			modelAttribute="assetBean" onsubmit="return getStatus();">
			<label id="lblAssetDetails">Asset Details</label>
			<table style="width: 100%">

				<tr>
					<td><form:label path="assetID">Asset ID</form:label></td>
					<td><form:input id="txtAssetID" name="txtAssetID"
							path="assetID" value='${assetBean.assetID}' /><br></td>
				</tr>

				<tr>
					<td><form:label path="assetProductName">Product Name</form:label>
					</td>
					<td><form:input id="txtProduct" name="txtProduct"
							path="assetProductName" value='${assetBean.assetProductName}' /><br>
					</td>
				</tr>

				<tr>
					<td><form:label path="assetModelName">Model Name</form:label>
					</td>
					<td><form:input id="txtModel" name="txtModel"
							path="assetModelName" value='${assetBean.assetModelName}' /><br>
					</td>
				</tr>

				<tr>
					<td><form:label path="assetProductCondition">Product Condition</form:label>
					</td>
					<td><form:input id="txtCondition" name="txtCondition"
							path="assetProductCondition"
							value='${assetBean.assetProductCondition}' /><br></td>
				</tr>

				<tr>
					<td><form:label path="assetProductColor">Product Color</form:label>
					</td>
					<td><form:input id="txtColor" name="txtColor"
							path="assetProductColor" value='${assetBean.assetProductColor}' /><br>
					</td>
				</tr>

				<tr>
					<td><form:label path="assetInUse">In Use</form:label></td>
					<td><form:select path="assetInUse">
							<c:choose>
								<c:when test="${assetBean.assetInUse eq 'Yes'}">
									<form:option value="Yes" label="Yes" selected='selected' />
									<form:option value="No" label="No" />
								</c:when>
								<c:when test="${assetBean.assetInUse eq 'No'}">
									<form:option value="Yes" label="Yes" />
									<form:option value="No" label="No" selected='selected' />
								</c:when>
								<c:otherwise>
									<form:option value="No" label="No" />
									<form:option value="Yes" label="Yes" />
								</c:otherwise>
							</c:choose>


						</form:select> <br></td>
				</tr>

				<tr>
					<td><form:label path="employeeID">EmployeeID</form:label></td>
					<td><form:select path="employeeID">
							<c:forEach
								items="<%=request.getSession().getAttribute(SessionVariables.empID)%>"
								var="empId" varStatus="tagStatus">
								<c:choose>
									<c:when test="${assetBean.employeeID eq empId}">
										<form:option value='${empId}' selected='selected'></form:option>
									</c:when>
									<c:otherwise>
										<form:option value='${empId}'></form:option>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</form:select></td>
				</tr>

				<tr valign="bottom" align="right">
					<td align="right" valign="bottom">
						<!-- <input type="submit" value="Submit">--> <form:button
							type="submit" id="btnSave" value="Submit" onclick='status=false;callValidation();'>Add Asset</form:button>
					</td>
				</tr>
			</table>

		</form:form>
	</div>
	<script type="text/javascript">
		var status = true;
		function callValidation() {
			if (status == false || status == "false") {
				var fields = [ "txtAssetID", "txtProduct", "txtModel",
						"txtCondition" ];
				var form = "assetForm";
				status = validateForm(form, fields);
				if (status == true || status == "true") {
					var fields = [ "txtAssetID", "txtProduct", "txtModel" ];
					status = alphanumeric(form, fields);
				} else if (status == true || status == "true") {
					var fields = [ "txtCondition", "txtColor" ];
					status = allLetter(form, fields);
				}
			}
		}

		function getStatus() {
			if (status == false || status == "false") {
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>