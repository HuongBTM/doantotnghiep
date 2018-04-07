package com.edu.knowledge.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "tbl_role")
public class Role implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_role")
	private int roleId;
	@Column(name="ten_quyen")
	@NotNull
	private String roleName;
	@Column(name="mo_ta_quyen")
	private String roleDescrib;
	
	@OneToMany(mappedBy = "role", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<User> users;
	
	public Set<User> getUser() {
		return users;
	}
	public void setUser(Set<User> user) {
		this.users = user;
	}
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
	public Role(@NotNull String roleName, String roleDescrib, Set<User> users) {
		super();
		this.roleName = roleName;
		this.roleDescrib = roleDescrib;
		this.users = users;
	}
	/*@Override
	public String toString() {
		String role="";
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject.put("id", this.roleId);
			jsonObject.put("name", this.roleName);
			jsonObject.put("describ", this.roleDescrib);
			
			JSONArray userArray = new JSONArray();
			if(userArray !=null) {
				this.user.forEach(user->{
	                JSONObject subJson = new JSONObject();
	                try {
						subJson.put("name", user.getUsername());
					} catch (JSONException e) {
						e.printStackTrace();
					}
	                userArray.put(subJson);
	            });
			}
			jsonObject.put("user", userArray);
			role=jsonObject.toString();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return role;
	}*/

}
