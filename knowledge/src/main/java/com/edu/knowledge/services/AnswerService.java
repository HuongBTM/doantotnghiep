package com.edu.knowledge.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.AnswerRepositery;

@Service("anwserService")
@Transactional
public class AnswerService {

	@Autowired
	private AnswerRepositery answerRepositery;
	
	@Transactional
	public int deleteAnswer(int id) {
		return answerRepositery.deleteAnswer(id);
	}
}
