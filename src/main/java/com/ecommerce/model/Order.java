package com.ecommerce.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Order extends AbstractModel{
	private String code;
	private Integer totalSellPrice;
	private Integer totalDiscount;
	private Integer totalMoney;
	private String status;
	private Integer couponId;
	private Integer userId;
	private Date  dateSell;
	private List<OrderDetails> listOrderDetails;
	private User user;
	public Order() {
		super();
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getTotalSellPrice() {
		return totalSellPrice;
	}
	public void setTotalSellPrice(Integer totalSellPrice) {
		this.totalSellPrice = totalSellPrice;
	}
	public Integer getTotalDiscount() {
		return totalDiscount;
	}
	public void setTotalDiscount(Integer totalDiscount) {
		this.totalDiscount = totalDiscount;
	}
	public Integer getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Integer totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Integer getCouponId() {
		return couponId;
	}
	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Date  getDateSell() {
		return dateSell;
	}
	public void setDateSell(Date dateSell) {
		this.dateSell = dateSell;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<OrderDetails> getListOrderDetails() {
		return listOrderDetails;
	}
	public void setListOrderDetails(List<OrderDetails> listOrderDetails) {
		this.listOrderDetails = listOrderDetails;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	
}
