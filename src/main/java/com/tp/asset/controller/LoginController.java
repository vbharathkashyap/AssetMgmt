package com.tp.asset.controller;

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
import com.tp.asset.delegate.LoginDelegate;
import com.tp.asset.viewBean.LoginBean;

@Controller
public class LoginController
{
		
		@Autowired
		private LoginDelegate loginDelegate;

		@RequestMapping(value="/login",method=RequestMethod.GET)
		public ModelAndView displayLogin(HttpServletRequest request, HttpServletResponse response, LoginBean loginBean)
		{
			System.out.println("displayLogin");
			ModelAndView model = new ModelAndView("login");
			//LoginBean loginBean = new LoginBean();
			model.addObject("loginBean", loginBean);
			return model;
		}
		
		@RequestMapping(value="/login",method=RequestMethod.POST)
		public ModelAndView newLogin(HttpServletRequest request, HttpServletResponse response, LoginBean loginBean)
		{
			System.out.println("displayLogin");
			ModelAndView model = new ModelAndView("login");
			//LoginBean loginBean = new LoginBean();
			model.addObject("loginBean", loginBean);
			return model;
		}
		
		@RequestMapping(value="/home",method=RequestMethod.GET)
		public ModelAndView displayLogin(HttpServletRequest request, HttpServletResponse response)
		{
			
			ModelAndView model = new ModelAndView("home");
			//LoginBean loginBean = new LoginBean();
			//model.addObject("loginBean", loginBean);
			return model;
		}
		@RequestMapping(value="/home",method=RequestMethod.POST)
		public ModelAndView executeLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("loginBean")LoginBean loginBean)
		{
			System.out.println("exeLogin");
				ModelAndView model= null;
				try
				{
					System.out.println(loginBean.getUsername() + " - " + loginBean.getPassword());
						boolean isValidUser = loginDelegate.isValidUser(loginBean.getUsername(), loginBean.getPassword());
						if(isValidUser)
						{
								System.out.println("User Login Successful");
								HttpSession session = request.getSession();
								session.setAttribute(SessionVariables.loggedInUser, "Hello " + loginBean.getUsername());
								model = new ModelAndView("home");
								
						}
						else
						{
								model = new ModelAndView("login");
								request.setAttribute("message", "Invalid credentials!!");
						}

				}
				catch(Exception e)
				{
						e.printStackTrace();
				}

				return model;
		}
}
