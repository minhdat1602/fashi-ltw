package com.ecommerce.mapper;

import com.ecommerce.model.Cart;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartMapper implements RowMapper<Cart>{

    @Override
    public Cart mapRow(ResultSet resultSet) {
        Cart cart = new Cart();
        try {
            cart.setId(resultSet.getInt("id"));
            cart.setUserId(resultSet.getInt("customer_id"));

            //admin

            return cart;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }


    }
}