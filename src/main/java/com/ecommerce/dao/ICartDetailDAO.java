package com.ecommerce.dao;

import com.ecommerce.model.CartDetails;

import java.util.List;

public interface ICartDetailDAO extends IGenericDAO<CartDetails> {
    List<CartDetails> findByCardId(Integer cartId);
    Integer insert(CartDetails cartDetails);
    boolean update(CartDetails cartDetails);
    boolean delete(Integer detailCartId);
    CartDetails findById(Integer id);
    CartDetails findOne(Integer cartId, Integer stockId);


    boolean deleteByCartId(Integer id);
}
