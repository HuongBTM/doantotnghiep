package com.edu.knowledge.controllers.app;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Role;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.RoleService;
import com.edu.knowledge.services.UserService;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView hello(){
		User user = new User();
		ModelAndView model = new ModelAndView("login");
		model.addObject("user", user);
		return model;
	}
	
	/*@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if(error != null) {
			model.addAttribute("emailmessage", "In valid");
		}
		if(logout != null) {
			model.addAttribute("emailmessage", "Have been logged out");
		}
		return "login";
	}*/
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user") User user, ModelMap map, HttpSession session){
		ModelAndView model = new ModelAndView();
		String email = user.getEmail();
		String password = user.getPassword();
		boolean checkLogin = userService.checkLogin(email, password);
		if(checkLogin) {
			User currentUser = userService.getUserByEmail(email);
			session.setAttribute("CURRENT_USER", currentUser);
			if(currentUser.isAdmin()) {
				model.setViewName("redirect:/admin/dashboard");
			} else if (currentUser.isExpect()) {
				model.setViewName("redirect:/expect/post/all");
			} else {
				model.setViewName("redirect:/app/home/feed");
			}
		} else {
			model.addObject(new User());
			map.addAttribute("emailmessage","Email hoặc password không đúng. Hãy nhập lại!");
		}
		return model;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView register() {
		User user = new User();
		ModelAndView model = new ModelAndView("signup");
		model.addObject("user", user);
		return model;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("user") User user, ModelMap map) {
		ModelAndView model = new ModelAndView("signup");
		String errMessage = "";
		String email = user.getEmail();
		String password = user.getPassword();
		String confirmPassword = user.getConfirmpassword();
		
		boolean checkExistedEmail = userService.checkExistedUserByEmail(email);
		if(checkExistedEmail) {
			errMessage= "Email đã tồn tại";
		} else if(!password.trim().equals(confirmPassword)) {
			errMessage= "Mật khẩu không trùng khớp";
		}
		
		if(errMessage.isEmpty()) {
			user.setImage("avata.png");
			user.setCreateDate(new Date());
			Role role = roleService.findRoleByName("member");
			userService.createUser(user, role);
			//System.out.println(Charset.defaultCharset());
			model.setViewName("redirect:/app/home/feed");
		} else {
			user.setPassword(null);
			user.setConfirmpassword(null);
			map.addAttribute("errMessage", errMessage);
		}
		return model;
	}
}
