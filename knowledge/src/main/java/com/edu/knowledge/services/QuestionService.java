package com.edu.knowledge.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
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
	
	public void createQuestion(Question question) {
		question.setCreatAt(new Date());
		question.setLastEditAt(new Date());
		question.setViews(0);
		question.setUpvotes(0);
		question.setDownvotes(0);
		questionRepositery.save(question);
	}
	
	public Question updateQuestion(Question question) {
		question.setLastEditAt(new Date());
		return questionRepositery.save(question);
	}
	
	public List<Question> findAllByUser(int userId) {
		return questionRepositery.findAllByUser(userId);
	}
	
	@SuppressWarnings("deprecation")
	public List<Question> findTopNew(int limit) {
		return questionRepositery.findLastNew(new PageRequest(0,limit));
	}
	@SuppressWarnings("deprecation")
	public List<Question> findTopVote(int limit) {
		return questionRepositery.findTopVote(new PageRequest(0,limit));
	}
	
	@Transactional
	public int updateViews(int views, int questionId) {
		return questionRepositery.updateView(views, questionId);
	}
	
	public List<Question> findAllByTopic(int topicId) {
		return questionRepositery.findAllByTopic(topicId);
	}
	
	public List<Question> search(String q) {
		return questionRepositery.search(q);
	}
	
	public List<Question> getQuestionByCheck(int check) {
		return questionRepositery.getQuestionByCheck(check);
	}
	
	public int updateCheck(int check, int questionId) {
		return questionRepositery.updateCheck(check, questionId);
	}
	
	public List<Question> findAllChecked() {
		return questionRepositery.findAllChecked();
	}
	
	public int updateUpvotes(int questionId) {
		return questionRepositery.updateUpvotes(questionId);
	}
	
	public int removeUpvotes(int questionId) {
		return questionRepositery.removeUpvotes(questionId);
	}
	
	public int updateDownvotes(int questionId) {
		return questionRepositery.updateDownvotes(questionId);
	}
	
	public int removeDownvotes(int questionId) {
		return questionRepositery.removeDownvotes(questionId);
	}
}
