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

import com.tp.asset.delegate.LoginDelegate;
import com.tp.asset.viewBean.LoginBean;

@Controller
public class LogoutController
{
		
		

		
		@RequestMapping(value="/logout",method=RequestMethod.GET)
		public ModelAndView executeLogout(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("loginBean")LoginBean loginBean)
		{
			System.out.println("exeLogout");
				ModelAndView model= null;
				try
				{
					
								HttpSession session = request.getSession();
								session.invalidate();
								session = null;
								model = new ModelAndView("login");
								
					
				}
				catch(Exception e)
				{
						e.printStackTrace();
				}

				return model;
		}
}
