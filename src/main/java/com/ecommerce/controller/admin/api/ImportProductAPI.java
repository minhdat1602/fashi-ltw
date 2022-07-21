package com.ecommerce.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;

import com.ecommerce.model.Product;
import com.ecommerce.model.Stock;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IStockService;
import com.ecommerce.utils.HTTPUtil;
import com.ecommerce.utils.ImageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = "/api/nhap-san-pham")
public class ImportProductAPI extends HttpServlet{
	@Inject
	private IStockService stockService;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Stock stock = HTTPUtil.of(req.getReader()).toModel(Stock.class);
		Integer id = stockService.save(stock);
		mapper.writeValue(resp.getOutputStream(), id);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Stock stock = HTTPUtil.of(req.getReader()).toModel(Stock.class);
		boolean success  = stockService.update(stock);
		mapper.writeValue(resp.getOutputStream(), success);
	}
}
