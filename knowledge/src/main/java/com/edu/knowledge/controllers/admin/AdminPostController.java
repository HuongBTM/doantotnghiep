package com.edu.knowledge.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.TopicService;

@Controller
@RequestMapping("/admin/post")
public class AdminPostController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value ="/detail/{id}", method=RequestMethod.GET)
	public ModelAndView getOnePost(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("admin_post_detail");
		Post post = postService.getOne(id);
		mav.addObject("post", post);
		return mav;
	}
	
	@RequestMapping(value ="/allpost", method=RequestMethod.GET)
	public ModelAndView getAllPost() {
		ModelAndView mav = new ModelAndView("admin_post_list");
		List<Post> posts = postService.findAll();
		mav.addObject("posts", posts);
		return mav;
	}
	
	@RequestMapping(value="/addpost", method=RequestMethod.GET)
	public ModelAndView addPost() {
		ModelAndView model = new ModelAndView("admin_post_edit");
		Post post = new Post();
		List<Topic> topics = topicService.findAll();
		model.addObject("topics", topics);
		model.addObject("post", post);
		return model;
	}
	
	@RequestMapping(value="/addpost", method= RequestMethod.POST)
	public ModelAndView publicPost(@ModelAttribute("post") Post post, BindingResult result, RedirectAttributes redirect) {
		ModelAndView model = new ModelAndView();
		if(result.hasErrors()) {
			model.setViewName("admin_post_add");
		} else {
			postService.createPost(post);
			model.setViewName("redirect:/admin/post/allpost");
		}
		redirect.addFlashAttribute("success", "Your Post has been posted successfully!");
		return model;
	}
}
