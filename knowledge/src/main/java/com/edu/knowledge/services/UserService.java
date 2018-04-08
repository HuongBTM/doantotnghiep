package com.edu.knowledge.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.RoleRepositery;
import com.edu.knowledge.daos.UserRepositery;
import com.edu.knowledge.entities.Role;
import com.edu.knowledge.entities.User;

@Service("userService")
@Transactional
public class UserService {

	@Autowired
	UserRepositery userRepositery;
	
	@Autowired
	RoleRepositery roleRepositery;
	
	public List<User> findAllUser() {
		return userRepositery.findAllUser();
	}
	
	public boolean checkExistedUserByEmail(String emailAddress) {
		if(userRepositery.findUserByEmail(emailAddress) == null)
			return false;
		return true;
	}
	
	public boolean checkLogin(String email, String password) {
		return (userRepositery.getUserForLogin(email, password) != null) ? true : false;
	}
	
	public User createUser(User user, String roleName) {
		// set password encode TODO
		Role role = new Role();
		if(roleName.equals("admin")) {
			role = roleRepositery.findRoleByName("ROLE_ADMIN");
		} else {
			role = roleRepositery.findRoleByName("ROLE_MEMBER");
		}
		user.setRole(role);
		return userRepositery.save(user);
	}
	
	public boolean updateUser(User user, String roleName) {
		Role role = new Role();
		if(roleName.equals("admin")) {
			role = roleRepositery.findRoleByName("ROLE_ADMIN");
		} else {
			role = roleRepositery.findRoleByName("ROLE_MEMBER");
		}
		user.setRole(role);
		if(userRepositery.updateUser(user.getFullname(), user.getUsername(), user.getPassword(), user.getPhoneNum(), user.getAbouts(), user.getUserId()) ==0) {
			return false;
		}
		return true;
	}
	
	public User getOne(int userId) {
		return userRepositery.findUserById(userId);
	}
	
	public int count() {
		return userRepositery.countUser();
	}
	
	public User getUserByEmail(String email) {
		return userRepositery.findUserByEmail(email);
	}
}
