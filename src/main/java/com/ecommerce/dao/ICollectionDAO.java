package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Collection;

public interface ICollectionDAO extends IGenericDAO<Collection>{
	List<Collection> findAll();

	Collection findOneById(Integer id);
}
