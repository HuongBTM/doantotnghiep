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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;

import com.edu.knowledge.utils.Constant;
import com.edu.knowledge.utils.TimeUtil;

/**
 * 
 * @author admin
 * tbl_bai_viet
 *
 */

@Entity
@Table(name="tbl_bai_viet")
public class Post implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_bai_viet")
	private int postId;
	
	@Column(name="title")
	private String postTitle;
	
	@Column(name="noi_dung_bai_viet")
	private String postContent;
	
	@Column(name="anh_content")
	private String postImg;
	@Column(name="file")
	private String postFile;
	@Column(name="upvotes")
	private int upvotes;
	@Column(name="downvotes")
	private int downvotes;
	@Column(name="views")
	private int views;
	
	@Column(name="ngay_dang")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creatAt;
	
	@Column(name="ngay_chinh_sua")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastEditAt;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_thanh_vien")
	private User user;
	
	@OneToMany(mappedBy = "post", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Question> questions;
	
	@NotEmpty
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tbl_ct_chu_de_bai_viet", 
             joinColumns = { @JoinColumn(name = "id_bai_viet") }, 
             inverseJoinColumns = { @JoinColumn(name = "id_chu_de") })
	private Set<Topic> topics;
	
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tbl_chi_tiet_vote", 
             joinColumns = { @JoinColumn(name = "id_bai_viet") }, 
             inverseJoinColumns = { @JoinColumn(name = "id_vote_type") })
	private Set<VoteType> voteTypes;
	
	public Post() {
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostImg() {
		return postImg;
	}

	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}

	public String getPostFile() {
		return postFile;
	}

	public void setPostFile(String postFile) {
		this.postFile = postFile;
	}

	public int getUpvotes() {
		return upvotes;
	}

	public void setUpvotes(int upvotes) {
		this.upvotes = upvotes;
	}

	public int getDownvotes() {
		return downvotes;
	}

	public void setDownvotes(int downvotes) {
		this.downvotes = downvotes;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
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

	public Set<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}

	public Set<Topic> getTopics() {
		return topics;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public Set<VoteType> getVoteTypes() {
		return voteTypes;
	}

	public void setVoteTypes(Set<VoteType> voteTypes) {
		this.voteTypes = voteTypes;
	}
	
	public String getAgo() throws ParseException {
        return TimeUtil.ago(creatAt);
    }
	
	public String getSummary() {
		if (postContent.length() >= 300) {
			return postContent.substring(0, Constant.SUMMARY) + ".....";
		} else {
			return postContent;
		}
	}

	public Post(String postContent, String postImg, String postFile, int upvotes, int downvotes, int views,
			Date creatAt, Date lastEditAt, User user, Set<Question> questions, @NotEmpty Set<Topic> topics) {
		super();
		this.postContent = postContent;
		this.postImg = postImg;
		this.postFile = postFile;
		this.upvotes = upvotes;
		this.downvotes = downvotes;
		this.views = views;
		this.creatAt = creatAt;
		this.lastEditAt = lastEditAt;
		this.user = user;
		this.questions = questions;
		this.topics = topics;
	}

	@Override
	public String toString() {
		return "Post [postId=" + postId + ", postTitle=" + postTitle + ", postContent=" + postContent + ", postImg="
				+ postImg + ", postFile=" + postFile + ", upvotes=" + upvotes + ", downvotes=" + downvotes + ", views="
				+ views + ", creatAt=" + creatAt + ", lastEditAt=" + lastEditAt + ", topics=" + topics + "]";
	}

	
}
