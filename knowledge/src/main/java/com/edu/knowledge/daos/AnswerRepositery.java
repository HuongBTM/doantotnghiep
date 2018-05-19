package com.edu.knowledge.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Answer;

@Repository
public interface AnswerRepositery extends JpaRepository<Answer, Integer>{

	@Modifying
	@Query("DELETE FROM Answer a WHERE a.answerId=?1")
	int deleteAnswer(int id);
	
	@Query("SELECT a FROM Answer a WHERE a.user.userId=?1")
	public List<Answer> findAllByUser(int userId);
	
	@Modifying
	@Query("UPDATE Answer a SET a.upvotes=a.upvotes+1 WHERE a.answerId=?1")
	int updateUpvotes(int answerId);
	
	@Modifying
	@Query("UPDATE Answer a SET a.upvotes=a.upvotes-1 WHERE a.answerId=?1")
	int removeUpvotes(int answerId);
	
	@Modifying
	@Query("UPDATE Answer a SET a.downvotes=a.downvotes+1 WHERE a.answerId=?1")
	int updateDownvotes(int answerId);
	
	@Modifying
	@Query("UPDATE Answer a SET a.downvotes=a.downvotes-1 WHERE a.answerId=?1")
	int removeDownvotes(int answerId);
	
	@Query("SELECT a FROM Answer a LEFT JOIN fetch a.question q WHERE q.questionId=?1 and a.best=1")
	Answer findBestAnswer(int questionId);
	
	@Modifying
	@Query("UPDATE Answer a SET a.best=0 WHERE a.question.questionId=?1")
	void resetBest(int questionId);
	
	@Modifying
	@Query("UPDATE Answer a SET a.best=1 WHERE a.answerId=?1")
	void setBest(int answerId);
	
	@Query("SELECT COUNT(*) FROM Answer a WHERE a.user.userId=?1 and a.best=1")
	int countBestAnswer(int userId);
}
