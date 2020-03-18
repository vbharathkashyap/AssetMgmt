/**
 *
 */
package com.tp.asset.service;

import javax.security.auth.login.CredentialNotFoundException;

import com.tp.asset.viewBean.EmployeeBean;

/**
 * @author CENTAUR
 *
 */
public interface EmployeeService
{
	public EmployeeBean addEmployee(String employeeID,String employeeSurname,String employeeName,String employeeMobNum,String employeeLocation,String employeeDescription);
}
