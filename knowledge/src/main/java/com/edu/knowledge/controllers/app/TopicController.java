package com.edu.knowledge.controllers.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/app")
public class TopicController {

	@RequestMapping(value="/topic/detail/{id}", method=RequestMethod.GET)
	public ModelAndView topicDetail(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("topic_detail");
		return model;
	}
	
	// change method to Post
	@RequestMapping(value="/search/result", method=RequestMethod.GET)
	public ModelAndView searchResult() {
		ModelAndView model = new ModelAndView("search_result");
		return model;
	}
}
