package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.VoteDetail;

@Repository
public interface VoteDetailRepositery extends JpaRepository<VoteDetail, Integer>{

	@Query("SELECT v FROM VoteDetail v WHERE v.postId=?1 AND v.userId=?2")
	VoteDetail findByPostIdAndUserId(int postId, int userId);
	
	@Modifying
	@Query("DELETE FROM VoteDetail v WHERE v.id=?1")
	int deleteVote(int voteDetailId);
	
	@Query("SELECT v FROM VoteDetail v WHERE v.questionId=?1 AND v.userId=?2")
	VoteDetail findByQuestionIdAndUserId(int questionId, int userId);
	
	@Query("SELECT v FROM VoteDetail v WHERE v.answerId=?1 AND v.userId=?2")
	VoteDetail findByAnswerIdAndUserId(int answerId, int userId);
}
