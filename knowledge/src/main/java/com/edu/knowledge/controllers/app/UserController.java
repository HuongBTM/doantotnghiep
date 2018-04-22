package com.edu.knowledge.controllers.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/user/{id}/changeprofile", method=RequestMethod.GET)
	public ModelAndView updateProfile(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("change_profile");
		User user = new User();
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value="/user/{id}/info", method=RequestMethod.GET)
	public ModelAndView userInfo(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("user_info");
		User user = new User();
		mav.addObject("user", user);
		return mav;
	}
}
