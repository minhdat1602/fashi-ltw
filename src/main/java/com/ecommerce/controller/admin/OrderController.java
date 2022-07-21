package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.dao.IOrderDetailsDAO;
import com.ecommerce.model.Order;
import com.ecommerce.model.Product;
import com.ecommerce.service.IOrderDetailsService;
import com.ecommerce.service.IOrderService;
import com.ecommerce.service.IUserService;
import com.ecommerce.utils.FormUtil;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

@WebServlet(urlPatterns = "/admin/danh-sach-don-hang")
public class OrderController extends HttpServlet{
	
	@Inject
	private IOrderService orderService;
	@Inject
	private IUserService userService;
	@Inject
	private IOrderDetailsService odService;
	
	private List<Order> listOrder;
	private Order order;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idStr = req.getParameter("id");
		Order pageable = FormUtil.toModel(Order.class, req);
		if (idStr==null) {
			pageable.setTotalItem(orderService.getTotalOrder());
			pageable.setTotalPage((int) Math.ceil( (double) (pageable.getTotalItem() *10 /pageable.getMaxPageItem()) /10 ));
			pageable.setOffset((pageable.getPage()-1) * pageable.getMaxPageItem());
			listOrder = orderService.findAll(pageable);
			order = new Order();
			order.setFilter("orders");
			order.setFilterAttr("code");
			req.setAttribute("pageable", pageable);
			req.setAttribute("order", order);
			req.setAttribute("listOrder", listOrder);
			req.getRequestDispatcher("/view/admin/order/list-order.jsp").forward(req, resp);
		} else {
			Integer id = Integer.parseInt(idStr);
			order = orderService.findOne(id);
			order.setUser(userService.findOneById(order.getUserId()));
			order.setListOrderDetails(odService.findAllOrderDetail(order.getId()));
			req.setAttribute("order", order);
			req.getRequestDispatcher("/view/admin/order/order-detail.jsp").forward(req, resp);
		}
	
		
	}
}
