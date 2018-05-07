package com.edu.knowledge.daos;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Post;

@Repository
public interface PostRepositery extends JpaRepository<Post, Integer>{

	@Query("SELECT count(*) FROM Post")
	int countPost();
	
	@Query("SELECT p FROM Post p WHERE p.user.userId=?1")
	public List<Post> findAllByUser(int userId);
	
	@Modifying
	@Query("DELETE FROM Post p WHERE p.postId=?1")
	int deletePost(int id);
	
	@Modifying
	@Query("UPDATE Post p SET p.views=?1 WHERE p.postId=?2")
	int updateView(int views, int postId);
	
	@Query("SELECT p FROM Post p LEFT JOIN FETCH  p.topics t WHERE t.topicId=?1")
	List<Post> findAllByTopic(int topicId);
	
	@Query("SELECT p FROM Post p WHERE p.postTitle LIKE CONCAT('%',:q,'%') OR p.postContent LIKE CONCAT('%',:q,'%')")
	List<Post> search(@Param("q") String q);
	
	@Query("SELECT p FROM Post p ORDER BY p.upvotes DESC")
	List<Post> findTopVote(Pageable pageable);
	
	@Query("SELECT p FROM Post p ORDER BY p.postId DESC")
	List<Post> findTopNew(Pageable pageable);
	
	@Modifying
	@Query("UPDATE Post p SET p.upvotes=p.upvotes+1 WHERE p.postId=?1")
	int updateUpvotes(int postId);
	
	@Modifying
	@Query("UPDATE Post p SET p.downvotes=p.downvotes+1 WHERE p.postId=?1")
	int updateDownvotes(int postId);
}
