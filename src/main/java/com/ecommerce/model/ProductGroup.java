package com.ecommerce.model;

public class ProductGroup extends AbstractModel{
	private String name;
	private String code;
	private Integer parentId;
	private Integer level;
	private Integer sales;
	private Integer buyTimes;
	private Double percentSales;
	public Integer getSales() {
		return sales;
	}
	public void setSales(Integer sales) {
		this.sales = sales;
	}
	public Integer getBuyTimes() {
		return buyTimes;
	}
	public void setBuyTimes(Integer buyTimes) {
		this.buyTimes = buyTimes;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Double getPercentSales() {
		return percentSales;
	}
	public void setPercentSales(Double percentSales) {
		this.percentSales = percentSales;
	}
	
}
