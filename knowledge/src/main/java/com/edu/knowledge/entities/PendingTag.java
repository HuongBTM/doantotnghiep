package com.edu.knowledge.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="tbl_pending_tag")
public class PendingTag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_pending")
	private int pendingId;
	@Column(name="ten_trang_thai")
	@NotNull
	private String pendingName;
	@Column(name="mo_ta_trang_thai")
	private String pendingDescrib;
	
	@Column(name="noi_dung_thong_bao")
	private String pendingContent;
	
	/*@OneToMany
	private Set<Question> questions;*/
	
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
	
	public String getPendingContent() {
		return pendingContent;
	}
	public void setPendingContent(String pendingContent) {
		this.pendingContent = pendingContent;
	}
	public PendingTag() {
	}
	public PendingTag(String pendingName, String pendingDescrib) {
		super();
		this.pendingName = pendingName;
		this.pendingDescrib = pendingDescrib;
	}
	
	public PendingTag(@NotNull String pendingName, String pendingDescrib, String pendingContent) {
		super();
		this.pendingName = pendingName;
		this.pendingDescrib = pendingDescrib;
		this.pendingContent = pendingContent;
	}
	@Override
	public String toString() {
		return "PendingTag [pendingId=" + pendingId + ", pendingName=" + pendingName + ", pendingDescrib="
				+ pendingDescrib + ", pendingContent="+ pendingContent + "]";
	}
	
}
