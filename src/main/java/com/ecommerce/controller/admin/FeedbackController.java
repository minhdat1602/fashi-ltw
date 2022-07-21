package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Feedback;
import com.ecommerce.service.IFeedbackService;

@WebServlet(urlPatterns = "/admin/danh-sach-gop-y")
public class FeedbackController extends HttpServlet{
	@Inject
	private IFeedbackService feedbackService;
	
	private List<Feedback> listFeedback;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		listFeedback = feedbackService.findAll();
		req.setAttribute("listFeedback", listFeedback);
		req.getRequestDispatcher("/view/admin/statistical/list-feedback.jsp").forward(req, resp);
	}
}
