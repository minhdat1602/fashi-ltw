package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.ProductGroup;
import com.ecommerce.service.IProductGroupService;

@WebServlet(urlPatterns = "/admin/doanh-so")
public class SalesController extends HttpServlet{
	@Inject
	private IProductGroupService groupService;
	private List<ProductGroup> listProductGroup;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String filter = req.getParameter("filter");
		listProductGroup = groupService.findAll(3);
		groupService.setSales(listProductGroup,filter);
		req.setAttribute("listProductGroup", listProductGroup);
		req.setAttribute("filter", filter);
		req.getRequestDispatcher("/view/admin/statistical/sales.jsp").forward(req, resp);
	}
}
