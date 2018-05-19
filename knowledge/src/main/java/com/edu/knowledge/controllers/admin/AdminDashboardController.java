package com.edu.knowledge.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.services.UserService;
import com.edu.knowledge.utils.Constant;

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
		List<Question> newQuestions = questionService.findTopNew(Constant.DASBOARD_TOP_QUESTION);
		List<User> newUsers = userService.findTopNew();
		
		model.addObject("countUsers", countUsers);
		model.addObject("countQuestions",countQuestions);
		model.addObject("countPosts",countPosts);
		model.addObject("countTopics",countTopics);
		model.addObject("newQuestions",newQuestions);
		model.addObject("newUsers",newUsers);
		return model;
	}
	
}
