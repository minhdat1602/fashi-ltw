package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Order;
import com.ecommerce.model.User;
import com.ecommerce.service.IOrderService;
import com.ecommerce.service.IUserService;
import com.ecommerce.utils.FormUtil;

@WebServlet(urlPatterns = "/admin/danh-sach-nguoi-dung")
public class UserController extends HttpServlet {
	@Inject
	private IUserService userService;
	@Inject
	private IOrderService orderService;

	private List<User> listUser;
	private List<Order> listOrder;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		if (type.equalsIgnoreCase("list")) {
			User pageable = FormUtil.toModel(User.class, req);
			pageable.setTotalItem(userService.getTotalUser());
			pageable.setTotalPage((int) Math.ceil((double) (pageable.getTotalItem() * 10 / pageable.getMaxPageItem()) / 10));
			pageable.setOffset((pageable.getPage() - 1) * pageable.getMaxPageItem());
			if (pageable.getSorting().equalsIgnoreCase("customer")) {
				pageable.setGroupId(1);
			}
			listUser = userService.findAll(pageable);
			req.setAttribute("listUser", listUser);
			req.setAttribute("pageable", pageable);
			req.getRequestDispatcher("/view/admin/customer/list-customer-information.jsp").forward(req, resp);

		} else if (type.equalsIgnoreCase("view")) {
			String idStr = req.getParameter("id");
			Integer id = Integer.parseInt(idStr);
			listOrder = orderService.findAllByUserId(id);
			req.setAttribute("listOrder", listOrder);
			req.getRequestDispatcher("/view/admin/customer/customer-information-details.jsp").forward(req, resp);
		}
	}
}
