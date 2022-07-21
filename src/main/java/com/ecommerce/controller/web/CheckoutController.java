package com.ecommerce.controller.web;

import com.ecommerce.model.*;
import com.ecommerce.service.*;
import com.ecommerce.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/thanh-toan")
public class CheckoutController extends HttpServlet {

    static Integer ORDERID = 1;
    @Inject
    private IOrderService orderService;
    @Inject
    private IOrderDetailsService orderDetailsService;
    @Inject
    private IUserService userService;
    @Inject
    private ICartDetailService cartDetailService;
    @Inject
    private IStockService stockService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/web/check-out.jsp").forward(req, resp);
    }

  /*  public static void main(String[] args) {
        Integer id = 1;
        System.out.println(String.format("%06d", id));
    }*/

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        //User user = (User) req.getSession().getAttribute("USERMODEL");
        //if(user == null)
        User user = FormUtil.toModel(User.class, req);
        User usermodel = (User) req.getSession().getAttribute("USERMODEL");

        Order order = new Order();
        Cart cart = (Cart) req.getSession().getAttribute("CART");
        order.setCode("DH" + String.format("%06d", ORDERID++));
        order.setTotalSellPrice(cart.totalOriginPrice());
        order.setTotalMoney(cart.totalPrice());
        order.setTotalDiscount(cart.totalDiscount());
        order.setStatus("Chờ xác nhận");
        if (usermodel != null)
            order.setUserId(usermodel.getId());
        else
            order.setUserId(null);

        //set coupon null
        order.setCouponId(null);

        Date selldate = new Date(System.currentTimeMillis());
        order.setDateSell(selldate);
        try {
            order = orderService.insert(order);
        } catch (Exception e) {
            e.printStackTrace();
        }
        order.setListOrderDetails(new ArrayList<>());
        OrderDetails orderDetails;
        for (int i = 0; i < cart.getCartDetailsList().size(); i++) {
            orderDetails = new OrderDetails();
            orderDetails.setOrderId(order.getId());
            orderDetails.setPrice(cart.getCartDetailsList().get(i).getStock().getProduct().getOriginPrice());
            orderDetails.setDiscount(cart.getCartDetailsList().get(i).getStock().getProduct().getOriginPrice()
                    - cart.getCartDetailsList().get(i).getStock().getProduct().getSellPrice());
            orderDetails.setQuantity(cart.getCartDetailsList().get(i).getQuantity());
            orderDetails.setStockId(cart.getCartDetailsList().get(i).getStockId());
            try {
                orderDetails = orderDetailsService.insert(orderDetails);
                Stock stock = cart.getCartDetailsList().get(i).getStock();
                stock.setQuantity(stock.getQuantity() - orderDetails.getQuantity());
                boolean updated = stockService.update(stock);
                orderDetails.setStock(stock);
                order.getListOrderDetails().add(orderDetails);
            }catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        req.setAttribute("order",order);
        req.setAttribute("user", user);
        if(usermodel != null) {
            cartDetailService.deleteByCartId(cart.getId());
        }
        cart.setCartDetailsList(new ArrayList<>());
        req.getSession().setAttribute("CART", cart);
        req.getRequestDispatcher("/view/web/order-details.jsp").forward(req,resp);
    }
}
