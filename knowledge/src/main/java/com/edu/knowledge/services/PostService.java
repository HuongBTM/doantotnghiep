package com.edu.knowledge.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
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
	
	public void createPost(Post post) {
		post.setCreatAt(new Date());
		post.setLastEditAt(new Date());
		
		postRepositery.save(post);
	}
	
	public List<Post> findAllByUser(int userId) {
		return postRepositery.findAllByUser(userId);
	}
	
	public Post updatePost(Post post) {
		post.setLastEditAt(new Date());
		return postRepositery.save(post);
	}
	
	@Transactional
	public int deletePost(int id) {
		return postRepositery.deletePost(id);
	}
	
	@Transactional
	public int updateView(int views, int postId) {
		return postRepositery.updateView(views, postId);
	}
	
	public List<Post> finsAllByTopic(int topicId) {
		return postRepositery.findAllByTopic(topicId);
	}
	
	public List<Post> search(String q) {
		return postRepositery.search(q);
	}
	
	@SuppressWarnings("deprecation")
	public List<Post> findTopVote(int limit) {
		return postRepositery.findTopVote(new PageRequest(0, limit));
	}
	@SuppressWarnings("deprecation")
	public List<Post> findTopNew(int limit) {
		return postRepositery.findTopNew(new PageRequest(0, limit));
	}
}
