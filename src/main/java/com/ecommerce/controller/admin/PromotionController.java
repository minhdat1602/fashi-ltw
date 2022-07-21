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
import com.ecommerce.model.Promotion;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IPromotionService;
import com.ecommerce.service.IStockService;

@WebServlet(urlPatterns = "/admin/danh-sach-khuyen-mai")
public class PromotionController extends HttpServlet{
	@Inject
	private IPromotionService promotionService;
	@Inject
	private IStockService stockService;
	@Inject
	private IProductService productService;
	
	private List<Promotion> listPromotion;
	private Promotion promotion;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		if (type.equalsIgnoreCase("list")) {
			listPromotion = promotionService.findAll();
			req.setAttribute("listPromotion", listPromotion);
			req.getRequestDispatcher("/view/admin/sale/list-promotions.jsp").forward(req, resp);
		} else if(type.equalsIgnoreCase("edit")) {
			Integer id = Integer.parseInt(req.getParameter("id"));
			List<Product> listProduct = productService.findAllByPromotionId(id);
			stockService.setIventory(listProduct);
			promotion = promotionService.findOneById(id);
			req.setAttribute("promotion", promotion);
			req.setAttribute("listProduct", listProduct);
			req.getRequestDispatcher("/view/admin/sale/add-promotions.jsp").forward(req, resp);
		} else if (type.equalsIgnoreCase("add")) {
			req.getRequestDispatcher("/view/admin/sale/add-promotions.jsp").forward(req, resp);
		}
		
	}
}
