package com.ecommerce.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ecommerce.dao.ICollectionDAO;
import com.ecommerce.model.Collection;
import com.ecommerce.service.ICollectionService;

public class CollectionService implements ICollectionService{
	@Inject
	private ICollectionDAO collectionDAO;
		
	@Override
	public List<Collection> findAll() {
		return collectionDAO.findAll();
	}

	@Override
	public Collection findOneById(Integer id) {
		return collectionDAO.findOneById(id);
	}
	
}
