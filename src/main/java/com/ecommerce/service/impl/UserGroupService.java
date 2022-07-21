package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IUserGroupDAO;
import com.ecommerce.model.UserGroup;
import com.ecommerce.service.IUserGroupService;

public class UserGroupService implements IUserGroupService{
	@Inject
	private IUserGroupDAO userGroupDAO;

	@Override
	public List<UserGroup> findAll() {
		return userGroupDAO.findAll();
	}

	@Override
	public UserGroup getNameByUserId(Integer id) {
		return userGroupDAO.getNameByUserId(id);
	}

}
