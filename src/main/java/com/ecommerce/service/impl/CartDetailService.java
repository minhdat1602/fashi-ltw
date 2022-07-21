package com.ecommerce.service.impl;

import com.ecommerce.dao.ICartDetailDAO;
import com.ecommerce.dao.IStockDAO;
import com.ecommerce.model.CartDetails;
import com.ecommerce.service.ICartDetailService;
import com.ecommerce.service.IStockService;

import javax.inject.Inject;

public class CartDetailService implements ICartDetailService {

    @Inject
    private ICartDetailDAO cartDetailDAO;
    @Inject
    private IStockDAO stockDAO;

    @Override
    public CartDetails findOne(Integer cartId, Integer stockId) {
        return cartDetailDAO.findOne(cartId, stockId);
    }

    @Override
    public CartDetails findById(Integer id) {
        return cartDetailDAO.findById(id);
    }

    @Override
    public CartDetails insert(CartDetails cartDetails) {
         Integer id = cartDetailDAO.insert(cartDetails);
         CartDetails result = cartDetailDAO.findById(id);
         return result;
    }

    @Override
    public boolean update(CartDetails cartDetails) {
        return cartDetailDAO.update(cartDetails);
    }

    @Override
    public boolean delete(Integer id) {
        return cartDetailDAO.delete(id);
    }

    @Override
    public void setForeign(CartDetails cartDetails) {
        cartDetails.setStock(stockDAO.findOne(cartDetails.getStockId()));
    }

    @Override
    public boolean deleteByCartId(Integer id) {
        return cartDetailDAO.deleteByCartId(id);
    }
}
