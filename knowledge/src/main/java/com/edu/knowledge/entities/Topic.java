package com.edu.knowledge.entities;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "tbl_chu_de")
public class Topic {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_chu_de")
	private int topicId;
	
	@Column(name="ten_chu_de")
	@NotNull
	private String topicName;
	
	@Column(name="mo_ta_chu_de")
	private String topicDescribe;
	
	@ManyToMany(mappedBy = "topics", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Post> posts;
	
	@ManyToMany(mappedBy = "topics", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Question> questions;
	
	@Column(name="ngay_tao")
	private Date createDate;
	
	public Topic() {
	}

	public int getTopicId() {
		return topicId;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public String getTopicDescribe() {
		return topicDescribe;
	}

	public void setTopicDescribe(String topicDescribe) {
		this.topicDescribe = topicDescribe;
	}

	public Set<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	

	public Set<Post> getPosts() {
		return posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Topic(String topicName, String topicDescribe) {
		super();
		this.topicName = topicName;
		this.topicDescribe = topicDescribe;
	}

	
	@Override
	public String toString() {
		return "Topic [topicId=" + topicId + ", topicName=" + topicName + ", topicDescribe=" + topicDescribe + "]";
	}
	
}
