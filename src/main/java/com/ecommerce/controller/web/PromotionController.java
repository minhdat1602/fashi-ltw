package com.ecommerce.controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.ecommerce.model.Promotion;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IPromotionService;

@WebServlet(urlPatterns = "/sale")
public class PromotionController extends HttpServlet{
	@Inject
	private IPromotionService promotionService;
	@Inject
	private IProductService productService;
	
	private Promotion promotion;
	private List<Promotion> listPromotions;
	private List<Product> listProduct;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idStr = req.getParameter("id");
		if (idStr==null) {
			listPromotions = promotionService.findAll();
			req.setAttribute("listPromotions", listPromotions);
			req.getRequestDispatcher("/view/web/sale.jsp").forward(req, resp);
		} else {
			Integer id = Integer.parseInt(idStr);
			promotion = promotionService.findOneById(id);
			listProduct = productService.findAllByPromotionId(id);
			req.setAttribute("promotion", promotion);
			req.setAttribute("listProduct", listProduct);
			req.getRequestDispatcher("/view/web/sale-details.jsp").forward(req, resp);
		}
	}
}
