package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.VoteType;

@Repository
public interface VoteTypeRepositery extends JpaRepository<VoteType, Integer>{

	@Query("SELECT v FROM VoteType v WHERE v.voteTypeId=?1")
	VoteType findVoteTypeById(int id);

	@Query("SELECT v.voteTypeName FROM VoteType v WHERE v.voteTypeName=?1")
	String getExistVoteTypeName(String name);

	@Query("SELECT v.voteTypeName FROM VoteType v WHERE v.voteTypeId!=?1 and v.voteTypeName=?2")
	String getOtherVoteTypeNameToCurrent(int id, String name);

	@Modifying
	@Query("UPDATE VoteType v SET v.voteTypeName=?1 WHERE v.voteTypeId=?2")
	int updateVoteType(String sectorName, int sectorId);
	
	@Modifying
	@Query("DELETE FROM VoteType v WHERE v.voteTypeId=?1")
	int deleteVoteType(int id);
}
