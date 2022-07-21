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
import com.ecommerce.model.Review;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IReviewService;

@WebServlet(urlPatterns = "/admin/danh-sach-danh-gia")
public class ReviewController extends HttpServlet{
	
	@Inject
	private IReviewService reviewService;
	@Inject
	private IProductService productService;
	
	private List<Review> listReview;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		if (type.equalsIgnoreCase("list")) {
			listReview = reviewService.findAll();
			req.setAttribute("listReview", listReview);
			req.getRequestDispatcher("/view/admin/product/review/list-review-product.jsp").forward(req, resp);
		} else if (type.equalsIgnoreCase("view")) {
			Integer id = Integer.parseInt(req.getParameter("id"));
			List<Review> listReviewDetails = reviewService.findAllByProductId(id);
			Product product = productService.findOne(id);
			product.setAvgStar(reviewService.avgStarByProductId(id));
			req.setAttribute("listReviewDetails", listReviewDetails);
			req.setAttribute("product", product);
			req.getRequestDispatcher("/view/admin/product/review/review-details.jsp").forward(req, resp);
		}
	}
}
