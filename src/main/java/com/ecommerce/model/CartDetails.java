package com.ecommerce.model;

public class CartDetails extends AbstractModel {
    private Integer cartId;
    private Integer stockId;
    private Integer quantity;

    //anh xa
    private Stock stock;
    private Cart cart;

    public CartDetails() {
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getStockId() {
        return stockId;
    }

    public void setStockId(Integer stockId) {
        this.stockId = stockId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public void sub() {
        if (quantity > 1)
            --quantity;
        else
            quantity = 1;
    }

    public void plus() {
        ++quantity;
    }
    @Override
    public String toString() {
        return "CartDetails{" +
                "cartId=" + cartId +
                ", stockId=" + stockId +
                ", quantity=" + quantity +
                ", stock=" + stock +
                ", cart=" + cart +
                '}';
    }
}
