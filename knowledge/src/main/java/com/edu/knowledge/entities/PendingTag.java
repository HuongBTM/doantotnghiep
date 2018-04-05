package com.edu.knowledge.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_pending_tag")
public class PendingTag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_pending")
	private int pendingId;
	@Column(name="ten_trang_thai")
	private String pendingName;
	@Column(name="mo_ta_trang_thai")
	private String pendingDescrib;
	
	public int getPendingId() {
		return pendingId;
	}
	public void setPendingId(int pendingId) {
		this.pendingId = pendingId;
	}
	public String getPendingName() {
		return pendingName;
	}
	public void setPendingName(String pendingName) {
		this.pendingName = pendingName;
	}
	public String getPendingDescrib() {
		return pendingDescrib;
	}
	public void setPendingDescrib(String pendingDescrib) {
		this.pendingDescrib = pendingDescrib;
	}
	public PendingTag() {
	}
	public PendingTag(String pendingName, String pendingDescrib) {
		super();
		this.pendingName = pendingName;
		this.pendingDescrib = pendingDescrib;
	}
	@Override
	public String toString() {
		return "PendingTag [pendingId=" + pendingId + ", pendingName=" + pendingName + ", pendingDescrib="
				+ pendingDescrib + "]";
	}
	
}
