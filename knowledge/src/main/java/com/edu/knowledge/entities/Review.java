package com.edu.knowledge.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author admin
 *	TODO
 *
 */
@Entity
@Table(name="tbl_review")
public class Review implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	@Column(name="id_review")
	private int reviewId;
	@Column(name="id_cau_hoi")
	private int questionId;
	@Column(name="id_pending")
	private int pendingId;
	@Column(name="id_bai_viet")
	private int postId;
	@Column(name="id_thanh_vien")
	private int userId;
	@Column(name="thoi_gian")
	private Date timeToReview;
	@Column(name="ly_do")
	private String reason;
	
	public Review() {
	}

	public Review(int questionId, int pendingId, int postId, int userId, Date timeToReview, String reason) {
		super();
		this.questionId = questionId;
		this.pendingId = pendingId;
		this.postId = postId;
		this.userId = userId;
		this.timeToReview = timeToReview;
		this.reason = reason;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public int getPendingId() {
		return pendingId;
	}

	public void setPendingId(int pendingId) {
		this.pendingId = pendingId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getTimeToReview() {
		return timeToReview;
	}

	public void setTimeToReview(Date timeToReview) {
		this.timeToReview = timeToReview;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
