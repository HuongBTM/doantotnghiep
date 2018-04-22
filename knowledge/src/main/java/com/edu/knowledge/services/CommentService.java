package com.edu.knowledge.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.CommentRepositery;
import com.edu.knowledge.entities.Comment;

@Service("commentService")
@Transactional
public class CommentService {

	@Autowired
	private CommentRepositery commentRepositery;
	
	@Transactional
	public int deleteComment(int id) {
		return commentRepositery.deleteComment(id);
	}
	
	public Comment createComment(Comment comment) {
		comment.setCreatAt(new Date());
		return commentRepositery.save(comment);
	}
}
