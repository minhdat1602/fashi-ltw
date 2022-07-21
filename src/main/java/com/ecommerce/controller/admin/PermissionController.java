package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Order;
import com.ecommerce.model.Permission;
import com.ecommerce.model.UserGroup;
import com.ecommerce.service.IPermissionService;
import com.ecommerce.service.IUserGroupService;
import com.ecommerce.utils.FormUtil;

@WebServlet(urlPatterns = "/admin/danh-sach-quyen")
public class PermissionController extends HttpServlet{
	@Inject
	private IPermissionService permissionService;
	@Inject
	private IUserGroupService groupServcie;
	
	private List<Permission> listPermission;
	private List<UserGroup> listGroup;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		if (type.equalsIgnoreCase("list")) {
			Permission pageable = FormUtil.toModel(Permission.class, req);
			listGroup = groupServcie.findAll();
			listPermission = permissionService.findAllByGroupCode(pageable.getSorting());
			req.setAttribute("pageable", pageable);
			req.setAttribute("listGroup", listGroup);
			req.setAttribute("listPermission", listPermission);
			req.getRequestDispatcher("/view/admin/customer/list-permission.jsp").forward(req, resp);
		}
	}
}
