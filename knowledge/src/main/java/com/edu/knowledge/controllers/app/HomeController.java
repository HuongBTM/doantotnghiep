package com.edu.knowledge.controllers.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/app")
public class HomeController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value="/home")
	public ModelAndView getQuestion() {
		ModelAndView mav = new ModelAndView("home_list");
		List<Question> questions = questionService.findLast(Constant.QUESTION_LIMIT);
		List<Topic> topics = topicService.findAll();
		mav.addObject("questions", questions);
		mav.addObject("topics", topics);
		return mav;
	}
}
