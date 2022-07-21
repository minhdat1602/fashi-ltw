package com.ecommerce.controller.admin.api;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.ecommerce.model.ProductGroup;
import com.ecommerce.model.Promotion;
import com.ecommerce.service.IProductGroupService;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IPromotionService;
import com.ecommerce.utils.HTTPUtil;
import com.ecommerce.utils.ImageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = "/api/khuyen-mai")
public class PromotionAPI extends HttpServlet{
	@Inject
	private IPromotionService promotionService;
	@Inject
	private IProductService productService;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Promotion promotion = HTTPUtil.of(req.getReader()).toModel(Promotion.class);
		promotion.setImageUrl(ImageUtil.createLink(promotion.getImageUrl()));
		Integer id = promotionService.save(promotion);
		mapper.writeValue(resp.getOutputStream(), id);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Promotion promotion = HTTPUtil.of(req.getReader()).toModel(Promotion.class);
		promotion.setImageUrl(ImageUtil.createLink(promotion.getImageUrl()));
		boolean success  = promotionService.update(promotion);
		if (success) {
			List<Product> list = productService.findAllByPromotionId(promotion.getId());
			int[] ids = new int[list.size()];
			for (int i = 0; i < list.size(); i++) {
				ids[i] = list.get(i).getId();
			}
			productService.updateSellPrice(ids, promotion.getValue());
		}
		mapper.writeValue(resp.getOutputStream(), success);
	}
}
