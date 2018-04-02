package com.edu.knowledge.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.UserRepositery;
import com.edu.knowledge.entities.User;

@Service("userService")
@Transactional
public class UserService {

	@Autowired
	UserRepositery userRepositery;
	
	public List<User> findAllUser() {
		return userRepositery.findAll();
	}
	
	public boolean checkExistedUserByEmail(String emailAddress) {
		if(userRepositery.findUserByEmail(emailAddress) == null)
			return false;
		return true;
	}
	
	public boolean checkLogin(String email, String password) {
		return (userRepositery.getUserForLogin(email, password) != null) ? true : false;
	}
	
	public User saveUser(User user) {
		return (userRepositery.save(user));
	}
}
