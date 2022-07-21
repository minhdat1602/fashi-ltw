package com.ecommerce.service.impl;

import com.ecommerce.dao.ICartDAO;
import com.ecommerce.dao.ICartDetailDAO;
import com.ecommerce.dao.IProductDAO;
import com.ecommerce.dao.IStockDAO;
import com.ecommerce.model.Cart;
import com.ecommerce.model.CartDetails;
import com.ecommerce.model.Stock;
import com.ecommerce.service.ICartService;
import com.ecommerce.service.IStockService;

import javax.inject.Inject;
import java.util.List;

public class CartService implements ICartService {
    @Inject
    private ICartDAO cartDAO;
    @Inject
    private ICartDetailDAO cartDetailDAO;
    @Inject
    private IStockService stockService;
    @Inject
    private IProductDAO productDAO;

    @Override
    public Cart findByCustomerId(Integer customerId) {
        Cart cart = cartDAO.findByCustomerId(customerId);

        List<CartDetails> listDetail = cartDetailDAO.findByCardId(cart.getId());

        for(CartDetails d : listDetail){
            Stock stock = stockService.findOne(d.getStockId());
            //stock.setProduct(productDAO.findOne(stock.getProductId()));
            d.setStock(stock);
        }
        cart.setCartDetailsList(listDetail);

        return cart;
    }

    @Override
    public boolean deleteDetailItemById(Integer detailCartId) {
        return cartDetailDAO.delete(detailCartId);
    }

    @Override
    public boolean updateItem(CartDetails cartDetails) {
        return cartDetailDAO.update(cartDetails);
    }

    @Override
    public CartDetails insertItem(CartDetails cartDetails) {
        Integer id  = cartDetailDAO.insert(cartDetails);
        return cartDetailDAO.findById(id);
    }
    @Override
    public Cart insert(Cart cart) {
        Integer id = cartDAO.insert(cart);
        return cartDAO.findById(id);
    }

}
