package com.edu.knowledge.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
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
	
	//TODO
	@Query("SELECT q FROM Question q ORDER BY q.questionId DESC")
	List<Question> findLast(int limit);
	
	/*@Query("SELECT q FROM Question q LEFT JOIN fetch Answer a LEFT JOIN fetch a.user u WHERE u.userId=?1")
	List<Question> getQuestionHaveUserAnswer(int userId);*/
}
