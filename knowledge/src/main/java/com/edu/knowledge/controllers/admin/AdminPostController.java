package com.edu.knowledge.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Post;
import com.edu.knowledge.services.PostService;

@Controller
@RequestMapping("/admin/post")
public class AdminPostController {

	@Autowired
	private PostService postService;
	
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
}
