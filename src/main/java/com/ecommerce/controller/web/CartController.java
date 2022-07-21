package com.ecommerce.controller.web;

import com.ecommerce.model.Cart;
import com.ecommerce.model.CartDetails;
import com.ecommerce.model.Stock;
import com.ecommerce.service.ICartService;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IStockService;
import com.ecommerce.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/gio-hang")
public class CartController extends HttpServlet {

    @Inject
    private ICartService cartService;
    @Inject
    private IProductService productService;
    /*@Inject
    private ICartDetailService cartDetailService;*/
    @Inject
    private IStockService stockService;

    //hello
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/web/shopping-cart.jsp").forward(req, resp);
    }

   /* @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action;
        Integer detailCartId = null;
        action = req.getParameter("action");
        System.out.println(action);
        try {


            try {
                detailCartId = Integer.parseInt(req.getParameter("detailCartId"));
            } catch (Exception e) {
                e.printStackTrace();
            }
            Cart cart = (Cart) req.getSession().getAttribute("CART");
            if (action.equals("update")) {
                String method;
                try {
                    method = req.getParameter("method");
                    boolean updated;
                    CartDetails item = cart.getItem(detailCartId);
                    switch (method) {
                        case "sub":
                            item.sub();
                            updated = cartService.updateItem(item);
                            System.out.println("UPDATE: " + updated);
                            break;
                        case "plus":
                            item.plus();
                            updated = cartService.updateItem(item);
                            System.out.println("UPDATE: " + updated);
                            break;
                    }
                } catch (Exception e) {
                    resp.sendRedirect("/view/error.jsp");
                }
            } else if (action.equals("add")) {

                Stock stock = FormUtil.toModel(Stock.class, req);

                boolean constaint = false;

                CartDetails c;
                for (CartDetails cd : cart.getCartDetailsList()) {
                    if (cd.getStockId() == stock.getId()) {
                        cd.plus();
                        boolean updated = cartService.updateItem(cd);
                        System.out.println(updated);
                        constaint = true;
                        break;
                    }
                }
                CartDetails cartDetails = null;
                if (!constaint) {
                    cartDetails = new CartDetails();
                    cartDetails.setCartId(cart.getId());
                    cartDetails.setStockId(stock.getId());
                    cartDetails.setQuantity(1);
                    cartDetails.setStock(stock);
                    System.out.println(cartDetails.toString());
                    CartDetails a;
                    a = cartService.insertItem(cartDetails);

                    List<CartDetails> list = cart.getCartDetailsList();
                    list.add(a);
                    req.getSession().removeAttribute("CART");
                    cart.setCartDetailsList(list);
                    *//*req.getSession().setAttribute("CART", cart);*//*
                }

                req.getSession().setAttribute("CART", cart);
            } else if (action.equals("delete")) {
                boolean deleted = cartService.deleteDetailItemById(detailCartId);
                System.out.println("DELETED: " + deleted);
                if (deleted) {
                    boolean rmItem = cart.removeItem(detailCartId);
                    System.out.println("Remove item: " + rmItem);
                    *//*req.removeAttribute("CART");
                    req.getSession().setAttribute("CART", cart);*//*
                }
            }
        } catch (Exception e) {
            System.err.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXx");
        }
        resp.sendRedirect(req.getRequestURI());*/
  //  }
}
