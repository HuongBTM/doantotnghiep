package com.edu.knowledge.controllers.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Question;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/question")
public class AdminQuestionController {

	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(value="/allquestion", method=RequestMethod.GET)
	public ModelAndView getAllQuestion() {
		ModelAndView mav = new ModelAndView("admin_question_list");
		List<Question> questions = questionService.findAll();
		mav.addObject("questions",questions);
		return mav;
	}
	
	@RequestMapping(value="/detail/{id}", method = RequestMethod.GET)
	public ModelAndView getOneQuestion(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("admin_question_detail");
		Question question = questionService.getOne(id);
		mav.addObject("question",question);
		return mav;
	}
	
	@RequestMapping(value = "/deletequestion", method=RequestMethod.GET)
	@ResponseBody
	public String deleteQuestion(HttpServletRequest request) {
		int questionId = Integer.parseInt(request.getParameter("questionid").toString());
		if(questionService.deleteQuestion(questionId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
}
