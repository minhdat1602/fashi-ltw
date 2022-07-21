package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.UserGroup;

public interface IUserGroupService {

	List<UserGroup> findAll();

	UserGroup getNameByUserId(Integer id);

}
