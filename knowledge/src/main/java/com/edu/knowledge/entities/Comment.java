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
@Table(name="tbl_comment")
public class Comment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_comment")
	private int commentId;

	@Column(name = "noi_dung_cmt")
	private String cmtContent;
	
	@Column(name="ngay_dang")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creatAt;
	
	@Column(name="ngay_chinh_sua_cuoi")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastEditAt;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_thanh_vien")
	private User user;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_cau_tra_loi")
	private Answer answer;
	
	public Comment() {
	}

	public Comment(String cmtContent, Date creatAt, Date lastEditAt, User user, Answer answer) {
		super();
		this.cmtContent = cmtContent;
		this.creatAt = creatAt;
		this.lastEditAt = lastEditAt;
		this.user = user;
		this.answer = answer;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public Date getCreatAt() {
		return creatAt;
	}

	public void setCreatAt(Date creatAt) {
		this.creatAt = creatAt;
	}

	public Date getLastEditAt() {
		return lastEditAt;
	}

	public void setLastEditAt(Date lastEditAt) {
		this.lastEditAt = lastEditAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}
	
}
