package com.edu.knowledge.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_vote_type")
public class VoteType {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_vote_type")
	private int voteTypeId;
	
	@Column(name="ten_loai_vote")
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
