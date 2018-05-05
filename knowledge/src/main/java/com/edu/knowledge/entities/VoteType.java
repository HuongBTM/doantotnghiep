package com.edu.knowledge.entities;

import java.io.Serializable;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="tbl_loai_vote")
public class VoteType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_loai_vote")
	private int voteTypeId;
	
	@Column(name="ten_loai_vote")
	@NotNull
	private String voteTypeName;
	
	@JsonIgnore
	@ManyToMany(mappedBy = "voteTypes", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Post> posts;
	
	@JsonIgnore
	@ManyToMany(mappedBy = "voteTypes", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Question> questions;
	
	@JsonIgnore
	@ManyToMany(mappedBy = "voteTypes", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Answer> answers;
	
	@JsonIgnore
	@ManyToMany(mappedBy = "voteTypes", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<User> users;
	
	public VoteType() {
	}

	public VoteType(String voteTypeName) {
		super();
		this.voteTypeName = voteTypeName;
	}

	public int getVoteTypeId() {
		return voteTypeId;
	}

	public void setVoteTypeId(int voteTypeId) {
		this.voteTypeId = voteTypeId;
	}

	public String getVoteTypeName() {
		return voteTypeName;
	}

	public void setVoteTypeName(String voteTypeName) {
		this.voteTypeName = voteTypeName;
	}

	public Set<Post> getPosts() {
		return posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

	public Set<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}

	public Set<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "VoteType [voteTypeId=" + voteTypeId + ", voteTypeName=" + voteTypeName + "]";
	}
	
}
