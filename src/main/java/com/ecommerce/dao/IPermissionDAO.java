package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Permission;

public interface IPermissionDAO extends IGenericDAO<Permission>{

	List<Permission> findAllByGroupCode(String sorting);

	List<Permission> findAllByUserId(Integer id);

}
