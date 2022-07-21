package com.ecommerce.model;

public class Feedback extends AbstractModel{
	private String problem;
	private String content;
	private Integer userId;
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Feedback() {
		super();
	}
	
}
