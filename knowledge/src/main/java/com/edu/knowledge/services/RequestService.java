package com.edu.knowledge.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.RequestRepositery;
import com.edu.knowledge.entities.RequestExpect;

@Service("requestService")
@Transactional
public class RequestService {

	@Autowired
	private RequestRepositery requestRepositery;
	
	public void createRequest(RequestExpect requestExpect) {
		requestRepositery.save(requestExpect);
	}
	
	public List<RequestExpect> getAllRequest(int userId) {
		return requestRepositery.findAllByUserId(userId);
	}
}
