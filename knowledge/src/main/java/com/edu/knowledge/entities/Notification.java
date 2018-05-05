package com.edu.knowledge.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name= "tbl_thong_bao")
public class Notification implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="id_thong_bao")
	private int notificationId;
	
	@Column(name="noi_dung_thong_bao")
	private String notiContent;
	
	@Column(name="link")
	private String link;
	
	@Column(name="ngay_thong_bao")
	@Temporal(TemporalType.TIMESTAMP)
	private Date notiAtDate;
	
	@Column(name="check_da_xem")
	private boolean checkSeen = false;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_thanh_vien")
	private User user;
	
	public Notification() {
	}

	public Notification(String notiContent, String link, Date notiAtDate, boolean checkSeen, User user) {
		super();
		this.notiContent = notiContent;
		this.link = link;
		this.notiAtDate = notiAtDate;
		this.checkSeen = checkSeen;
		this.user = user;
	}

	public Date getNotiAtDate() {
		return notiAtDate;
	}

	public void setNotiAtDate(Date notiAtDate) {
		this.notiAtDate = notiAtDate;
	}

	public String getNotiContent() {
		return notiContent;
	}

	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public boolean isCheckSeen() {
		return checkSeen;
	}

	public void setCheckSeen(boolean checkSeen) {
		this.checkSeen = checkSeen;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}
	
}
