package com.edu.knowledge.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name= "tbl_bookmark")
public class Bookmark implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="")
	private int bookmarkId;
	
	@Column(name="thoi_gian_bookmark")
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeToBook;
	
	@Column(name="link_book")
	private String linkBook;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_thanh_vien")
	private User user;

	public Date getTimeToBook() {
		return timeToBook;
	}

	public void setTimeToBook(Date timeToBook) {
		this.timeToBook = timeToBook;
	}

	public String getLinkBook() {
		return linkBook;
	}

	public void setLinkBook(String linkBook) {
		this.linkBook = linkBook;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getBookmarkId() {
		return bookmarkId;
	}

	public void setBookmarkId(int bookmarkId) {
		this.bookmarkId = bookmarkId;
	}

	public Bookmark() {
	}

	public Bookmark(Date timeToBook, String linkBook, User user) {
		super();
		this.timeToBook = timeToBook;
		this.linkBook = linkBook;
		this.user = user;
	}
	
}
