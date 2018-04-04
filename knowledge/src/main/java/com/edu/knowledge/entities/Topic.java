package com.edu.knowledge.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_chu_de")
public class Topic {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_chu_de")
	private int topicId;
	
	@Column(name="ten_chu_de")
	private String topicName;
	
	@Column(name="mo_ta_chu_de")
	private String topicDescribe;
	
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
