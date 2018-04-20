package com.edu.knowledge.controllers.expect;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.User;

@Controller
@RequestMapping("/expect/user")
public class ExpectUserController {

	// user detail, change profile
	
	@RequestMapping(value="/changeprofile", method=RequestMethod.GET)
	public ModelAndView updateProfile() {
		ModelAndView mav = new ModelAndView("expect_change_profile");
		User user = new User();
		mav.addObject("user", user);
		return mav;
	}
}
