package com.ecommerce.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.ProductGroup;
import com.ecommerce.model.User;
import com.ecommerce.service.IUserService;
import com.ecommerce.utils.HTTPUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = "/api/doi-quyen")
public class ChangePermissionAPI extends HttpServlet{
	@Inject
	private IUserService userService;
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		User user = HTTPUtil.of(req.getReader()).toModel(User.class);
		User newUser = userService.findOneById(user.getId());
		newUser.setGroupId(user.getGroupId());
		boolean success  = userService.update(newUser);
		mapper.writeValue(resp.getOutputStream(), success);
	}
}
