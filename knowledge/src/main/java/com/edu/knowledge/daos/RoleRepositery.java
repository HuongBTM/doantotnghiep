package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Role;

@Repository
public interface RoleRepositery extends JpaRepository<Role, Integer>{

	@Query("SELECT p FROM Role p WHERE p.roleId=?1")
	Role findRoleById(int roleId);
	
	@Query("SELECT p FROM Role p WHERE p.roleName=?1")
	Role findRoleByName(String name);

	@Query("SELECT p.roleName FROM Role p WHERE p.roleName=?1")
	String getExistRoleName(String roleName);

	@Query("SELECT p.roleName FROM Role p WHERE p.roleId!=?1 and p.roleName=?2")
	String getOtherRoleNameToCurrent(int roleId, String roleName);

	@Modifying
	@Query("UPDATE Role p SET p.roleName=?1, p.roleDescrib=?2 WHERE p.roleId=?3")
	int updateRole(String roleName, String roleDescrib, int roleId);
	
	@Modifying
	@Query("DELETE FROM Role p WHERE p.roleId=?1")
	int deleteRole(int roleId);
}
