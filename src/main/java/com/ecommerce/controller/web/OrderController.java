package com.ecommerce.controller.web;

import com.ecommerce.model.Order;
import com.ecommerce.model.User;
import com.ecommerce.service.IOrderDetailsService;
import com.ecommerce.service.IOrderService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/danh-sach-don-hang")
public class OrderController extends HttpServlet {
    @Inject
    private IOrderService orderService;
    @Inject
    private IOrderDetailsService orderDetailsService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("USERMODEL");
        if(user != null){
            List<Order> listOrder = orderService.findAllByUserId(user.getId());
            for(Order o : listOrder) {
                o.setListOrderDetails(orderDetailsService.findAllOrderDetail(o.getId()));
            }
            req.setAttribute("listOrder", listOrder);
            req.getRequestDispatcher("/view/web/list-order.jsp").forward(req,resp);
        }
    }
}
