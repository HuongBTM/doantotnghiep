package com.edu.knowledge.controllers.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/app/post")
public class PostController {

	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	public ModelAndView questionDetail(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("post_detail");
		return model;
	}
}
