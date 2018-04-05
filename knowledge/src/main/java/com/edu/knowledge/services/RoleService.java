package com.edu.knowledge.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.knowledge.daos.RoleRepositery;
import com.edu.knowledge.entities.Role;

@Service("roleService")
public class RoleService {

	@Autowired
	RoleRepositery roleRepositery;
	
	public List<Role> findAll() {
		return roleRepositery.findAll();
	}
	
	public Role getRoleById(int id) {
		return roleRepositery.findRoleById(id);
	}
	
	public Role saveRole(Role Role) {
		return roleRepositery.save(Role);
	}
	public boolean getOtherRoleNameToCurrent(int RoleId, String RoleName) {
		return (roleRepositery.getOtherRoleNameToCurrent(RoleId, RoleName) != null) ? true : false;
	}
	public boolean checkExistedRoleName(String name) {
		return (roleRepositery.getExistRoleName(name) !=null) ? true : false;
	}

	@Transactional
	public boolean updateRole(Role Role) {
		int rowUpdate = roleRepositery.updateRole(Role.getRoleName(), Role.getRoleDescrib(), Role.getRoleId());
		return (rowUpdate==0) ? false :true;
	}
	
	@Transactional
	public int deleteRole(int RoleId) {
		return roleRepositery.deleteRole(RoleId);
	}
}
