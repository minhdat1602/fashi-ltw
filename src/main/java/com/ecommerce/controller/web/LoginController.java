package com.ecommerce.controller.web;

import com.ecommerce.model.Cart;
import com.ecommerce.model.User;
import com.ecommerce.service.ICartService;
import com.ecommerce.service.IPermissionService;
import com.ecommerce.service.IUserGroupService;
import com.ecommerce.service.IUserService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/dang-nhap"})
public class LoginController extends HttpServlet {
    @Inject
    private IUserService userService;
    @Inject
    private ICartService cartService;
    @Inject
    private IPermissionService permissionService;
    @Inject
    private IUserGroupService groupService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            req.getRequestDispatcher("/view/web/login.jsp").forward(req, resp);
        } else if (action.equals("logout")) {
            req.getSession().removeAttribute("USERMODEL");
            req.getSession().removeAttribute("CART");
            resp.sendRedirect(req.getRequestURI());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        password = PasswordEncryption.MD5(password);

        String gRecaptchaResponse = req.getParameter("g-recaptcha-response");
        System.out.println(gRecaptchaResponse);

        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
        System.out.println(gRecaptchaResponse);
        System.out.println(verify);

        if (verify) {
            User user = userService.getUser(username.trim());
            if (user != null) {
                if (user.getPassword().equals(password)) {
                    user.setListPermission(permissionService.findAllByUserId(user.getId()));
                    user.setGroup((groupService.getNameByUserId(user.getId())).getName());
                    HttpSession ss = req.getSession();
                    ss.setAttribute("USERMODEL", user);
                    try {
                        Cart cart = cartService.findByCustomerId(user.getId());
                        if (cart != null)
                            ss.setAttribute("CART", cart);
                    } catch (Exception e) {
                        e.printStackTrace();
                        System.err.println("ERROR IN SAVE SHOPPING-CART INTO SESSION");
                    }
                    if (user.isAdmin()) {
                        resp.sendRedirect(req.getContextPath() + "/admin/danh-sach-san-pham?type=list&page=1&maxPageItem=10&sorting=id&sortBy=asc");
                    } else {
                        resp.sendRedirect(req.getContextPath() + "/trang-chu");
                    }
                } else {
                    req.setAttribute("username", username);
                    req.setAttribute("pwd-err", "Mật khẩu không chính xác");
                    req.getRequestDispatcher("/view/web/login.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("uname-err", "Tài khoản không tồn tại");
                req.getRequestDispatcher("/view/web/login.jsp").forward(req, resp);
            }
        } else {
         /*   RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/web/login.jsp");
            PrintWriter out = resp.getWriter();
            rd.include(req, resp);*/
            if (username != null && !username.trim().equals(""))
                req.setAttribute("username", username);
            req.setAttribute("err-captcha", "Vui lòng xác nhận captcha");
            System.out.println(req.getAttribute("err-captcha"));
            req.getRequestDispatcher("/view/web/login.jsp").forward(req, resp);
        }
    }
}
