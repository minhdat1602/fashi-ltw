package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.ProductColor;
import com.ecommerce.service.IProductColorService;

@WebServlet(urlPatterns = "/admin/danh-sach-mau")
public class ProductColorController extends HttpServlet{
	@Inject
	private IProductColorService productColorService;
	
	private List<ProductColor> listColor;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		listColor = productColorService.findAll();
		req.setAttribute("listColor", listColor);
		
		req.getRequestDispatcher("/view/admin/product/color/list-color-product.jsp").forward(req, resp);
		
	}
}
