package com.edu.knowledge.daos;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Role;
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
	@Query("UPDATE User u SET u.fullname=?1, u.username=?2, u.password =?3, u.email=?4, u.phoneNum=?5, u.address=?6, u.abouts=?7, u.role=?8 WHERE u.userId=?9")
	int updateUser(String fullname, String username, String password, String email, int phoneNum, String address, String abouts, Role role, int userId);
	
	@Modifying
	@Query("DELETE FROM User u WHERE u.userId=?1")
	int deleteUser(int id);
	
	@Query("SELECT u FROM User u JOIN fetch u.role r WHERE r.roleId=5 ORDER BY u.points DESC")
	List<User> findTopFiveExpect(Pageable pageable);
	
	@Query("SELECT u FROM User u JOIN fetch u.role r ORDER BY u.createDate DESC")
	List<User> findTopNew(Pageable pageable);
	
	@Modifying
	@Query("UPDATE User u SET u.points=u.points+?1 WHERE u.userId=?2")
	int updatePoint(int points, int userId);
}
