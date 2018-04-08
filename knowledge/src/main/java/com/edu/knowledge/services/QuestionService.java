package com.edu.knowledge.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.QuestionRepositery;

@Service("questionService")
@Transactional
public class QuestionService {

	@Autowired
	private QuestionRepositery questionRepositery;
	
	public int count() {
		return questionRepositery.countQuestion();
	}
}
