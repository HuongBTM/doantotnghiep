package com.edu.knowledge.controllers.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuestionController {

	@RequestMapping(value="/question", method=RequestMethod.GET)
	public ModelAndView hello(){
		ModelAndView model = new ModelAndView("question");
		return model;
	}
}
