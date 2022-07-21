package com.ecommerce.controller.web.api;

import com.ecommerce.model.Stock;
import com.ecommerce.service.impl.StockService;
import com.ecommerce.utils.HTTPUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/api/stock")
public class StockAPI extends HttpServlet {

    @Inject
    private StockService stockService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();

        Stock stock = HTTPUtil.of(req.getReader()).toModel(Stock.class);
        stock = stockService.findOne(stock.getSizeId(), stock.getColorId(), stock.getProductId());
        resp.getWriter().print(stock.getQuantity());
    }

}
