
package com.ecommerce.controller.web;

import java.io.IOException;
import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.Cart;
import com.ecommerce.model.RestFB;
import com.ecommerce.service.ICartService;
import com.ecommerce.service.IPermissionService;
import com.ecommerce.service.IUserGroupService;
import com.ecommerce.service.IUserService;
import com.restfb.types.User;

@WebServlet(urlPatterns = "/dang-nhap/facebook")
public class LoginFacebook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IUserService userService;
	@Inject
	private ICartService cartService;
	@Inject
	private IPermissionService permissionService;
	@Inject
	private IUserGroupService groupService;

	public LoginFacebook() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		if (code == null || code.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("/view/web/login.jsp");
			dis.forward(request, response);
		} else {
			String accessToken = RestFB.getToken(code);
			User user = RestFB.getUserInfo(accessToken);
			com.ecommerce.model.User checkUser = userService.getUser(user.getId().trim());
			if (checkUser != null) {
				checkUser.setListPermission(permissionService.findAllByUserId(checkUser.getId()));
				checkUser.setGroup((groupService.getNameByUserId(checkUser.getId())).getName());
				HttpSession ss = request.getSession();
				ss.setAttribute("USERMODEL", checkUser);
				try {
					Cart cart = cartService.findByCustomerId(checkUser.getId());
					if (cart != null)
						ss.setAttribute("CART", cart);
				} catch (Exception e) {
					e.printStackTrace();
					System.err.println("ERROR IN SAVE SHOPPING-CART INTO SESSION");
				}
				if (checkUser.isAdmin()) {
					response.sendRedirect(request.getContextPath()
							+ "/admin/danh-sach-san-pham?type=list&page=1&maxPageItem=10&sorting=id&sortBy=asc");
				} else {
					response.sendRedirect(request.getContextPath() + "/trang-chu");
				}
			} else {
				com.ecommerce.model.User userFashi = new com.ecommerce.model.User();
				userFashi.setFirstName(user.getName());
				userFashi.setLastName("");
				userFashi.setUsername(user.getId());
				userFashi.setPassword("1");	
				userFashi.setStatus(1);
				userFashi.setGroupId(1);
				Date date = new Date(System.currentTimeMillis());
				userFashi.setDateRegister(date);
				try {
					userFashi = userService.insert(userFashi);
					request.getSession().setAttribute("USERMODEL", userFashi);
				} catch (Exception e) {
					response.sendRedirect(request.getContextPath() + "/trang-chu");
				}
				response.sendRedirect(request.getContextPath() + "/capnhat?page=info");
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
