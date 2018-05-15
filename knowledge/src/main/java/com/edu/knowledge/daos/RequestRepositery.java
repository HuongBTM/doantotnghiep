package com.edu.knowledge.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.RequestExpect;

@Repository
public interface RequestRepositery extends JpaRepository<RequestExpect, Integer>{

	List<RequestExpect> findAllByUserId(int userId);
}
