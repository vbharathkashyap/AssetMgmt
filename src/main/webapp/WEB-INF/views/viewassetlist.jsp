<jsp:include page="master.jsp"></jsp:include>
<%@page import="com.tp.asset.common.SessionVariables"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Assets</title>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
</head>
<body>
<div class = "sidenav" align="center">
		<form:form id="viewassetForm" method="post" action="viewassetlist" modelAttribute="lstassetBean"> 
		<label id="lblAssetDetails">View Assets</label>
		
		<br>
		<table style="width: 100%">
				<tr valign="bottom" align="center">
					<td><form:label path="">Asset ID</form:label>
					</td>
					<td><form:input id="txtSearchAssetId" name="txtSearchAssetId"
							path=""/><br></td>
				</tr>
				<tr valign="bottom" align="center">
					<td><form:label path="">Employee ID</form:label>
					</td>
					<td><form:input id="txtSearchEmployeeId" name="txtSearchEmployeeId"
							path="" /><br>
					</td>
				</tr>
		<tr valign="bottom" align="right">
					<td align="center" valign="bottom" colspan="2">
						<!-- <input type="submit" value="Submit">--> <form:button
							type="button" id="btnSearch" value="Search" onclick="searchAsset();">Search</form:button>
					</td>
				</tr>
				</table>
				<table id="assetTbl"  style="width: 100%" >
		
		
		<tr>
<th>Asset Id</th>
<th>Product</th>
<th>Model</th>
<th>Color</th>
<th>Condition</th>
<th>InUse</th>
<th>EmpID</th>
</tr>
<c:forEach items="${lstassetBean.lstAssetBean}" var="assetBean" varStatus="tagStatus">
    <tr>
    	<td align="center"><a href='updateasset?getRow=${tagStatus.index}'>${assetBean.assetID}</a></td>
        <td align="center"><form:label path="" id="prod_${tagStatus.index}" />${assetBean.assetProductName}</td>
        <td align="center"><form:label path="" id="model_${tagStatus.index}" />${assetBean.assetModelName}</td>
        <td align="center"><form:label path="" id="color_${tagStatus.index}" />${assetBean.assetProductColor}</td>
        <td align="center"><form:label path="" id="condition_${tagStatus.index}" />${assetBean.assetProductCondition}</td>
        <td align="center"><form:label path="" id="inUse_${tagStatus.index}" />${assetBean.assetInUse}</td>
        <td align="center"><form:label path="" id="empID_${tagStatus.index}" />${assetBean.employeeID}</td>
    </tr>
</c:forEach>
</table>
		</form:form>
		</div>
<script type="text/javascript">
function searchAsset() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("txtSearchAssetId");
  filter = input.value.toUpperCase();
  table = document.getElementById("assetTbl");
  table.visibility = "visible";
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
</body>
</html>