package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Comment;

@Repository
public interface CommentRepositery extends JpaRepository<Comment, Integer>{

	@Modifying
	@Query("DELETE FROM Comment c WHERE c.commentId=?1")
	int deleteComment(int id);
}
