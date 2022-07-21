package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IPermissionDAO;
import com.ecommerce.model.Permission;
import com.ecommerce.service.IPermissionService;

public class PermissionService implements IPermissionService{
	@Inject
	private IPermissionDAO permissionDAO;
	
	@Override
	public List<Permission> findAllByGroupCode(String sorting) {
		return permissionDAO.findAllByGroupCode(sorting);
	}

	@Override
	public List<Permission> findAllByUserId(Integer id) {
		return permissionDAO.findAllByUserId(id);
	}

}
