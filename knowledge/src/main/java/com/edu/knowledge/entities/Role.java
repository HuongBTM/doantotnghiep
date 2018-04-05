package com.edu.knowledge.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_role")
public class Role implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_role")
	private int roleId;
	@Column(name="ten_quyen")
	private String roleName;
	@Column(name="mo_ta_quyen")
	private String roleDescrib;
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDescrib() {
		return roleDescrib;
	}
	public void setRoleDescrib(String roleDescrib) {
		this.roleDescrib = roleDescrib;
	}
	public Role() {
	}
	public Role(String roleName, String roleDescrib) {
		super();
		this.roleName = roleName;
		this.roleDescrib = roleDescrib;
	}
	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", roleDescrib=" + roleDescrib + "]";
	}
	
}
