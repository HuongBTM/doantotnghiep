package com.edu.knowledge.daos;

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
}
