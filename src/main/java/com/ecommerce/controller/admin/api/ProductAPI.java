package com.ecommerce.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.ecommerce.service.IProductService;
import com.ecommerce.utils.HTTPUtil;
import com.ecommerce.utils.ImageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet (urlPatterns = "/api/san-pham")
public class ProductAPI extends HttpServlet{
	@Inject
	private IProductService productService;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Product product = HTTPUtil.of(req.getReader()).toModel(Product.class);
		product.setStatus(1);
		product.setNewProduct(1);
		product.setHotProduct(0);
		product.setCollectionId(1);
		product.setImageUrl(ImageUtil.createLink(product.getImageUrl()));
		int id = productService.save(product);
		product.setId(id);
		productService.updateImageDetails(product);
		mapper.writeValue(resp.getOutputStream(), id);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Product product = HTTPUtil.of(req.getReader()).toModel(Product.class);
		product.setImageUrl(ImageUtil.createLink(product.getImageUrl()));
		productService.updateImageDetails(product);
		boolean success  = productService.update(product);	
		mapper.writeValue(resp.getOutputStream(), success);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Product deleteProduct = HTTPUtil.of(req.getReader()).toModel(Product.class);
		productService.delete(deleteProduct.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
