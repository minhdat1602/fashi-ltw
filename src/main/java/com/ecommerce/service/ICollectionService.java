package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Collection;

public interface ICollectionService {
	List<Collection> findAll();

	Collection findOneById(Integer id);
}
