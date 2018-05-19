package com.edu.knowledge.controllers.expect;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.UserService;
import com.edu.knowledge.utils.Constant;
import com.edu.knowledge.validator.UserValidator;

@Controller
@RequestMapping("/expect/user")
public class ExpectUserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserValidator userValidator;
	
	@RequestMapping(value="/{id}/info", method=RequestMethod.GET)
	public ModelAndView userDetail(@PathVariable("id") int userId) {
		ModelAndView mav = new ModelAndView("expect_info");
		User user = userService.getOne(userId);
		mav.addObject("user",user);
		return mav;
	}
	
	@RequestMapping(value="/changeprofile", method=RequestMethod.GET)
	public ModelAndView updateProfile(HttpSession session) {
		ModelAndView mav = new ModelAndView("expect_change_profile");
		User user = (User) session.getAttribute(Constant.CURRENT_USER);
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value="/save/profile", method= RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("user") User user, BindingResult result,  HttpSession session, RedirectAttributes redirect) {
		ModelAndView mav = new ModelAndView("expect_chamge_profile");
		User userDB = (User) session.getAttribute(Constant.CURRENT_USER);
		user.setUserId(userDB.getUserId());
		user.setPoints(userDB.getPoints());
		user.setImage(userDB.getImage());
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			return mav;
		}
		if(!userService.updateUser(user, userDB.getRole())) {
			redirect.addFlashAttribute("error", "Saved user " + user.getFullname() + " error!");
			return mav;
		}
		redirect.addFlashAttribute("success", "Saved user " + user.getFullname() + " successfully!");
		mav.setViewName("redirect:/expect/user/"+user.getUserId()+"/info");
		return mav;
	}
}
