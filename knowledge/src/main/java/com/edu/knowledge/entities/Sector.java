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
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "tbl_linh_vuc")
public class Sector implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_linh_vuc")
	private int sectorId;
	
	@Column(name="ten_linh_vuc")
	@NotNull
	private String sectorName;
	
	@Column(name="mo_ta_linh_vuc")
	private String describeSector;
	
	@ManyToMany(mappedBy = "sectors", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<User> users;
	
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public int getSectorId() {
		return sectorId;
	}
	public void setSectorId(int sectorId) {
		this.sectorId = sectorId;
	}
	public String getSectorName() {
		return sectorName;
	}
	public void setSectorName(String sectorName) {
		this.sectorName = sectorName;
	}
	public String getDescribeSector() {
		return describeSector;
	}
	public void setDescribeSector(String describeSector) {
		this.describeSector = describeSector;
	}
	
	public Sector() {
	}
	public Sector(String sectorName, String describeSector) {
		super();
		this.sectorName = sectorName;
		this.describeSector = describeSector;
	}
	public Sector(@NotNull String sectorName, String describeSector, Set<User> users) {
		super();
		this.sectorName = sectorName;
		this.describeSector = describeSector;
		this.users = users;
	}
	
}
