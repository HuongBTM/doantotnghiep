package com.edu.knowledge.controllers.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/app")
public class HomeController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value="/home/question")
	public ModelAndView getNewQuestion() {
		ModelAndView mav = new ModelAndView("feed_new_question");
		List<Question> questions = questionService.findLast(Constant.QUESTION_LIMIT);
		List<Topic> topics = topicService.findAll();
		mav.addObject("questions", questions);
		mav.addObject("topics", topics);
		return mav;
	}
	
	@RequestMapping(value="/home/feed")
	public ModelAndView getFeed() {
		ModelAndView mav = new ModelAndView("feed");
		List<Question> questions = questionService.findLast(Constant.QUESTION_LIMIT);
		List<Topic> topics = topicService.findAll();
		mav.addObject("questions", questions);
		mav.addObject("topics", topics);
		return mav;
	}
	
	@RequestMapping(value="/home/post")
	public ModelAndView getNewPost() {
		ModelAndView mav = new ModelAndView("feed_new_post");
		List<Post> posts = postService.findLast(Constant.QUESTION_LIMIT);
		List<Topic> topics = topicService.findAll();
		mav.addObject("posts", posts);
		mav.addObject("topics", topics);
		return mav;
	}
	
	@RequestMapping(value="/user/{id}/notify", method=RequestMethod.GET)
	public ModelAndView notification(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("user_notification");
		return mav;
	}
}
