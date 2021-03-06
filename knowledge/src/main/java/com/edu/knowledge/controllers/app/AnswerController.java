package com.edu.knowledge.controllers.app;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Answer;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.entities.VoteDetail;
import com.edu.knowledge.services.AnswerService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.UserService;
import com.edu.knowledge.services.VoteDetailService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/app")
public class AnswerController {

	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private VoteDetailService voteDetailService;
	
	@RequestMapping(value="/question/{questionId}/answer/{userId}/add", method=RequestMethod.POST)
	public ModelAndView addAnswer(@PathVariable("questionId") int questionId, @PathVariable("userId") int userId,
			@ModelAttribute("answer") Answer answer) {
		ModelAndView mav = new ModelAndView();
		Question question = questionService.getOne(questionId);
		User user = userService.getOne(userId);
		answer.setUser(user);
		answer.setQuestion(question);
		answerService.createAnswer(answer);
		userService.updatePoints(Constant.POINTS_MEMBER_NEW_ANSWER, userId);
		mav.setViewName("redirect:/app/question/"+questionId+"/detail");
		return mav;
	}
	
	/**
	 * 
	 * @param answerId id câu trả lời
	 * @param ownerId id người đăng bài viết
	 * @param userId id thành viên vote
	 * @param action upvote/ downvote
	 * @return success/ voted
	 */
	@RequestMapping("/answer/vote")
	@ResponseBody
	public String answerVote(@RequestParam("aid") int answerId, @RequestParam("oid") int ownerId,
			@RequestParam("uid") int userId, @RequestParam("action") String action) {
		VoteDetail voteDetail = new VoteDetail();
		voteDetail.setAnswerId(answerId);
		voteDetail.setUserId(userId);
		VoteDetail voteDetailDb = voteDetailService.findByAnswerIdAndUserId(answerId, userId);
		if(voteDetailDb == null) {
			voteDetailService.createVoteDetail(voteDetail);
			if(action.equals(Constant.ACTION_UPVOTE)) {				
				voteDetail.setVoteTypeId(Constant.UPVOTE_ID);
				answerService.updateUpvotes(answerId);
				userService.updatePoints(Constant.POINTS_ANSWER_UPVOTED, ownerId);
			} else {
				voteDetail.setVoteTypeId(Constant.DOWNVOTE_ID);
				answerService.updateDownvotes(answerId);
				userService.updatePoints(Constant.POINTS_DOWNVOTED, ownerId);
			}
			return "success";
		} else {
			voteDetailService.deleteVote(voteDetailDb.getId());
			if(action.equals(Constant.ACTION_UPVOTE)) {				
				answerService.removeUpvotes(answerId);
				userService.updatePoints(Constant.REMOVE_ANSWER_UPVOTE_POINT, ownerId);
			} else {
				answerService.removeDownvotes(answerId);
				userService.updatePoints(Constant.REMOVE_ANSWER_DOWNVOTE_POINT, ownerId);
			}
			return "voted";
		}
		
	}
	
	/**
	 * 
	 * @param qid id câu hỏi
	 * @param aid id câu trả lời
	 * @param uid người trả lời, dk set point
	 * @return
	 */
	@RequestMapping(value="/answer/setbest")
	@ResponseBody
	public String setBest(@RequestParam("qid") int qid, 
			  @RequestParam("aid") int aid, @RequestParam("oid") int oid) {
		answerService.setBest(qid, aid, oid);
		return "success";
	}
	
	@RequestMapping(value="/answer/saveanswer", method=RequestMethod.POST)
	@ResponseBody
	public String saveAnswer(@ModelAttribute("answer") Answer answer, HttpServletRequest request) {
		int idHidden = Integer.parseInt(request.getParameter("idAnswerHidden"));
		Answer answerDB = answerService.getOne(idHidden);
		answerDB.setAnswerContent(answer.getAnswerContent());
		answerService.updateAnswer(answerDB);
		return "success";
	}
	
	@RequestMapping(value = "/answer/deleteanswer", method=RequestMethod.GET)
	@ResponseBody
	public String deleteAnswer(HttpServletRequest request) {
		int answerId = Integer.parseInt(request.getParameter("answerid").toString());
		if(answerService.deleteAnswer(answerId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
	
	@RequestMapping(value = "/answer/findone/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Answer getOneById(@PathVariable("id") int id) {
		return answerService.getOne(id);
	}
}
