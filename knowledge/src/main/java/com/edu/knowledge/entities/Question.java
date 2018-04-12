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

import com.edu.knowledge.utils.TimeUtil;

@Entity
@Table(name="tbl_cau_hoi")
public class Question implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_cau_hoi")
	private int questionId;
	
	@Column(name="tieu_de")
	private String title;
	
	@Column(name="noi_dung")
	private String questionContent;
	
	@Column(name="luot_view")
	private Integer views;
	
	@Column(name="upvotes")
	private Integer upvotes;
	
	@Column(name="downvotes")
	private Integer downvotes;
	
	@Column(name="link")
	private String linkPost;
	
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
	@JoinColumn(name="id_bai_viet")
	private Post post;
	
	@OneToMany(mappedBy = "question", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Answer> answers;
	
	@NotEmpty
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tbl_ct_chu_de_cau_hoi", 
             joinColumns = { @JoinColumn(name = "id_cau_hoi") }, 
             inverseJoinColumns = { @JoinColumn(name = "id_chu_de") })
	private Set<Topic> topics;
	
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tbl_chi_tiet_vote", 
             joinColumns = { @JoinColumn(name = "id_cau_hoi") }, 
             inverseJoinColumns = { @JoinColumn(name = "id_vote_type") })
	private Set<VoteType> voteTypes;
	
	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public Set<VoteType> getVoteTypes() {
		return voteTypes;
	}

	public void setVoteTypes(Set<VoteType> voteTypes) {
		this.voteTypes = voteTypes;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Set<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}

	public Set<Topic> getTopics() {
		return topics;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
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

	public String getLinkPost() {
		return linkPost;
	}

	public void setLinkPost(String linkPost) {
		this.linkPost = linkPost;
	}

	public Date getCreatAt() {
		return creatAt;
	}

	public void setCreatAt(Date creatAt) {
		this.creatAt = creatAt;
	}

	public String getAgo() throws ParseException {
        return TimeUtil.ago(creatAt);
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
	
	public Question() {
	}

	public Question(String title, String questionContent, Integer views, Integer upvotes, Integer downvotes,
			String linkPost, Date creatAt, Date lastEditAt, User user) {
		super();
		this.title = title;
		this.questionContent = questionContent;
		this.views = views;
		this.upvotes = upvotes;
		this.downvotes = downvotes;
		this.linkPost = linkPost;
		this.creatAt = creatAt;
		this.lastEditAt = lastEditAt;
		this.user = user;
	}

	public Question(String title, String questionContent, Integer views, Integer upvotes, Integer downvotes,
			String linkPost, Date creatAt, Date lastEditAt, User user, Post post, Set<Answer> answers,
			@NotEmpty Set<Topic> topics) {
		super();
		this.title = title;
		this.questionContent = questionContent;
		this.views = views;
		this.upvotes = upvotes;
		this.downvotes = downvotes;
		this.linkPost = linkPost;
		this.creatAt = creatAt;
		this.lastEditAt = lastEditAt;
		this.user = user;
		this.post = post;
		this.answers = answers;
		this.topics = topics;
	}
	
}
