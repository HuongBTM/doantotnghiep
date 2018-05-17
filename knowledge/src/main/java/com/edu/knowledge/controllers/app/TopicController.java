package com.edu.knowledge.controllers.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.services.UserService;

@Controller
@RequestMapping("/app")
public class TopicController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private TopicService topicService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/topic/{id}/detail", method = RequestMethod.GET)
	public ModelAndView topicDetail(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("topic_detail");
		Topic topic = topicService.getOne(id);
		List<Question> questions = questionService.findAllByTopic(id);
		List<Post> posts = postService.finsAllByTopic(id);
		List<User> users = userService.findTopFiveExpect();
		model.addObject("topic", topic);
		model.addObject("questions", questions);
		model.addObject("posts", posts);
		model.addObject("users", users);
		return model;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView searchResult(@RequestParam(value = "q", required = true) String q) {
		ModelAndView model = new ModelAndView("search_result");
		System.out.println("search=" +q);
		List<Question> questions = questionService.search(q);
		List<Post> posts = postService.search(q);
		List<User> users = userService.findTopFiveExpect();
		List<Topic> topics = topicService.findTopTen();
		model.addObject("questions", questions);
		model.addObject("posts", posts);
		model.addObject("users", users);
		model.addObject("topics", topics);
		model.addObject("q", q);
		return model;
	}
	
}
