package com.edu.knowledge.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.UserService;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

	private UserService userService;
	@RequestMapping(value ="/alluser", method=RequestMethod.GET)
	public ModelAndView findAllUser() {
		ModelAndView modelAndView = new ModelAndView("admin_user_list");
		List<User> users = new ArrayList<>();
		users = userService.findAllUser();
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	
}
