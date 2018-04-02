package com.edu.knowledge.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_linh_vuc")
public class Sector {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_linh_vuc")
	private int sectorId;
	
	@Column(name="ten_linh_vuc")
	private String sectorName;
	
	@Column(name="mo_ta_linh_vuc")
	private String describeSector;
	
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

}
