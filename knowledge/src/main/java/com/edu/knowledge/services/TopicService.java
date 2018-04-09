package com.edu.knowledge.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.TopicRepositery;
import com.edu.knowledge.entities.Topic;

@Service("topicService")
@Transactional
public class TopicService {

	@Autowired
	private TopicRepositery topicRepositery;
	
	public int count() {
		return topicRepositery.countTopic();
	}
	
	public List<Topic> findAll() {
		return topicRepositery.findAll();
	}
	
	public Topic getTopicById(int id) {
		return topicRepositery.findTopicById(id);
	}
	
	public Topic saveTopic(Topic topic) {
		return topicRepositery.save(topic);
	}
	public boolean getOtherTopicNameToCurrent(int topicId, String topicName) {
		return (topicRepositery.getOtherTopicNameToCurrent(topicId, topicName) != null) ? true : false;
	}
	public boolean checkExistedTopicName(String name) {
		return (topicRepositery.getExistTopicName(name) !=null) ? true : false;
	}

	@Transactional
	public boolean updateTopic(Topic topic) {
		int rowUpdate = topicRepositery.updateTopic(topic.getTopicName(), topic.getTopicDescribe(), topic.getTopicId());
		return (rowUpdate==0) ? false :true;
	}
	
	@Transactional
	public int deleteTopic(int topicId) {
		return topicRepositery.deleteTopic(topicId);
	}
}
