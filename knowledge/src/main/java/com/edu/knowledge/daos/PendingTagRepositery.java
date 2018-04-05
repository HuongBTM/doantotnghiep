package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.PendingTag;

@Repository
public interface PendingTagRepositery extends JpaRepository<PendingTag, Integer> {

	@Query("SELECT p FROM PendingTag p WHERE p.pendingId=?1")
	PendingTag findPendingTagById(int pendingId);

	@Query("SELECT p.pendingName FROM PendingTag p WHERE p.pendingName=?1")
	String getExistPendingTagName(String pendingName);

	@Query("SELECT p.pendingName FROM PendingTag p WHERE p.pendingId!=?1 and p.pendingName=?2")
	String getOtherPendingTagNameToCurrent(int pendingId, String pendingName);

	@Modifying
	@Query("UPDATE PendingTag p SET p.pendingName=?1, p.pendingDescrib=?2 WHERE p.pendingId=?3")
	int updatePendingTag(String pendingName, String pendingDescrib, int pendingId);
	
	@Modifying
	@Query("DELETE FROM PendingTag p WHERE p.pendingId=?1")
	int deletePendingTag(int pendingId);
}
