package com.edu.knowledge.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminDashboardController {

	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public ModelAndView hello(){
		ModelAndView model = new ModelAndView("admin_dashboard");
		return model;
	}
	
	@RequestMapping(value="/table", method=RequestMethod.GET)
	public ModelAndView user(){
		ModelAndView model = new ModelAndView("admin_user");
		return model;
	}
}
