package com.edu.knowledge.daos;

import java.util.List;


import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Question;

@Repository
public interface QuestionRepositery extends JpaRepository<Question, Integer>{

	@Query("SELECT count(*) FROM Question")
	int countQuestion();
	
	@Modifying
	@Query("DELETE FROM Question q WHERE q.questionId=?1")
	int deleteQuestion(int id);
	
	@Query("SELECT q FROM Question q WHERE q.user.userId=?1")
	List<Question> findAllByUser(int userId);
	
	@Query("SELECT q FROM Question q WHERE q.check=1 ORDER BY q.questionId DESC")
	List<Question> findLastNew(Pageable pageable);
	
	@Query("SELECT q FROM Question q WHERE q.check=1 ORDER BY q.upvotes DESC")
	List<Question> findTopVote(Pageable pageable);
	
	/*@Query("SELECT q FROM Question q LEFT JOIN fetch Answer a LEFT JOIN fetch a.user u WHERE u.userId=?1")
	List<Question> getQuestionHaveUserAnswer(int userId);*/
	
	@Modifying
	@Query("UPDATE Question q SET q.views=?1 WHERE q.questionId=?2")
	int updateView(int views, int questionId);
	
	@Query("SELECT q FROM Question q LEFT JOIN fetch q.topics t WHERE t.topicId=?1")
	List<Question> findAllByTopic(int topicId);
	
	@Query("SELECT q FROM Question q WHERE q.title LIKE CONCAT('%',:q,'%') OR q.questionContent LIKE CONCAT('%',:q,'%')")
	List<Question> search(@Param("q") String q);
	
	@Query("SELECT q FROM Question q WHERE q.check=?1")
	List<Question> getQuestionByCheck(int check);
	
	@Modifying
	@Query("UPDATE Question q SET q.check=?1 WHERE q.questionId=?2")
	int updateCheck(int check, int questionId);
	
	@Query("SELECT q FROM Question q WHERE q.check=1")
	List<Question> findAllChecked();
}
