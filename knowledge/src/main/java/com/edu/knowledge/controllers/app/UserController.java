package com.edu.knowledge.controllers.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/alluser", method=RequestMethod.GET)
	public ModelAndView getAllUser() {
		ModelAndView mav = new ModelAndView("");
		/*mav.addObject(attributeValue)
		return userService.findAllUser();*/
		return mav;
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView home() {
		return new ModelAndView("home");
	}
	
	@RequestMapping(value="/getone/{id}", method=RequestMethod.GET)
	@ResponseBody
	public User getUserById(@PathVariable(value="id") int userId) {
		return userService.getOne(userId);
	}
	
}
