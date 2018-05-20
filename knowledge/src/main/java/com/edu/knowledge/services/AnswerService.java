package com.edu.knowledge.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.AnswerRepositery;
import com.edu.knowledge.daos.QuestionRepositery;
import com.edu.knowledge.daos.UserRepositery;
import com.edu.knowledge.entities.Answer;
import com.edu.knowledge.utils.Constant;

@Service("anwserService")
@Transactional
public class AnswerService {

	@Autowired
	private AnswerRepositery answerRepositery;
	
	@Autowired
	private UserRepositery userRepositery;
	
	@Autowired
	private QuestionRepositery questionRepositery;
	
	public Answer getOne(int id) {
		return answerRepositery.getOne(id);
	}

	public int deleteAnswer(int id) {
		return answerRepositery.deleteAnswer(id);
	}
	
	public List<Answer> findAllByUser(int userId) {
		return answerRepositery.findAllByUser(userId);
	}
	
	public List<Answer> getAll() {
		return answerRepositery.findAll();
	}
	
	public Answer createAnswer(Answer answer) {
		answer.setCreatAt(new Date());
		return answerRepositery.save(answer);
	}
	
	public int updateUpvotes(int answerId) {
		return answerRepositery.updateUpvotes(answerId);
	}
	
	public int removeUpvotes(int answerId) {
		return answerRepositery.removeUpvotes(answerId);
	}
	
	public int updateDownvotes(int answerId) {
		return answerRepositery.updateDownvotes(answerId);
	}
	
	public int removeDownvotes(int answerId) {
		return answerRepositery.removeDownvotes(answerId);
	}
	public void setBest(int qid, int aid, int oid) {
		Answer oldBest = answerRepositery.findBestAnswer(qid);
		if (oldBest != null) {
			answerRepositery.resetBest(qid);
			userRepositery.updatePoint( - Constant.POINTS_BEST_ANSWER, oldBest.getUser().getUserId());
		}
		answerRepositery.setBest(aid);
		questionRepositery.updateCheck(3, qid);
		userRepositery.updatePoint(Constant.POINTS_BEST_ANSWER, oid);
	}
	
	public int countBestAnswer(int userId) {
		return answerRepositery.countBestAnswer(userId);
	}
	
	public Answer updateAnswer(Answer answer) {
		answer.setLastEditAt(new Date());
		return answerRepositery.save(answer);
	}
}
