package com.edu.knowledge.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author admin
 * Chuyên gia
 *
 */
@Entity
@Table(name= "tbl_chuyen_gia")
public class Expect implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_chuyen_gia")
	private String expectId;
	@Column(name="id_thanh_vien")
	private int userId;
	@Column(name="id_linh_vuc")
	private int sectorId;
	@Column(name="diem_chuyen_gia")
	private int point;
	@Column(name="bang_sang_che")
	private String licenseInvention;
	@Column(name="dia_chi_web_ca_nhan")
	private String website;
	@Column(name="chung_chi")
	private String certificate;
	@Column(name="don_vi")
	private String department;
	
	public String getExpectId() {
		return expectId;
	}
	public void setExpectId(String expectId) {
		this.expectId = expectId;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getLicenseInvention() {
		return licenseInvention;
	}
	public void setLicenseInvention(String licenseInvention) {
		this.licenseInvention = licenseInvention;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getSectorId() {
		return sectorId;
	}
	public void setSectorId(int sectorId) {
		this.sectorId = sectorId;
	}
	public Expect() {
	}
	public Expect(int point, String licenseInvention, String website, String certificate, String department) {
		super();
		this.point = point;
		this.licenseInvention = licenseInvention;
		this.website = website;
		this.certificate = certificate;
		this.department = department;
	}
	
}
