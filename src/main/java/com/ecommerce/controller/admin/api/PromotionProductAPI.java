package com.ecommerce.controller.admin.api;

import java.io.IOException;

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
import com.ecommerce.utils.HTTPUtil;
import com.ecommerce.utils.ImageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = "/api/san-pham-khuyen-mai")
public class PromotionProductAPI extends HttpServlet{
	@Inject
	private IProductService productService;
	@Inject
	private IPromotionService promotionService;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Product addProduct = HTTPUtil.of(req.getReader()).toModel(Product.class);
		promotionService.save(addProduct.getIds(), addProduct.getId());
		Promotion promotion = promotionService.findOneById(addProduct.getId());
		productService.updateSellPrice(addProduct.getIds(), promotion.getValue());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Product deleteProduct = HTTPUtil.of(req.getReader()).toModel(Product.class);
		promotionService.delete(deleteProduct.getIds(),deleteProduct.getId());
		productService.updateSellPrice(deleteProduct.getIds(), 100);
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
