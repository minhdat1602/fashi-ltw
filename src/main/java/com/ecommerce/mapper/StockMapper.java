package com.ecommerce.mapper;

import com.ecommerce.model.Stock;
import com.ecommerce.model.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StockMapper implements RowMapper<Stock>{
    @Override
    public Stock mapRow(ResultSet resultSet) {
        Stock stock = new Stock();
        try {
            stock.setId(resultSet.getInt("id"));
            stock.setProductId(resultSet.getInt("product_id"));
            stock.setSizeId(resultSet.getInt("size_id"));
            stock.setColorId(resultSet.getInt("color_id"));
            stock.setQuantity(resultSet.getInt("quantity"));
        } catch (SQLException e) {
            return null;
        }
        return stock;
    }
}
