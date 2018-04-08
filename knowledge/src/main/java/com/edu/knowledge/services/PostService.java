package com.edu.knowledge.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.PostRepositery;

@Service("postService")
@Transactional
public class PostService {

	@Autowired
	private PostRepositery postRepositery;
	
	public int count() {
		return postRepositery.countPost();
	}
}
