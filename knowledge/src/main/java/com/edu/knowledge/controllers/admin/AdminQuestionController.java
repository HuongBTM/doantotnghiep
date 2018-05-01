package com.edu.knowledge.controllers.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/question")
public class AdminQuestionController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private TopicService topicService;
	
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
	
	@RequestMapping(value="/addquestion", method=RequestMethod.GET)
	public ModelAndView askQuestion(){
		ModelAndView model = new ModelAndView("admin_question_edit");
		Question question = new Question();
		List<Topic> topics = topicService.findAll();
		model.addObject("topics", topics);
		model.addObject("question",question);
		return model;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editPost(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("admin_question_edit");
		Question question = questionService.getOne(id);
		List<Topic> topics = topicService.findAll();
		mav.addObject("topics", topics);
		mav.addObject("question", question);
		return mav;
	}
	
	@RequestMapping(value="/savequestion", method= RequestMethod.POST)
	public ModelAndView postQuestion(@ModelAttribute("question") Question question, BindingResult result, 
			RedirectAttributes redirect, HttpServletRequest request, HttpSession session) {
		ModelAndView model = new ModelAndView("admin_question_edit");
		int idHidden= Integer.parseInt(request.getParameter("questionId").toString());
		if(result.hasErrors()) {
			return model;
		} 
		if(idHidden==0) {
			User user = (User) session.getAttribute(Constant.CURRENT_USER);
			question.setUser(user);
			questionService.createQuestion(question);
		} else {
			Question questionUpdate= questionService.getOne(idHidden);
			questionUpdate.setTitle(question.getTitle());
			questionUpdate.setQuestionContent(question.getQuestionContent());
			questionUpdate.setTopics(question.getTopics());
			questionService.updateQuestion(questionUpdate);
		}
		model.setViewName("redirect:/admin/question/allquestion");
		redirect.addFlashAttribute("success", "Your question has been updated successfully!");
		return model;
	}
	
	@RequestMapping(value="/print", method=RequestMethod.GET)
	public ModelAndView print() {
		ModelAndView mav = new ModelAndView("admin_question_print");
		List<Question> questions = questionService.findAll();
		mav.addObject("questions",questions);
		return mav;
	}
}
