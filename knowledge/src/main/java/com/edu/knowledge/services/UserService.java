package com.edu.knowledge.services;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.knowledge.daos.RoleRepositery;
import com.edu.knowledge.daos.UserRepositery;
import com.edu.knowledge.entities.Role;
import com.edu.knowledge.entities.Sector;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.utils.Common;
import com.edu.knowledge.utils.Constant;

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
		return (userRepositery.getUserForLogin(email, Common.encryptMD5(password)) != null) ? true : false;
	}
	
	public User createUser(User user, Role role) {
		user.setRole(role);
		user.setImage("avatar.png");
		user.setPassword(Common.encryptMD5(user.getPassword()));
		return userRepositery.save(user);
	}
	
	public boolean updateUser(User user, Role role) {
		user.setRole(role);
		if(userRepositery.updateUser(user.getFullname(), user.getUsername(), Common.encryptMD5(user.getPassword()), user.getEmail(), user.getPhoneNum(), user.getAddress(), user.getAbouts(), role, user.getUserId()) != 0) {
			return true;
		}
		return false;
	}
	
	public void updateSector(Set<Sector> sectors, User user) {
		user.setSectors(sectors);
		user.setPassword(Common.encryptMD5(user.getPassword()));
		userRepositery.save(user);
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
	
	@Transactional
	public int deleteUser(int id) {
		return userRepositery.deleteUser(id);
	}
	
	@SuppressWarnings("deprecation")
	public List<User> findTopFiveExpect() {
		return userRepositery.findTopFiveExpect(new PageRequest(0, Constant.TOP_USER));
	}
	@SuppressWarnings("deprecation")
	public List<User> findTopNineExpect() {
		return userRepositery.findTopFiveExpect(new PageRequest(0, Constant.TOP_USER_REQUEST));
	}
	@SuppressWarnings("deprecation")
	public List<User> findTopNew() {
		return userRepositery.findTopNew(new PageRequest(0, Constant.DASBOARD_TOP_USER));
	}
	
	public int updatePoints(int points, int userId) {
		return userRepositery.updatePoint(points, userId);
	}
}
