package com.edu.knowledge.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.knowledge.daos.VoteTypeRepositery;
import com.edu.knowledge.entities.VoteType;

@Service("voteTypeService")
public class VoteTypeService {

	@Autowired
	VoteTypeRepositery typeRepositery;
	
	public List<VoteType> findAll() {
		return typeRepositery.findAll();
	}
	
	public VoteType getVoteTypeById(int id) {
		return typeRepositery.findVoteTypeById(id);
	}
	
	public VoteType saveVoteType(VoteType voteType) {
		return typeRepositery.save(voteType);
	}
	public boolean getOtherVoteTypeNameToCurrent(int id, String name) {
		return (typeRepositery.getOtherVoteTypeNameToCurrent(id, name) != null) ? true : false;
	}
	public boolean checkExistedVoteTypeName(String name) {
		return (typeRepositery.getExistVoteTypeName(name) !=null) ? true : false;
	}

	@Transactional
	public VoteType updateVoteType(VoteType voteType) {
		int rowUpdate = typeRepositery.updateVoteType(voteType.getVoteTypeName(), voteType.getVoteTypeId());
		System.out.println(rowUpdate);
		return getVoteTypeById(voteType.getVoteTypeId());
	}
	
	@Transactional
	public int deleteVoteType(int id) {
		return typeRepositery.deleteVoteType(id);
	}
}
