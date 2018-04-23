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
import com.edu.knowledge.services.PostService;

@Controller
@RequestMapping("/app/post")
public class PostController {

	@Autowired
	private PostService postService;

	@RequestMapping(value = "/{id}/detail", method = RequestMethod.GET)
	public ModelAndView postDetail(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("post_detail");
		Post post = postService.getOne(id);
		postService.updateView(post.getViews() + 1, id);
		post.setViews(post.getViews() + 1);
		Question question = new Question();
		model.addObject("post", post);
		model.addObject("question", question);
		return model;
	}
	
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public ModelAndView allPost() {
		ModelAndView mav = new ModelAndView("post_list");
		List<Post> newPosts = postService.findAll();
		mav.addObject("newPosts", newPosts);
		return mav;
	}
}
