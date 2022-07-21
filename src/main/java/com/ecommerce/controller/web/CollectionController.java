package com.ecommerce.controller.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Collection;
import com.ecommerce.model.Product;
import com.ecommerce.service.ICollectionService;
import com.ecommerce.service.IProductService;

@WebServlet(urlPatterns = "/collection")
public class CollectionController extends HttpServlet{
	@Inject
	private ICollectionService collectionService;
	@Inject
	private IProductService productService;
	
	private List<Collection> listCollection;
	private Collection collection;
	private List<Product> listProduct;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String idStr = req.getParameter("id");
		if (idStr == null) {
			listCollection = collectionService.findAll();
			req.setAttribute("listCollection", listCollection);
			req.getRequestDispatcher("/view/web/collection.jsp").forward(req, resp);
		} else {
			Integer id = Integer.parseInt(idStr);
			listProduct = productService.findAllByCollectionId(id);
			collection = collectionService.findOneById(id);
			req.setAttribute("listProduct", listProduct);
			req.setAttribute("collection", collection);
			req.getRequestDispatcher("/view/web/collection-details.jsp").forward(req, resp);
		}
		
		
	}
}
