package com.edu.knowledge.entities;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.edu.knowledge.utils.TimeUtil;

@Entity
@Table(name="tbl_cau_tra_loi")
public class Answer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_cau_tra_loi")
	private int answerId;
	
	@Column(name="noi_dung_tra_loi")
	private String answerContent;
	
	@Column(name="upvotes")
	private Integer upvotes = 0;
	
	@Column(name="downvotes")
	private Integer downvotes = 0;
	
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
	@JoinColumn(name="id_cau_hoi")
	private Question question;
	
	@OneToMany(mappedBy = "answer", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@OrderBy("creatAt ASC")
	private Set<Comment> comments;
	
	public Answer() {
	}

	public Answer(String answerContent, Integer upvotes, Integer downvotes,
			Date creatAt, Date lastEditAt, User user, Question question, Set<Comment> comments) {
		super();
		this.answerContent = answerContent;
		this.upvotes = upvotes;
		this.downvotes = downvotes;
		this.creatAt = creatAt;
		this.lastEditAt = lastEditAt;
		this.user = user;
		this.question = question;
		this.comments = comments;
	}

	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Integer getUpvotes() {
		return upvotes;
	}

	public void setUpvotes(Integer upvotes) {
		this.upvotes = upvotes;
	}

	public Integer getDownvotes() {
		return downvotes;
	}

	public void setDownvotes(Integer downvotes) {
		this.downvotes = downvotes;
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

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
	public String getAgo() throws ParseException {
        return TimeUtil.ago(creatAt);
    }
	
}
