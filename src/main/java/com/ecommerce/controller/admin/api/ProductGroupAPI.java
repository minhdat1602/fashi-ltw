package com.ecommerce.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.ecommerce.model.ProductGroup;
import com.ecommerce.service.IProductGroupService;
import com.ecommerce.utils.HTTPUtil;
import com.ecommerce.utils.ImageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = "/api/nhom-san-pham")
public class ProductGroupAPI extends HttpServlet{
	@Inject
	private IProductGroupService groupService;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ProductGroup group = HTTPUtil.of(req.getReader()).toModel(ProductGroup.class);
		Integer id = groupService.save(group);
		mapper.writeValue(resp.getOutputStream(), id);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ProductGroup group = HTTPUtil.of(req.getReader()).toModel(ProductGroup.class);
		boolean success  = groupService.update(group);
		mapper.writeValue(resp.getOutputStream(), success);
	}
}
