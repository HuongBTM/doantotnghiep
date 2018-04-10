package com.edu.knowledge.daos;

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
}
