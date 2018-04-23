package com.edu.knowledge.controllers.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Answer;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.AnswerService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private AnswerService answerService;
	
	@RequestMapping(value="/app/user/{id}/changeprofile", method=RequestMethod.GET)
	public ModelAndView updateProfile(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("change_profile");
		User user = new User();
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value="/app/user/{id}/info", method=RequestMethod.GET)
	public ModelAndView userInfo(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("user_info");
		User user = userService.getOne(id);
		List<Question> questions = questionService.findAllByUser(id);
		List<Answer> answers = answerService.findAllByUser(id);
		mav.addObject("user", user);
		mav.addObject("questions", questions);
		mav.addObject("answers",answers);
		return mav;
	}
}
