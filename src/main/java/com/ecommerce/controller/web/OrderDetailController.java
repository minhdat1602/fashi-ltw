package com.ecommerce.controller.web;

import com.ecommerce.model.Order;
import com.ecommerce.model.OrderDetails;
import com.ecommerce.service.IOrderDetailsService;
import com.ecommerce.service.IOrderService;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IStockService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/donhang")
public class OrderDetailController extends HttpServlet {
    @Inject
    private IOrderDetailsService orderDetailsService;
    @Inject
    private IOrderService orderService;
    @Inject
    private IProductService productService;
    @Inject
    private IStockService stockService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer orderId = Integer.parseInt(req.getParameter("id"));
        Order order = orderService.findOne(orderId);
        List<OrderDetails> orderDetailsList = orderDetailsService.findAllOrderDetail(orderId);
        for (OrderDetails dt : orderDetailsList) {
            dt.setStock(stockService.findOne(dt.getStockId()));
            dt.getStock().setProduct(productService.findOne(dt.getStock().getProductId()));
        }
        order.setListOrderDetails(orderDetailsList);

        req.setAttribute("order", order);
        req.setAttribute("user", req.getSession().getAttribute("USERMODEL"));
        /* req.setAttribute("listDetail", orderDetailsList);*/
        req.getRequestDispatcher("/view/web/order-details.jsp").forward(req, resp);
    }
}
