package com.edu.knowledge.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.VoteDetailRepositery;
import com.edu.knowledge.entities.VoteDetail;

@Service("voteDetailService")
@Transactional
public class VoteDetailService {
	
	@Autowired
	private VoteDetailRepositery voteDetailRepositery;
	
	public void createVoteDetail(VoteDetail voteDetail) {
		voteDetailRepositery.save(voteDetail);
	}
}
