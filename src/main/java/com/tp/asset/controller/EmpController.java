package com.tp.asset.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tp.asset.common.SessionVariables;
import com.tp.asset.delegate.EmployeeDelegate;
import com.tp.asset.delegate.LoginDelegate;
import com.tp.asset.viewBean.EmployeeBean;
import com.tp.asset.viewBean.LoginBean;

@Controller
public class EmpController
{
	private List<EmployeeBean> lstEmpBean = new ArrayList<EmployeeBean>();
	private List<String> lstEmpID = new ArrayList<String>();
	private EmployeeDelegate employeeDelegate;
	
		@RequestMapping(value="/addemployee",method=RequestMethod.GET)
		public ModelAndView displayEmployee(HttpServletRequest request, HttpServletResponse response, EmployeeBean employeeBean)
		{
			System.out.println("displayEmployee");
			ModelAndView model = new ModelAndView("addemployee");
			//LoginBean loginBean = new LoginBean();
			model.addObject("employeeBean", employeeBean);
			return model;
		}
		
		@RequestMapping(value="/addemployee",method=RequestMethod.POST)
		public ModelAndView executeEmployee(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("employeeBean")EmployeeBean employeeBean)
		{
			System.out.println("exe employee");
				ModelAndView model= null;
				try
				{
					//System.out.println(employeeBean.getUsername() + " - " + employeeBean.getPassword());
					//EmployeeBean employeeBean = employeeDelegate.addEmployee(emp, employeeSurname, employeeName, employeeMobNum, employeeLocation, employeeDescription)
					lstEmpBean.add(employeeBean);
					lstEmpID.add(employeeBean.getEmployeeID());
					System.out.println(employeeBean.getEmployeeName());
					System.out.println("emp added to list");
					HttpSession session = request.getSession();
					session.setAttribute(SessionVariables.empDetails, lstEmpBean);
					session.setAttribute(SessionVariables.empID, lstEmpID);
					
					model = new ModelAndView("home");
				}
				catch(Exception e)
				{
						e.printStackTrace();
				}

				return model;
		}
}
