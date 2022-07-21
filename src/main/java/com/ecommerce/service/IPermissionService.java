package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Permission;

public interface IPermissionService {

	List<Permission> findAllByGroupCode(String sorting);

	List<Permission> findAllByUserId(Integer id);
	
}
