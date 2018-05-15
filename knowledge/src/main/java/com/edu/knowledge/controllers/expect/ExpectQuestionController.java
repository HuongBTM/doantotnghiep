package com.edu.knowledge.controllers.expect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Answer;
import com.edu.knowledge.entities.Comment;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.AnswerService;
import com.edu.knowledge.services.CommentService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.UserService;

@Controller
@RequestMapping("/expect/question")
public class ExpectQuestionController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/detail/{id}")
	public ModelAndView getDetail(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("expect_question_detail");
		Question question = questionService.getOne(id);
		questionService.updateViews(question.getViews()+1, id);
		Answer answer = new Answer();
		Comment comment = new Comment();
		model.addObject("question", question);
		model.addObject("answer", answer);
		model.addObject("comment",comment);
		return model;
	}
	
	@RequestMapping(value="/{questionId}/answer/{userId}/add", method=RequestMethod.POST)
	public ModelAndView addAnswer(@PathVariable("questionId") int questionId, @PathVariable("userId") int userId,
			@ModelAttribute("answer") Answer answer) {
		ModelAndView mav = new ModelAndView();
		Question question = questionService.getOne(questionId);
		User user = userService.getOne(userId);
		answer.setUser(user);
		answer.setQuestion(question);
		answerService.createAnswer(answer);
		mav.setViewName("redirect:/expect/question/detail/"+questionId);
		return mav;
	}
	
	@RequestMapping(value="/{questionId}/answer/{answerId}/comment/{userId}/add", method=RequestMethod.POST)
	public ModelAndView addComment(@PathVariable("questionId") int questionId, @PathVariable("answerId") int answerId,
			@PathVariable("userId") int userId, @ModelAttribute("comment") Comment comment) {
		ModelAndView mav = new ModelAndView();
		Answer answer = answerService.getOne(answerId);
		User user = userService.getOne(userId);
		comment.setAnswer(answer);
		comment.setUser(user);
		commentService.createComment(comment);
		mav.setViewName("redirect:/expect/question/detail/"+questionId);
		return mav;
	}
}
