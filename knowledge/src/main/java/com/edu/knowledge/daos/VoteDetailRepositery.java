package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.VoteDetail;

@Repository
public interface VoteDetailRepositery extends JpaRepository<VoteDetail, Integer>{

	//void create
}
