package com.edu.knowledge.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.QuestionRepositery;
import com.edu.knowledge.entities.Question;

@Service("questionService")
@Transactional
public class QuestionService {

	@Autowired
	private QuestionRepositery questionRepositery;
	
	public int count() {
		return questionRepositery.countQuestion();
	}
	
	public List<Question> findAll() {
		return questionRepositery.findAll();
	}
	
	public Question getOne(int id) {
		return questionRepositery.getOne(id);
	}
	
	@Transactional
	public int deleteQuestion(int id) {
		return questionRepositery.deleteQuestion(id);
	}
}
