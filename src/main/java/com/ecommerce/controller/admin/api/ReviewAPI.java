package com.ecommerce.controller.admin.api;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Promotion;
import com.ecommerce.model.Review;
import com.ecommerce.service.IReviewService;
import com.ecommerce.service.impl.ReviewService;
import com.ecommerce.utils.HTTPUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = "/api/danh-gia")
public class ReviewAPI extends HttpServlet{
	@Inject
	private IReviewService reviewService;
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Review review = HTTPUtil.of(req.getReader()).toModel(Review.class);
		boolean success = reviewService.update(review);
		mapper.writeValue(resp.getOutputStream(), success);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Review review = HTTPUtil.of(req.getReader()).toModel(Review.class);
		Date date = new Date(System.currentTimeMillis());
		review.setDateReview(date);
		Integer id = reviewService.save(review);
		mapper.writeValue(resp.getOutputStream(), id);
	}
}
