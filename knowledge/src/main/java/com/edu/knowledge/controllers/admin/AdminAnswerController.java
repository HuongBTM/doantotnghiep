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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.knowledge.entities.Answer;
import com.edu.knowledge.services.AnswerService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/answer")
public class AdminAnswerController {

	@Autowired
	private AnswerService answerService;
	
	@RequestMapping(value="/detail/{id}", method = RequestMethod.GET)
	public ModelAndView getOneAnswer(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("admin_answer_detail");
		Answer answer = answerService.getOne(id);
		mav.addObject("answer",answer);
		return mav;
	}
	
	@RequestMapping(value = "/deleteanswer", method=RequestMethod.GET)
	@ResponseBody
	public String deleteAnswer(HttpServletRequest request, RedirectAttributes redirect) {
		int answerId = Integer.parseInt(request.getParameter("answerid").toString());
		if(answerService.deleteAnswer(answerId) ==1) {
			redirect.addFlashAttribute("success", "Bạn đã xóa thành công!");
			return Constant.SUCCESS;
		}
		redirect.addFlashAttribute("error", "Không thể xóa bản ghi này!");
		return Constant.ERROR;
	}
	
	@RequestMapping(value="/allanswer", method=RequestMethod.GET)
	public ModelAndView getAll() {
		ModelAndView mav = new ModelAndView("admin_answer_list");
		List<Answer> answers = answerService.getAll();
		mav.addObject("answers", answers);
		return mav;
	}
	
	@RequestMapping(value="/print", method=RequestMethod.GET)
	public ModelAndView print() {
		ModelAndView mav = new ModelAndView("admin_answer_print");
		List<Answer> answers = answerService.getAll();
		mav.addObject("answers", answers);
		return mav;
	}
}
