package com.edu.knowledge.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="tbl_vote_type")
public class VoteType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_vote_type")
	private int voteTypeId;
	
	@Column(name="ten_loai_vote")
	@NotNull
	private String voteTypeName;
	
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

	@Override
	public String toString() {
		return "VoteType [voteTypeId=" + voteTypeId + ", voteTypeName=" + voteTypeName + "]";
	}
	
}
