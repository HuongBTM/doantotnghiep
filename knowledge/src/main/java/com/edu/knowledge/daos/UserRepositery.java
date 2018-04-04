package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
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
}
