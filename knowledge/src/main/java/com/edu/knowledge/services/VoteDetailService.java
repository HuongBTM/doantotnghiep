package com.edu.knowledge.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.VoteDetailRepositery;
import com.edu.knowledge.entities.VoteDetail;

@Service("voteDetailService")
@Transactional
public class VoteDetailService {
	
	@Autowired
	private VoteDetailRepositery voteDetailRepositery;
	
	public void createVoteDetail(VoteDetail voteDetail) {
		voteDetailRepositery.save(voteDetail);
	}
	
	public VoteDetail findByPostIdAndUserId(int postId, int userId) {
		return voteDetailRepositery.findByPostIdAndUserId(postId, userId);
	}
	
	public int deleteVote(int voteDetailId) {
		return voteDetailRepositery.deleteVote(voteDetailId);
	}
	
	public VoteDetail findByQuestionIdAndUserId(int questionId, int userId) {
		return voteDetailRepositery.findByQuestionIdAndUserId(questionId, userId);
	}
	
	public VoteDetail findByAnswerIdAndUserId(int answerId, int userId) {
		return voteDetailRepositery.findByAnswerIdAndUserId(answerId, userId);
	}
}
