package com.edu.knowledge.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Post;

@Repository
public interface PostRepositery extends JpaRepository<Post, Integer>{

	@Query("SELECT count(*) FROM Post")
	int countPost();
	
	@Query("SELECT p FROM Post p WHERE p.user.userId=?1")
	public List<Post> findAllByUser(int userId);
}
