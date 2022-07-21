package com.ecommerce.service;

import java.util.List;

import com.ecommerce.model.Collection;
import com.ecommerce.model.Product;
import com.ecommerce.model.ProductGroup;

public interface IProductService {
	List<Product> findAll(Integer groupId);
	List<Product> findAll();
	List<Product> findAll(String productGroup, String...attr);
	Product findOne(Integer id);
	List<Product> findAllByPromotionId(Integer id);
	List<Product> findRelatedProduct(Integer groupId);
	List<Product> findAllByCollectionId(Integer id);
	Integer getTotalProduct();
	List<Product> findAll(Product pageable);
	void delete(int[] ids);
	Integer save(Product product);
	boolean update(Product product);
	List<Product> findAllByKey(String filterAttr, String key);
	void updateImageDetails(Product product);
	void getBuyTimes(List<Product> listProduct);
	List<Product> findAllNotInPromotionId(Product pageable, int parseInt);
	void updateSellPrice(int[] ids, Integer value);

	//dat
	/*List<Product> findAll(Product pageable, Integer isHot, Integer isNew,
						  String groupName, String brandName, String collectionName);*/
	public List<Product> findAll(Product pageable, Integer isHot, Integer isNew,
								 String[] groupNameArr, String[] brandNameArr, String[] collectionNameArr
			, Integer level);
	public List<Product> findAll(Product pageable,Integer isHot, Integer isNew ,Integer level, String words) ;
}
