package com.ecommerce.mapper;

import com.ecommerce.model.CartDetails;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDetailMapper implements RowMapper<CartDetails> {

    @Override
    public CartDetails mapRow(ResultSet resultSet) {
        CartDetails cartDetails = new CartDetails();
        try {
            cartDetails.setId(resultSet.getInt("id"));
            cartDetails.setCartId(resultSet.getInt("cart_id"));
            cartDetails.setStockId(resultSet.getInt("stock_id"));
            cartDetails.setQuantity(resultSet.getInt("quantity"));

            //admin
            return cartDetails;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}
