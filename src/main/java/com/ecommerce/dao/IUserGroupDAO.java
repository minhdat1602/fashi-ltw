package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.UserGroup;

public interface IUserGroupDAO extends IGenericDAO<UserGroup>{

	List<UserGroup> findAll();

	UserGroup getNameByUserId(Integer id);

}
