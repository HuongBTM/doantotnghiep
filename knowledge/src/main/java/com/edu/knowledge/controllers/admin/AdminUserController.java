package com.edu.knowledge.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.knowledge.entities.Role;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.RoleService;
import com.edu.knowledge.services.UserService;
import com.edu.knowledge.utils.Constant;
import com.edu.knowledge.validator.UserValidator;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserValidator userValidator;
	
	@RequestMapping(value ="/alluser", method=RequestMethod.GET)
	public ModelAndView findAllUser() {
		ModelAndView modelAndView = new ModelAndView("admin_user_list");
		List<User> users = new ArrayList<>();
		users = userService.findAllUser();
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	
	@RequestMapping(value="/adduser", method=RequestMethod.GET)
	public ModelAndView addUser() {
		ModelAndView modelAndView = new ModelAndView("admin_user_edit");
		User user = new User();
		modelAndView.addObject("user", user);
		return modelAndView;
	}
	
	/*@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public ModelAndView userDetail(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("admin_user_detail");
		
		return modelAndView;
	}*/
	
	@RequestMapping(value= "/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editUser(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getOne(id);
		if(user == null) {
			modelAndView.setViewName("404");
		} else {
			modelAndView.addObject("user", user);
			modelAndView.setViewName("admin_user_edit");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public ModelAndView saveUserEdit(@ModelAttribute("user") User user, BindingResult result, 
			@RequestParam("roleSelect") String roleName, RedirectAttributes redirect, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("admin_user_edit");
		Role dbRole = roleService.findRoleByName(roleName);
		user.setRole(dbRole);
		int idHidden= Integer.parseInt(request.getParameter("idHidden").toString());
		user.setUserId(idHidden);
		userValidator.validate(user, result);
		
		if(result.hasErrors()) {
			System.out.println(result);
			return modelAndView;
		}
		if(user.getUserId() ==0) {
			user.setImage("avatar.png");
			userService.createUser(user , dbRole);
		} else {
			if(userService.updateUser(user, dbRole)) {
				redirect.addFlashAttribute("error", "Saved user " + user.getFullname() + " error!");
			}
		}
		redirect.addFlashAttribute("success", "Saved user " + user.getFullname() + " successfully!");
		modelAndView.setViewName("redirect:/admin/user/alluser");
		return modelAndView;
	}
	
	@RequestMapping(value = "/deleteuser", method=RequestMethod.GET)
	@ResponseBody
	public String deleteUser(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("userid").toString());
		if(userService.deleteUser(userId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
	
}
