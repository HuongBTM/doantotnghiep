package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Topic;

@Repository
public interface TopicRepositery extends JpaRepository<Topic, Integer>{

	@Query("SELECT count(*) FROM Topic")
	int countTopic();
}
