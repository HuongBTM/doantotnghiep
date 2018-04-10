package com.edu.knowledge.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.knowledge.services.AnswerService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/answer")
public class AdminAnswerController {

	@Autowired
	private AnswerService answerService;
	
	@RequestMapping(value = "/deleteanswer", method=RequestMethod.GET)
	@ResponseBody
	public String deleteAnswer(HttpServletRequest request) {
		int answerId = Integer.parseInt(request.getParameter("answerid").toString());
		if(answerService.deleteAnswer(answerId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
}
