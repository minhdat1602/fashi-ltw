package com.ecommerce.service;

import com.ecommerce.model.CartDetails;

public interface ICartDetailService {

    CartDetails findOne(Integer cartId, Integer stockId);
    CartDetails findById(Integer id);
    CartDetails insert(CartDetails cartDetails);
    boolean update(CartDetails cartDetails);
    boolean delete(Integer id);
    void setForeign(CartDetails cartDetails);
    boolean deleteByCartId(Integer id);
}
