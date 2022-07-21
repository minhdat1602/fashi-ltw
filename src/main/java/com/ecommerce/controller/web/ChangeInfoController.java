package com.ecommerce.controller.web;

import com.ecommerce.model.User;
import com.ecommerce.service.IUserService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = {"/capnhat"})
public class ChangeInfoController extends HttpServlet {
    @Inject
    IUserService userService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String page = request.getParameter("page");
        User user = (User) request.getSession().getAttribute("USERMODEL");
        if(user == null)
            System.out.println("USER NOT EXIST");
        if (page.equals("info")) {
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            Integer phone = Integer.parseInt(request.getParameter("phone"));
            String gender = request.getParameter("gender");
            String dateStr = request.getParameter("birthday");
            Date date = null;
            try {
                date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            java.sql.Date birthday = new java.sql.Date(date.getTime());

            String address = request.getParameter("address");
            String pwd = request.getParameter("password");

            if (pwd.equals(user.getPassword())) {
                user.setFirstName(fname);
                user.setLastName(lname);
                user.setEmail(email);
                user.setPhone(phone);
                user.setGender(gender);
                user.setBirthday(birthday);
                user.setAddress(address);
                boolean updated = userService.update(user);
                System.out.println("Update: " + updated);
                response.sendRedirect(request.getContextPath() + "/trang-chu");
            } else {
<<<<<<< HEAD
<<<<<<< HEAD
                if (!checkEmail || !user.getEmail().equals(email))
=======
                if (!checkEmail && user.getEmail().equals(email))
>>>>>>> parent of b3fa020... permission
                    request.setAttribute("email-err", "Mật Email này đã tồn tại");
                if (!pwd.equals(user.getPassword()))
                    request.setAttribute("pwd-err", "Mật khẩu không chính xác");
=======
                request.setAttribute("pwd-err", "Mật khẩu không chính xác");
>>>>>>> parent of 5a06246... comit
                request.getRequestDispatcher("/view/web/change-information.jsp").forward(request, response);
            }
        } else if (page.equals("pwd")) {
            String oldPwd = request.getParameter("oldPassword");
            String newPwd = request.getParameter("newPassword");
            if (oldPwd.equals(user.getPassword())) {
                user.setPassword(newPwd);
                boolean updated = userService.update(user);
                System.out.println("Update password: " + updated);
                response.sendRedirect(request.getContextPath() + "/trang-chu");
            } else {
                request.setAttribute("pwd-err", "Mật khẩu cũ không chính xác!");
                request.getRequestDispatcher("/view/web/change-password.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        if (page.equals("info"))
            request.getRequestDispatcher("/view/web/change-information.jsp").forward(request, response);
        else if (page.equals("pwd"))
            request.getRequestDispatcher("/view/web/change-password.jsp").forward(request, response);
    }
}
