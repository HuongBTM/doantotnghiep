package com.edu.knowledge.entities;

import java.io.Serializable;
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
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Transient;

@Entity
/*@EntityListeners(AuditingEntityListener.class)*/
@Table(name = "tbl_thanh_vien")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_thanh_vien")
	private int userId;
	
	@Column(name="username")
	@NotEmpty(message = "*Hãy điền tên đăng nhập")
	@Length(min = 8, max= 25, message = "Tên đăng nhập từ 8-25 ký tự")
	private String username;
	
	@Column(name="password")
	@NotEmpty(message = "*Hãy điền tên đăng nhập")
	@Length(min = 8, max= 25, message = "Nhập mật khẩu từ 8-25 ký tự")
	private String password;
	
	@Transient
	@NotEmpty
	private String confirmpassword;
	
	@Column(name="ten_hien_thi")
	@NotEmpty(message = "*Hãy điền tên hiển thị")
	@Length(min = 8, max= 25, message = "Tên hiển thị từ 8-25 ký tự")
	private String fullname;
	
	@Column(name = "email")
	@Email(message = "*Hãy điền email hợp lệ")
	@NotEmpty(message = "*Hãy nhập địa chỉ email")
	private String email;
	
	@Column(nullable = false, updatable = false, name="ngay_dang_ky")
    @Temporal(TemporalType.TIMESTAMP)
	private Date createDate;
	
	@Column(name="truy_cap_cuoi")
    @Temporal(TemporalType.TIMESTAMP)
	private Date lastVisit;
	@Column(name = "so_dien_thoai")
	private Integer phoneNum;
	@Column(name = "dia_chi")
	private String address;
	@Column(name = "abouts")
	private String abouts;
	@Column(name = "downvotes")
	private Integer downvotesNum;
	@Column(name = "upvotes")
	private Integer upvotesNum;
	@Column(name = "luot_view")
	private Integer viewsNum;
	@Column(name = "image")
	private String image;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_role")
	private Role role;
	
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tbl_chuyen_gia", 
             joinColumns = { @JoinColumn(name = "id_thanh_vien") }, 
             inverseJoinColumns = { @JoinColumn(name = "id_linh_vuc") })
	private Set<Sector> sectors;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Notification> notifications;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Bookmark> bookmarks;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Question> questions;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Answer> answers;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Comment> comments;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Post> posts;
	
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tbl_chi_tiet_vote", 
             joinColumns = { @JoinColumn(name = "id_thanh_vien") }, 
             inverseJoinColumns = { @JoinColumn(name = "id_vote_type") })
	private Set<VoteType> voteTypes;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Topic> topics;
	
	

	public Integer getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(Integer phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLastVisit() {
		return lastVisit;
	}

	public void setLastVisit(Date lastVisit) {
		this.lastVisit = lastVisit;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAbouts() {
		return abouts;
	}

	public void setAbouts(String abouts) {
		this.abouts = abouts;
	}

	public Integer getDownvotesNum() {
		return downvotesNum;
	}

	public void setDownvotesNum(Integer downvotesNum) {
		this.downvotesNum = downvotesNum;
	}

	public Integer getUpvotesNum() {
		return upvotesNum;
	}

	public void setUpvotesNum(Integer upvotesNum) {
		this.upvotesNum = upvotesNum;
	}

	public Integer getViewsNum() {
		return viewsNum;
	}

	public void setViewsNum(Integer viewsNum) {
		this.viewsNum = viewsNum;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Set<Sector> getSectors() {
		return sectors;
	}

	public void setSectors(Set<Sector> sectors) {
		this.sectors = sectors;
	}

	public Set<Notification> getNotifications() {
		return notifications;
	}

	public void setNotifications(Set<Notification> notifications) {
		this.notifications = notifications;
	}

	public Set<Bookmark> getBookmarks() {
		return bookmarks;
	}

	public void setBookmarks(Set<Bookmark> bookmarks) {
		this.bookmarks = bookmarks;
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

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Set<Post> getPosts() {
		return posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Set<VoteType> getVoteTypes() {
		return voteTypes;
	}

	public void setVoteTypes(Set<VoteType> voteTypes) {
		this.voteTypes = voteTypes;
	}

	public Set<Topic> getTopics() {
		return topics;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}
	public boolean isAdmin() {
		if (role.getRoleName().equals("ROLE_ADMIN")) {
			return true;
		}
		return false;
	}

	public User() {
		createDate = new Date();
	}
	
	public User(
			@NotEmpty(message = "*Hãy điền tên đăng nhập") @Length(min = 8, max = 25, message = "Tên đăng nhập từ 8-25 ký tự") String username,
			@NotEmpty(message = "*Hãy điền tên đăng nhập") @Length(min = 8, max = 25, message = "Nhập mật khẩu từ 8-25 ký tự") String password,
			@NotEmpty(message = "*Hãy điền tên hiển thị") @Length(min = 8, max = 25, message = "Tên hiển thị từ 8-25 ký tự") String fullname,
			@Email(message = "*Hãy điền email hợp lệ") @NotEmpty(message = "*Hãy nhập địa chỉ email") String email,
			Date createDate, Date lastVisit, String address, String abouts,Integer phoneNum, Integer downvotesNum, Integer upvotesNum,
			Integer viewsNum, String image) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.createDate = createDate;
		this.lastVisit = lastVisit;
		this.address = address;
		this.abouts = abouts;
		this.phoneNum = phoneNum;
		this.downvotesNum = downvotesNum;
		this.upvotesNum = upvotesNum;
		this.viewsNum = viewsNum;
		this.image = image;
		
	}
	
	public User(
			@NotEmpty(message = "*Hãy điền tên đăng nhập") @Length(min = 8, max = 25, message = "Tên đăng nhập từ 8-25 ký tự") String username,
			@NotEmpty(message = "*Hãy điền tên đăng nhập") @Length(min = 8, max = 25, message = "Nhập mật khẩu từ 8-25 ký tự") String password,
			@NotEmpty String confirmpassword,
			@NotEmpty(message = "*Hãy điền tên hiển thị") @Length(min = 8, max = 25, message = "Tên hiển thị từ 8-25 ký tự") String fullname,
			@Email(message = "*Hãy điền email hợp lệ") @NotEmpty(message = "*Hãy nhập địa chỉ email") String email,
			Date createDate, Date lastVisit, String address, String abouts, Integer downvotesNum, Integer upvotesNum,
			Integer viewsNum, String image, Role role) {
		super();
		this.username = username;
		this.password = password;
		this.confirmpassword = confirmpassword;
		this.fullname = fullname;
		this.email = email;
		this.createDate = createDate;
		this.lastVisit = lastVisit;
		this.address = address;
		this.abouts = abouts;
		this.downvotesNum = downvotesNum;
		this.upvotesNum = upvotesNum;
		this.viewsNum = viewsNum;
		this.image = image;
		this.role = role;
	}

	public User(
			@NotEmpty(message = "*Hãy điền tên đăng nhập") @Length(min = 8, max = 25, message = "Tên đăng nhập từ 8-25 ký tự") String username,
			@NotEmpty(message = "*Hãy điền tên đăng nhập") @Length(min = 8, max = 25, message = "Nhập mật khẩu từ 8-25 ký tự") String password,
			@NotEmpty String confirmpassword,
			@NotEmpty(message = "*Hãy điền tên hiển thị") @Length(min = 8, max = 25, message = "Tên hiển thị từ 8-25 ký tự") String fullname,
			@Email(message = "*Hãy điền email hợp lệ") @NotEmpty(message = "*Hãy nhập địa chỉ email") String email,
			Date createDate, Date lastVisit, String address, String abouts, Integer downvotesNum, Integer upvotesNum,
			Integer viewsNum, String image, Role role,
			@NotEmpty Set<Sector> sectors) {
		super();
		this.username = username;
		this.password = password;
		this.confirmpassword = confirmpassword;
		this.fullname = fullname;
		this.email = email;
		this.createDate = createDate;
		this.lastVisit = lastVisit;
		this.address = address;
		this.abouts = abouts;
		this.downvotesNum = downvotesNum;
		this.upvotesNum = upvotesNum;
		this.viewsNum = viewsNum;
		this.image = image;
		this.role = role;
		this.sectors = sectors;
	}
	
}
