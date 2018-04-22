package com.edu.knowledge.controllers.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Answer;
import com.edu.knowledge.entities.Comment;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.AnswerService;
import com.edu.knowledge.services.CommentService;
import com.edu.knowledge.services.UserService;

@Controller
@RequestMapping("/app")
public class CommentController {

	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/question/{questionId}/answer/{answerId}/comment/{userId}/add", method=RequestMethod.POST)
	public ModelAndView addComment(@PathVariable("questionId") int questionId, @PathVariable("answerId") int answerId,
			@PathVariable("userId") int userId, @ModelAttribute("comment") Comment comment) {
		ModelAndView mav = new ModelAndView();
		Answer answer = answerService.getOne(answerId);
		User user = userService.getOne(userId);
		comment.setAnswer(answer);
		comment.setUser(user);
		commentService.createComment(comment);
		mav.setViewName("redirect:/app/question/"+questionId+"/detail");
		return mav;
	}
}
