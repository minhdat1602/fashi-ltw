package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Permission;
import com.ecommerce.model.User;
import com.ecommerce.model.UserGroup;
import com.ecommerce.service.IPermissionService;
import com.ecommerce.service.IUserGroupService;
import com.ecommerce.service.IUserService;

@WebServlet(urlPatterns = "/admin/thay-doi-quyen")
public class ChangePermissionController extends HttpServlet{
	@Inject
	private IPermissionService permissionService;
	@Inject
	private IUserGroupService groupService;
	@Inject
	private IUserService userService;
	private UserGroup group;
	private User user;
	private List<Permission> listPermission;
	private List<UserGroup> listProductGroup;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));
		group = groupService.getNameByUserId(id);
		user = userService.findOneById(id);
		listPermission = permissionService.findAllByUserId(id);
		listProductGroup = groupService.findAll();
		req.setAttribute("group", group);
		req.setAttribute("user", user);
		req.setAttribute("listPermission", listPermission);
		req.setAttribute("listProductGroup", listProductGroup);
		req.getRequestDispatcher("/view/admin/admin-manager/change-permission.jsp").forward(req, resp);
	}
}
