package com.ecommerce.controller.web;


import com.ecommerce.model.Feedback;
import com.ecommerce.model.Stock;
import com.ecommerce.model.User;
import com.ecommerce.service.impl.FeedbackService;
import com.ecommerce.utils.HTTPUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/gop-y")
public class FeedbackController extends HttpServlet {

    @Inject
    private FeedbackService feedbackService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/web/feedback.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        Feedback feedback = HTTPUtil.of(req.getReader()).toModel(Feedback.class);
        feedbackService.insert(feedback);
    }
}
