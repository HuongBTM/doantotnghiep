package com.edu.knowledge.daos;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Topic;

@Repository
public interface TopicRepositery extends JpaRepository<Topic, Integer>{

	@Query("SELECT count(*) FROM Topic")
	int countTopic();
	
	@Query("SELECT p FROM Topic p WHERE p.topicId=?1")
	Topic findTopicById(int TopicId);
	
	@Query("SELECT p FROM Topic p WHERE p.topicName=?1")
	Topic findTopicByName(String name);

	@Query("SELECT p.topicName FROM Topic p WHERE p.topicName=?1")
	String getExistTopicName(String TopicName);

	@Query("SELECT p.topicName FROM Topic p WHERE p.topicId!=?1 and p.topicName=?2")
	String getOtherTopicNameToCurrent(int topicId, String topicName);

	@Modifying
	@Query("UPDATE Topic p SET p.topicName=?1, p.topicDescribe=?2 WHERE p.topicId=?3")
	int updateTopic(String topicName, String topicDescribe, int topicId);
	
	@Modifying
	@Query("DELETE FROM Topic p WHERE p.topicId=?1")
	int deleteTopic(int topicId);
	
	/*good @Query("SELECT p FROM Topic p ORDER BY p.topicId DESC")
	List<Topic> findTopTen(Pageable pageable);*/
	
	@Query("SELECT p FROM Topic p ORDER BY p.posts.size DESC, p.questions.size DESC")
	List<Topic> findTopTen(Pageable pageable);
	
	@Query("SELECT p FROM Topic p ORDER BY p.posts.size DESC, p.questions.size DESC")
	List<Topic> findAllOrderBy();
}
