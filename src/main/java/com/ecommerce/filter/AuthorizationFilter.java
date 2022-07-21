package com.ecommerce.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.Permission;
import com.ecommerce.model.User;

public class AuthorizationFilter implements Filter {

	private ServletContext context;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		StringBuffer url = request.getRequestURL();
		url.append("?");
		url.append(request.getQueryString());
		if (url.toString().contains("/admin")) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("USERMODEL");
			if (user == null) {
				session.setAttribute("message", "Chưa đăng nhập. Vui lòng đăng nhập trước!");
				response.sendRedirect(request.getContextPath() + "/dang-nhap");
				return;
			} else {
				List<Permission> listPermission = user.getListPermission();
				if (user.isAdmin()) {
					if (user.containsURL(url.toString())) {
						chain.doFilter(servletRequest, servletResponse);
						return;
					} else {
						session.setAttribute("message", "Bạn không có quyền thực hiện thao tác này");
						response.sendRedirect(request.getContextPath() + "/dang-nhap");
						return;
					}
				} else {
					session.setAttribute("message", "Bạn không có quyền thực hiện thao tác này");
					response.sendRedirect(request.getContextPath() + "/dang-nhap");
					return;
				}
			}

		} else {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
