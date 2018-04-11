package com.edu.knowledge.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.PostRepositery;
import com.edu.knowledge.entities.Post;

@Service("postService")
@Transactional
public class PostService {

	@Autowired
	private PostRepositery postRepositery;
	
	public int count() {
		return postRepositery.countPost();
	}
	
	public Post getOne(int id) {
		return postRepositery.getOne(id);
	}
	
	public List<Post> findAll() {
		return postRepositery.findAll();
	}
}
