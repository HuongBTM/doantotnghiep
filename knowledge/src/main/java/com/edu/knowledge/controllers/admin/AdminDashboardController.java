package com.edu.knowledge.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.services.UserService;

@Controller
public class AdminDashboardController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value="/admin/dashboard", method=RequestMethod.GET)
	public ModelAndView hello(){
		ModelAndView model = new ModelAndView("admin_dashboard");
		int countUsers = userService.count();
		int countQuestions = questionService.count();
		int countPosts = postService.count();
		int countTopics = topicService.count();
		
		model.addObject("countUsers", countUsers);
		model.addObject("countQuestions",countQuestions);
		model.addObject("countPosts",countPosts);
		model.addObject("countTopics",countTopics);
		return model;
	}
	
}
