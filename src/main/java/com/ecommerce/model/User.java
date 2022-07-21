package com.ecommerce.model;

import java.sql.Date;
import java.util.List;

public class User extends AbstractModel {
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private Integer phone;
	private String gender;
	private Date birthday;
	private String address;
	private Integer status;
	private Integer groupId;
	private Date dateRegister;
	private String group;
	private List<Permission> listPermission;

	// otp for mail
	private Code code;

	public User() {
	}

	public User(String username, String password, String firstName, String lastName, String email, Integer phone,
			String gender, Date birthday, String address, Integer status, Integer groupId) {
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.status = status;
		this.groupId = groupId;
	}

	public Code getCode() {
		return code;
	}

	public void setCode(Code code) {
		this.code = code;
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Date getDateRegister() {
		return dateRegister;
	}

	public void setDateRegister(Date dateRegister) {
		this.dateRegister = dateRegister;
	}

	public List<Permission> getListPermission() {
		return listPermission;
	}

	public void setListPermission(List<Permission> listPermission) {
		this.listPermission = listPermission;
	}

	public boolean containsPremission(String name) {
		for (Permission permission : listPermission) {
			if (permission.getName().equalsIgnoreCase(name)) {
				return true;
			}
		}
		return false;
	}

	public boolean isAdmin() {
<<<<<<< HEAD
		if (listPermission == null)
			return false;
=======
>>>>>>> parent of 5a06246... comit
		for (Permission permission : listPermission) {
			if (permission.getName().contains("admin")) {
				return true;
			}
		}
		return false;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public boolean containsURL(String url) {
		for (Permission permission : listPermission) {
			if (url.contains(permission.getAction())) {
				return true;
			}
		}
		return false;
	}

}
