package com.ecommerce.controller.web.api;


import com.ecommerce.model.Order;
import com.ecommerce.model.Stock;
import com.ecommerce.service.IOrderService;
import com.ecommerce.utils.HTTPUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/api/donhang")
public class OrderDetailAPI extends HttpServlet {

    @Inject
    private IOrderService orderService;

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        Order order = HTTPUtil.of(req.getReader()).toModel(Order.class);

        order =  orderService.update(order);
        mapper.writeValue(resp.getOutputStream(), true);
    }
}
