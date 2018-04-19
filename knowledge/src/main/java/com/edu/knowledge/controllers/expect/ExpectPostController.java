package com.edu.knowledge.controllers.expect;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/expect/post")
public class ExpectPostController {

	@Autowired
	private PostService postService;

	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value ="/detail/{id}", method=RequestMethod.GET)
	public ModelAndView getOnePost(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("expect_post_detail");
		Post post = postService.getOne(id);
		mav.addObject("post", post);
		return mav;
	}
	
	@RequestMapping(value ="/all", method=RequestMethod.GET)
	public ModelAndView getAllPost() {
		ModelAndView mav = new ModelAndView("expect_post_list");
		// TODO get userid in current
		List<Post> posts = postService.findAllByUser(1);
		mav.addObject("posts", posts);
		return mav;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView addPost() {
		ModelAndView model = new ModelAndView("expect_post_edit");
		Post post = new Post();
		Topic topic = new Topic();
		List<Topic> topics = topicService.findAll();
		model.addObject("topic",topic);
		model.addObject("topics", topics);
		model.addObject("post", post);
		return model;
	}
	
	@RequestMapping(value="/save", method= RequestMethod.POST)
	public ModelAndView publicPost(@ModelAttribute("post") Post post, BindingResult result, 
			RedirectAttributes redirect, HttpServletRequest request) {
		ModelAndView model = new ModelAndView("expect_post_edit");
		int idHidden= Integer.parseInt(request.getParameter("postId").toString());
		if(result.hasErrors()) {
			return model;
		}
		if(idHidden==0) {
			postService.createPost(post);
		} else {
			Post postUpdate = postService.getOne(idHidden);
			postUpdate.setPostTitle(post.getPostTitle());
			postUpdate.setTopics(post.getTopics());
			postUpdate.setPostContent(post.getPostContent());
			postService.updatePost(postUpdate);
		}
		model.setViewName("redirect:/expect/post/all");
		redirect.addFlashAttribute("success", "Your Post has been posted successfully!");
		return model;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editPost(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("expect_post_edit");
		Post post = postService.getOne(id);
		Topic topic = new Topic();
		List<Topic> topics = topicService.findAll();
		mav.addObject("topics", topics);
		mav.addObject("post", post);
		mav.addObject("topic", topic);
		return mav;
	}
	
	@RequestMapping(value ="/print", method=RequestMethod.GET)
	public ModelAndView print() {
		ModelAndView mav = new ModelAndView("expect_post_print");
		List<Post> posts = postService.findAll();
		mav.addObject("posts", posts);
		return mav;
	}
	
	@RequestMapping(value = "/delete", method=RequestMethod.GET)
	@ResponseBody
	public String deletePost(HttpServletRequest request) {
		int postId = Integer.parseInt(request.getParameter("postid").toString());
		if(postService.deletePost(postId) == 1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
}
