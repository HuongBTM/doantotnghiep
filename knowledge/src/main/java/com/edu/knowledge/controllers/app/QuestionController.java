package com.edu.knowledge.controllers.app;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;

@Controller
@RequestMapping("/app/question")
public class QuestionController {

	@Autowired
	private TopicService topicService;
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public ModelAndView hello(){
		ModelAndView model = new ModelAndView("question");
		return model;
	}
	
	@RequestMapping(value="/ask", method=RequestMethod.GET)
	public ModelAndView askQuestion(){
		ModelAndView model = new ModelAndView("question_form");
		Question question = new Question();
		List<Topic> topics = topicService.findAll();
		model.addObject("topics", topics);
		model.addObject("question",question);
		return model;
	}
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Set.class, "topics", new CustomCollectionEditor(Set.class) {
            @Override
            protected Object convertElement(Object element) {
                Integer id = Integer.parseInt((String) element);
                return topicService.getOne(id);
            }
        });
    }
	
	@RequestMapping(value="/ask", method= RequestMethod.POST)
	public ModelAndView postQuestion(@ModelAttribute("question") Question question, BindingResult result, RedirectAttributes redirect) {
		ModelAndView model = new ModelAndView();
		if(result.hasErrors()) {
			model.setViewName("question_form");
		} else {
			questionService.createQuestion(question);
			model.setViewName("redirect:/home");
		}
		redirect.addFlashAttribute("success", "Your question has been posted successfully!");
		return model;
	}
	
	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	public ModelAndView questionDetail(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("question_detail");
		return model;
	}
}
