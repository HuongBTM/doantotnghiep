package com.edu.knowledge.controllers.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.services.UserService;
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
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/home/question")
	public ModelAndView getNewQuestion() {
		ModelAndView mav = new ModelAndView("feed_new_question");
		List<Question> questions = questionService.findTopNew(Constant.FEED_NEW_LIMIT);
		List<Topic> topics = topicService.findTopTen();
		List<User> users = userService.findTopFiveExpect();
		mav.addObject("questions", questions);
		mav.addObject("topics", topics);
		mav.addObject("users", users);
		return mav;
	}
	
	@RequestMapping(value={"/home/feed", "/"})
	public ModelAndView getFeed() {
		ModelAndView mav = new ModelAndView("feed");
		List<Question> questions = questionService.findTopVote(Constant.FEED_TOP_LIMIT);
		List<Post> posts = postService.findTopVote(Constant.FEED_TOP_LIMIT);
		List<Topic> topics = topicService.findTopTen();
		System.out.println("topicSize="+topics.size());
		List<User> users = userService.findTopFiveExpect();
		mav.addObject("questions", questions);
		mav.addObject("posts", posts);
		mav.addObject("topics", topics);
		mav.addObject("users", users);
		return mav;
	}
	
	@RequestMapping(value="/home/post")
	public ModelAndView getNewPost() {
		ModelAndView mav = new ModelAndView("feed_new_post");
		List<Post> posts = postService.findTopNew(Constant.FEED_NEW_LIMIT);
		List<Topic> topics = topicService.findTopTen();
		List<User> users = userService.findTopFiveExpect();
		mav.addObject("posts", posts);
		mav.addObject("topics", topics);
		mav.addObject("users", users);
		return mav;
	}
	
	@RequestMapping(value="/home/topic")
	public ModelAndView getTopic() {
		ModelAndView mav = new ModelAndView("feed_topic");
		List<Topic> topics = topicService.findAllOrderBy();
		mav.addObject("topics", topics);
		return mav;
	}
	
}
