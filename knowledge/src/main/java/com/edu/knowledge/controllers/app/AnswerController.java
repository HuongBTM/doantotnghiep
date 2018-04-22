package com.edu.knowledge.controllers.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@RequestMapping("/app")
public class AnswerController {

	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/question/{questionId}/answer/{userId}/add", method=RequestMethod.POST)
	public ModelAndView addAnswer(@PathVariable("questionId") int questionId, @PathVariable("userId") int userId,
			@ModelAttribute("answer") Answer answer) {
		ModelAndView mav = new ModelAndView();
		Question question = questionService.getOne(questionId);
		User user = userService.getOne(userId);
		answer.setUser(user);
		answer.setQuestion(question);
		answerService.createAnswer(answer);
		mav.setViewName("redirect:/app/question/"+questionId+"/detail");
		return mav;
	}
}
