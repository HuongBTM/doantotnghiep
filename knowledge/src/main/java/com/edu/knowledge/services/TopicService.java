package com.edu.knowledge.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.TopicRepositery;

@Service("topicService")
@Transactional
public class TopicService {

	@Autowired
	private TopicRepositery topicRepositery;
	
	public int count() {
		return topicRepositery.countTopic();
	}
}
