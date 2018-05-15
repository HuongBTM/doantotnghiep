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

@Entity
@Table(name="tbl_request")
public class RequestExpect implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_request")
	private int requestId;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_cau_hoi")
	private Question question;
	
	@Column(name="id_nguoi_duoc_yeu_cau")
	private int userId;
	
	@Column(name="ngay_yeu_cau")
	private Date createAt;

	public RequestExpect() { }

	public RequestExpect(Question question, int userId, Date createAt) {
		super();
		this.question = question;
		this.userId = userId;
		this.createAt = createAt;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

}
