package com.edu.knowledge.controllers.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.services.TopicService;

@Controller
public class QuestionController {

	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value="/question", method=RequestMethod.GET)
	public ModelAndView hello(){
		ModelAndView model = new ModelAndView("question");
		return model;
	}
	
	@RequestMapping(value="/question/ask", method=RequestMethod.GET)
	public ModelAndView askQuestion(){
		ModelAndView model = new ModelAndView("question_form");
		Question question = new Question();
		List<Topic> topics = topicService.findAll();
		model.addObject("topics", topics);
		model.addObject("question",question);
		return model;
	}
}
