package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.ecommerce.service.IProductService;
import com.ecommerce.utils.FormUtil;

@WebServlet(urlPatterns = "/admin/luot-mua-hang")
public class BuyTimesController extends HttpServlet{
	@Inject
	private IProductService productService;
	
	private List<Product> listProduct;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Product pageable = FormUtil.toModel(Product.class, req);
		pageable.setTotalItem(productService.getTotalProduct());
		pageable.setTotalPage((int) Math.ceil( (double) (pageable.getTotalItem() *10 /pageable.getMaxPageItem()) /10 ));
		pageable.setOffset((pageable.getPage()-1) * pageable.getMaxPageItem());
		listProduct = productService.findAll(pageable);
		productService.getBuyTimes(listProduct);
		req.setAttribute("listProduct", listProduct);
		req.setAttribute("pageable", pageable);
		req.getRequestDispatcher("/view/admin/statistical/buy-times.jsp").forward(req, resp);
	}
}
