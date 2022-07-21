package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.IUserDAO;
import com.ecommerce.model.User;
import com.ecommerce.service.IUserService;

public class UserService implements IUserService{
	@Inject
	private IUserDAO userDAO;
	
	@Override
	public boolean exist(String username) {
		return userDAO.exist(username);
	}

	@Override
	public User insert(User user) {
		Integer id = userDAO.insert(user);
		return findOneById(id);
	}
	@Override
	public User findOneById(Integer id) {
		return userDAO.findOneById(id);
	}

	@Override
	public User getUser(String username) {
		return userDAO.getUser(username);
	}

	@Override
	public boolean update(User user){
		return userDAO.update(user);
	}

	@Override
	public User findOneByEmail(String email) {
		return userDAO.findOneByEmail(email);
	}

	@Override
	public List<User> findAll(User pageable) {
		return userDAO.findAll(pageable);
	}

	@Override
	public Integer getTotalUser() {
		return userDAO.getTotalUser();
	}

}
