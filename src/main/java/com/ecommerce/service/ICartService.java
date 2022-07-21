package com.ecommerce.service;

import com.ecommerce.dao.ICartDetailDAO;
import com.ecommerce.model.Cart;
import com.ecommerce.model.CartDetails;

import javax.inject.Inject;

public interface ICartService {
    Cart findByCustomerId(Integer customerId);
    boolean deleteDetailItemById(Integer detailCartId);
    boolean updateItem(CartDetails cartDetails);
    CartDetails insertItem(CartDetails cartDetails);
    Cart insert(Cart cart);

}
