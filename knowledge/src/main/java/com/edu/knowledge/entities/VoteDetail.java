package com.edu.knowledge.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_chi_tiet_vote")
public class VoteDetail implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_chi_tiet_vote")
	private int id;

	@Column(name = "id_loai_vote")
	private int voteTypeId;

	@Column(name = "id_cau_hoi")
	private int questionId;

	@Column(name = "id_bai_viet")
	private int postId;

	@Column(name = "id_cau_tra_loi")
	private int answerId;

	@Column(name = "id_thanh_vien")
	private int userId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getVoteTypeId() {
		return voteTypeId;
	}

	public void setVoteTypeId(int voteTypeId) {
		this.voteTypeId = voteTypeId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public VoteDetail() {}
	public VoteDetail(int voteTypeId, int questionId, int postId, int answerId, int userId) {
		super();
		this.voteTypeId = voteTypeId;
		this.questionId = questionId;
		this.postId = postId;
		this.answerId = answerId;
		this.userId = userId;
	}
	
}
