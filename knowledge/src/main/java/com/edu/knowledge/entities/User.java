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
import javax.validation.constraints.NotEmpty;

import org.springframework.data.annotation.Transient;
import org.springframework.web.multipart.MultipartFile;

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
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Transient
	@NotEmpty
	private String confirmpassword;
	
	@Column(name="ten_hien_thi")
	private String fullname;
	
	@Column(name = "email")
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
	
	@Column(name="points")
	private int points = 0;
	
	@Column(name = "image")
	private String image;
	
	/*@Transient
	private MultipartFile avata_file;*/
	
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
	
    /*@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tbl_chi_tiet_vote", 
             joinColumns = { @JoinColumn(name = "id_thanh_vien") }, 
             inverseJoinColumns = { @JoinColumn(name = "id_vote_type") })
	private Set<VoteType> voteTypes;*/
	
    /*@Transient
	public MultipartFile getAvata_file() {
		return avata_file;
	}

	public void setAvata_file(MultipartFile avata_file) {
		this.avata_file = avata_file;
	}*/

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}

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

	/*public Set<VoteType> getVoteTypes() {
		return voteTypes;
	}

	public void setVoteTypes(Set<VoteType> voteTypes) {
		this.voteTypes = voteTypes;
	}*/

	public boolean isAdmin() {
		if (role.getRoleName().equals("ROLE_ADMIN")) {
			return true;
		}
		return false;
	}

	public boolean isExpect() {
		if (role.getRoleName().equals("ROLE_EXPECT")) {
			return true;
		}
		return false;
	}
	public User() {
		role = new Role("ROLE_MEMBER");
		createDate = new Date();
	}

	public User(String username, String password, @NotEmpty String confirmpassword, String fullname, String email,
			Date createDate, Date lastVisit, Integer phoneNum, String address, String abouts, String image, Role role,
			Set<Sector> sectors, Set<Notification> notifications, Set<Bookmark> bookmarks, Set<Question> questions,
			Set<Answer> answers, Set<Comment> comments, Set<Post> posts) {
		super();
		this.username = username;
		this.password = password;
		this.confirmpassword = confirmpassword;
		this.fullname = fullname;
		this.email = email;
		this.createDate = createDate;
		this.lastVisit = lastVisit;
		this.phoneNum = phoneNum;
		this.address = address;
		this.abouts = abouts;
		this.image = image;
		this.role = role;
		this.sectors = sectors;
		this.notifications = notifications;
		this.bookmarks = bookmarks;
		this.questions = questions;
		this.answers = answers;
		this.comments = comments;
		this.posts = posts;
	}
	
}
