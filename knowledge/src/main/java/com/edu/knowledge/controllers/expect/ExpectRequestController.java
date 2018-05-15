package com.edu.knowledge.controllers.expect;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.RequestExpect;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.RequestService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/expect/request")
public class ExpectRequestController {

	@Autowired
	private RequestService requestService;
	
	@RequestMapping(value ="/all", method=RequestMethod.GET)
	public ModelAndView getAllRequest(HttpSession session) {
		ModelAndView mav = new ModelAndView("expect_request_list");
		User user = (User) session.getAttribute(Constant.CURRENT_USER);
		List<RequestExpect> requestExpects = requestService.getAllRequest(user.getUserId());
		mav.addObject("requestExpects", requestExpects);
		return mav;
	}
}
