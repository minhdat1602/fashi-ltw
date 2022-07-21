package com.ecommerce.model;

import java.sql.Date;
import java.sql.Timestamp;

// Chưa có trong database
public class Review extends  AbstractModel{
    private Integer id;
    private Integer commentator;
    private Integer productId;
    private int vote;
    private String comment;
    private Date dateReview;
    private String reply;
    private double averageStar;
    private int totalComment;
    private Product product;
    private User user;
    
	public double getAverageStar() {
		return averageStar;
	}
	public void setAverageStar(double averageStar) {
		this.averageStar = averageStar;
	}
	public int getTotalComment() {
		return totalComment;
	}
	public void setTotalComment(int totalComment) {
		this.totalComment = totalComment;
	}
	public Review() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCommentator() {
		return commentator;
	}
	public void setCommentator(Integer commentator) {
		this.commentator = commentator;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Date getDateReview() {
		return dateReview;
	}
	public void setDateReview(Date dateReview) {
		this.dateReview = dateReview;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

    
}
