package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.ProductSize;
import com.ecommerce.service.IProductSizeService;

@WebServlet(urlPatterns = "/admin/danh-sach-size")
public class ProductSizeController extends HttpServlet{
	@Inject
	private IProductSizeService productSizeService;
	
	private List<ProductSize> listSize;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		listSize = productSizeService.findAll();
		req.setAttribute("listSize", listSize);
		req.getRequestDispatcher("/view/admin/product/size/list-size-product.jsp").forward(req, resp);	
	}
}
