package com.edu.knowledge.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.knowledge.daos.PendingTagRepositery;
import com.edu.knowledge.entities.PendingTag;

@Service("pendingTagService")
public class PendingTagService {

	@Autowired
	PendingTagRepositery pendingTagRepositery;
	
	public List<PendingTag> findAll() {
		return pendingTagRepositery.findAll();
	}
	
	public PendingTag getPendingTagById(int id) {
		return pendingTagRepositery.findPendingTagById(id);
	}
	
	public PendingTag savePendingTag(PendingTag pendingTag) {
		return pendingTagRepositery.save(pendingTag);
	}
	public boolean getOtherPendingTagNameToCurrent(int pendingTagId, String pendingTagName) {
		return (pendingTagRepositery.getOtherPendingTagNameToCurrent(pendingTagId, pendingTagName) != null) ? true : false;
	}
	public boolean checkExistedPendingTagName(String name) {
		return (pendingTagRepositery.getExistPendingTagName(name) !=null) ? true : false;
	}

	@Transactional
	public boolean updatePendingTag(PendingTag pendingTag) {
		int rowUpdate = pendingTagRepositery.updatePendingTag(pendingTag.getPendingName(), pendingTag.getPendingDescrib(), pendingTag.getPendingContent(),  pendingTag.getPendingId());
		return (rowUpdate==0) ? false :true;
	}
	
	@Transactional
	public int deletePendingTag(int PendingTagId) {
		return pendingTagRepositery.deletePendingTag(PendingTagId);
	}
}
