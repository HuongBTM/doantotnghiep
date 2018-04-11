package com.edu.knowledge.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.PostRepositery;
import com.edu.knowledge.daos.UserRepositery;
import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.User;

@Service("postService")
@Transactional
public class PostService {

	@Autowired
	private PostRepositery postRepositery;
	
	@Autowired
	private UserRepositery userRepositery;
	
	public int count() {
		return postRepositery.countPost();
	}
	
	public Post getOne(int id) {
		return postRepositery.getOne(id);
	}
	
	public List<Post> findAll() {
		return postRepositery.findAll();
	}
	
	public void createPost(Post post) {
		post.setCreatAt(new Date());
		post.setLastEditAt(new Date());
		
		//TODO get current user login
		User user = userRepositery.getOne(1);
		post.setUser(user);
		postRepositery.save(post);
	}
	
	public List<Post> findAllByUser(int userId) {
		return postRepositery.findAllByUser(userId);
	}
}
