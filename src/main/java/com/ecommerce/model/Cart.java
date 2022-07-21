package com.ecommerce.model;

import java.util.List;

public class Cart extends AbstractModel {
    private List<CartDetails> cartDetailsList;
    private Integer userId;

    public Cart() {
    }

    public Integer getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	public List<CartDetails> getCartDetailsList() {
        return cartDetailsList;
    }

    public void setCartDetailsList(List<CartDetails> cartDetailsList) {
        this.cartDetailsList = cartDetailsList;
    }

    public Integer totalPrice() {
        Integer total = 0;
        for (CartDetails cd : cartDetailsList) {
            total += cd.getQuantity() * cd.getStock().getProduct().getSellPrice();
        }
        return total;
    }
    public Integer totalOriginPrice() {
        Integer total = 0;
        for (CartDetails cd : cartDetailsList) {
            total += cd.getQuantity() * cd.getStock().getProduct().getOriginPrice();
        }
        return total;
    }
    public Integer totalDiscount(){
        int result = totalOriginPrice() - totalPrice();
        return result;
    }
    public CartDetails getItem(Integer itemId){
        for (CartDetails cd : cartDetailsList) {
            if(cd.getId() == itemId)
                return cd;
        }
        return null;
    }


    public boolean removeItem(Integer itemId) {
        for (CartDetails cd : cartDetailsList) {
        	if(cd.getId() == itemId) {
                cartDetailsList.remove(cd);
                return true;
            }
        }
        return false;
    }
}
