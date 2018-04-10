package com.edu.knowledge.daos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.User;

@Repository
public interface UserRepositery extends JpaRepository<User, Integer>{

	/*@Query("SELECT u FROM User u WHERE u.email = ?1")
	List<User> findAll(String email);*/
	
	@Query("SELECT u FROM User u WHERE u.email = ?1")
	User findUserByEmail(String emailAddress);
	
	@Query("SELECT u FROM User u WHERE u.email = ?1 and u.password = ?2")
	User getUserForLogin(String email, String password);
	
	@Query("SELECT u FROM User u WHERE u.userId = ?1")
	User findUserById(int userId);
	
	@Query("SELECT distinct u FROM User u JOIN fetch u.role")
	List<User> findAllUser();
	
	@Query("SELECT count(*) FROM User")
	int countUser();
	
	@Modifying
	@Query("UPDATE User u SET u.fullname=?1, u.username=?2, u.password =?3, u.email=?4, u.phoneNum=?5, u.address=?6, u.abouts=?7 WHERE u.userId=?8")
	int updateUser(String fullname, String username, String password, String email, int phoneNum, String address, String abouts, int userId);
	
	@Modifying
	@Query("DELETE FROM User u WHERE u.userId=?1")
	int deleteUser(int id);
}
