package com.edu.knowledge.controllers.expect;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.services.TopicService;

@Controller
@RequestMapping("/expect/topic")
public class ExpectTopicController {

	@Autowired
	private TopicService topicService;
	
	@RequestMapping("/all")
	public ModelAndView getAll() {
		ModelAndView mav = new ModelAndView("expect_topic_list");
		List<Topic> topicLst = new ArrayList<>();
		topicLst = topicService.findAll();
		mav.addObject("topicLst", topicLst);
		return mav;
	}
}
