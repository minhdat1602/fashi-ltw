package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Collection;
import com.ecommerce.service.ICollectionService;

@WebServlet(urlPatterns = "/admin/danh-sach-bo-suu-tap")
public class CollectionController extends HttpServlet{
	@Inject
	private ICollectionService collectionService;
	
	private List<Collection> listCollection;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		listCollection = collectionService.findAll();
		req.setAttribute("listCollection", listCollection);
		req.getRequestDispatcher("/view/admin/collection/list-collection.jsp").forward(req, resp);
	}
}
