package com.tp.asset.delegate;

import javax.security.auth.login.CredentialNotFoundException;

import com.tp.asset.service.EmployeeService;
import com.tp.asset.service.UserService;
import com.tp.asset.viewBean.EmployeeBean;

public class EmployeeDelegate
{
		private EmployeeService employeeService;

		public EmployeeService getEmployeeService()
		{
				return this.employeeService;
		}

		public void setEmployeeService(EmployeeService employeeService)
		{
				this.employeeService = employeeService;
		}

		public EmployeeBean addEmployee(String employeeID,String employeeSurname,String employeeName,String employeeMobNum,String employeeLocation,String employeeDescription)
    {
		    return employeeService.addEmployee(employeeID, employeeSurname, employeeName, employeeMobNum, employeeLocation, employeeDescription);
    }
}
