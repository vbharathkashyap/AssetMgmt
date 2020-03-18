<%@page import="com.tp.asset.common.SessionVariables"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	width: 1000px;
	height: 400px;
	position: fixed;
	z-index: 1;
	top: 100px;
	left: 100px;
	background: #eee;
	overflow-x: hidden;
	padding: 8px 0;
}

.block {
	display: block;
	width: 100%;
	border: ex;
	background-color: #4CAF50;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
}

.errornav {
	width: 500px;
	height: 100px;
	position: fixed;
	z-index: 1;
	top: 550px;
	left: 100px;
	background: #eee;
	overflow-x: hidden;
	padding: 8px 0;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

	<a href="home">Home</a>
	<label id="lblUserName"><%=request.getSession().getAttribute(SessionVariables.loggedInUser)%></label>
	<a href="logout">Logout</a>
	<div class="sidenav" align="center">
		<div class="errornav">
			<div id="errorMsg" align="justify">${message}</div>
			<div id="errorMsg" align="justify">TESTME</div>
		</div>
	</div>

	<script type="text/javascript">
		function validateForm(form,fields)
		{
		  

		  var i, l = fields.length;
		  var fieldname;
		  for (i = 0; i < l; i++) {
		    fieldname = fields[i];
		    if (document.forms[form][fieldname].value === "") {
		    	displayMandateErr(form,fieldname)
		      return false;
		    }
		  }
		  return true;
		}
		
		function displayMandateErr(form,fieldname)
		{
			var msg = "";
			switch (form) {
			case "employeeForm":
				switch (fieldname) {
				case "txtEmployeeID":
					msg = "Employee Id is mandatory field";
					break;
				case "txtName":
					msg = "Employee Name is mandatory field";
					break;
				case "txtDesignation":
					msg = "Designation is mandatory field";
					break;
				default:
					break;
				}
				break;

			case "assetForm":
				switch (fieldname) {
				case "txtAssetID":
					msg = "Asset Id is mandatory";
					break;
				case "txtProduct":
					msg = "Product field is mandatory";
					break;
				case "txtModel":
					msg = "Model field is mandatory";
					break;
				case "txtCondition":
					msg = "Condition field is mandatory";
					break;
				default:
					break;
				}
				break;
				
				
			default:
				break;
			}
			document.getElementById("errorMsg").innerHTML = msg;
		}
		
		function displayAphaNumericErr(form,fieldname)
		{
			var msg = "";
			switch (form) {
			case "employeeForm":
				switch (fieldname) {
				case "txtEmployeeID":
					msg = "Employee Id should be alpha numeric";
					break;
				default:
					break;
				}
				break;
				
				
			case "assetForm":
				switch (fieldname) {
				case "txtAssetID":
					msg = "Asset Id should be alpha numeric";
					break;
				case "txtProduct":
					msg = "Product should be alpha numeric";
					break;
				case "txtModel":
					msg = "Model should be alpha numeric";
					break;
				default:
					break;
				}
				break;
				
				
			default:
				break;
			}
			document.getElementById("errorMsg").innerHTML = msg;
		}
		
		function displayNumericErr(form,fieldname)
		{
			var msg = "";
			switch (form) {
			case "employeeForm":
				switch (fieldname) {
				case "txtMobile":
					msg = "Mobile No field accepts only Numeric Value";
					break;
				default:
					break;
				}
				break;

			default:
				break;
			}
			document.getElementById("errorMsg").innerHTML = msg;
		}
		function displayAphaErr(form,fieldname)
		{
			var msg = "";
			switch (form) {
			case "employeeForm":
				switch (fieldname) {
				case "txtSurname":
				case "txtName":
				case "txtLocation":
				case "txtDesignation":
					msg = "Only alphabets allowed";
					break;
				default:
					break;
				}
				break;
				
			case "assetForm":
				switch (fieldname) {
				case "txtCondition":
					msg = "Condition should be alphabets only";
					break;
				case "txtColor":
					msg = "Color should be alphabets only";
					break;
				default:
					break;
				}
				break;

			default:
				break;
			}
			document.getElementById("errorMsg").innerHTML = msg;
		}
		
		// Function to check letters and numbers
		function alphanumeric(form,fields)
		{
		 var letterNumber = /^[0-9a-zA-Z]+$/;
		 var i, l = fields.length;
		  var fieldname;
		  for (i = 0; i < l; i++) {
		    fieldname = fields[i];
		 if(document.forms[form][fieldname].value.match(letterNumber)) 
		  {
		   return true;
		  }
		else
		  {
			displayAphaNumericErr(form,fieldname)
		   return false; 
		  }
		  }
		  }
		  
		function allLetter(form,fields)
		  {
			var letters = /^[A-Za-z]+$/;
			 var i, l = fields.length;
			  var fieldname;
			  for (i = 0; i < l; i++) {
			    fieldname = fields[i];
		   
		   if(document.forms[form][fieldname].value.match(letters))
		     {
		      return true;
		     }
		   else
		     {
			   displayAphaErr(form,fieldname);
		     return false;
		     }
			  }
		  }
		
		function allnumeric(form,fields)
		   {
		      var numbers = /^[0-9]+$/;
		      var i, l = fields.length;
			  var fieldname;
			  for (i = 0; i < l; i++) {
			    fieldname = fields[i];
		      if(document.forms[form][fieldname].value.match(numbers))
		      {
		      return true;
		      }
		      else
		      {
		    	  displayNumericErr(form,fieldname);
		      return false;
		      }
		   }
		   } 
		</script>
</body>
</html>