package com.ecommerce.controller.web;

import com.ecommerce.model.Code;
import com.ecommerce.model.User;
import com.ecommerce.service.IUserService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(urlPatterns = "/quen-mat-khau")
public class ForgotPasswordController extends HttpServlet {

    @Inject
    private IUserService userService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; character=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "send":
                String email = request.getParameter("email");
                User userSend = userService.findOneByEmail(email);
                if (userSend != null) {
                    SendMail sm = new SendMail();
                    // get random otp && set otp and time begin for user have that mail
                    String codeStr = sm.getRandom();
                    Long st = System.currentTimeMillis();
                    Code code = new Code(codeStr, st);
                    userSend.setCode(code);

                    boolean sended = sm.sendMail(userSend);
                    System.out.println("Send mail: " + sended);

                    if (sended) {
                        HttpSession ss1 = request.getSession();
                        ss1.setAttribute("authcode", userSend);
                    }
                    request.getRequestDispatcher("/view/web/otp.jsp").forward(request, response);
                } else {
                    request.setAttribute("email-err", "Địa chỉ email không tồn tại");
                    request.getRequestDispatcher("/view/web/forget-password.jsp").forward(request, response);
                }
                break;
            case "verify":
                HttpSession ss2 = request.getSession();
                User userVerify = (User) ss2.getAttribute("authcode");
                Long et = System.currentTimeMillis();
                userVerify.getCode().setEndTime(et);

                String code = request.getParameter("otp");

                if (code.equals(userVerify.getCode().getCode())) {
                    if (userVerify.getCode().timeout(1)) //3 phút
                        request.getRequestDispatcher("/view/web/new-password.jsp").forward(request, response);
                    else {
                        request.setAttribute("otp-err", "Mã xác nhận quá hạn");
                        request.getRequestDispatcher("/view/web/otp.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("otp-err", "Mã xác nhận không hợp lệ");
                    request.getRequestDispatcher("/view/web/otp.jsp").forward(request, response);
                }
                break;
            case "newPwd":
                String pwd = request.getParameter("newPassword");
                PasswordEncryption.MD5(pwd);
                HttpSession ss3 = request.getSession();
                User user = (User) ss3.getAttribute("authcode");

                user.setPassword(pwd);
                boolean updatePwd = userService.update(user);
                if (updatePwd)
                    ss3.removeAttribute("authcode");
                response.sendRedirect(request.getContextPath() + "/dang-nhap");
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/web/forget-password.jsp").forward(request, response);
    }
}
