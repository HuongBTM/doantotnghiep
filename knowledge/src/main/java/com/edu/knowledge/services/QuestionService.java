package com.edu.knowledge.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.QuestionRepositery;
import com.edu.knowledge.daos.UserRepositery;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.User;

@Service("questionService")
@Transactional
public class QuestionService {

	@Autowired
	private QuestionRepositery questionRepositery;
	
	@Autowired
	private UserRepositery userRepositery;
	
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
	
	public void createQuestion(Question question) {
		question.setCreatAt(new Date());
		question.setLastEditAt(new Date());
		
		//TODO get by current login
		User user = userRepositery.getOne(1);
		question.setUser(user);
		
		questionRepositery.save(question);
	}
	
	public Question updateQuestion(Question question) {
		question.setLastEditAt(new Date());
		return questionRepositery.save(question);
	}
	
	public List<Question> findAllByUser(int userId) {
		return questionRepositery.findAllByUser(userId);
	}
	
	public List<Question> findLast(int limit) {
		return questionRepositery.findLast(limit);
	}
}
