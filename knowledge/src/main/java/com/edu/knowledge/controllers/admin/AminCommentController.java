package com.edu.knowledge.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.knowledge.services.CommentService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/comment")
public class AminCommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/deletecomment", method=RequestMethod.GET)
	@ResponseBody
	public String deleteComment(HttpServletRequest request) {
		int commentId = Integer.parseInt(request.getParameter("commentid").toString());
		if(commentService.deleteComment(commentId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
}
