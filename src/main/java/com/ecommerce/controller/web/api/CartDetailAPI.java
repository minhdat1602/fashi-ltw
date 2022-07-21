package com.ecommerce.controller.web.api;

import com.ecommerce.model.Cart;
import com.ecommerce.model.CartDetails;
import com.ecommerce.model.Stock;
import com.ecommerce.model.User;
import com.ecommerce.service.*;
import com.ecommerce.utils.HTTPUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/api/sanpham-giohang")
public class CartDetailAPI extends HttpServlet {

    @Inject
    private ICartDetailService cartDetailService;
    @Inject
    private IStockService stockService;
    @Inject
    private IProductSizeService productSizeService;
    @Inject
    private IProductColorService productColorService;
    @Inject
    private IProductService productService;
    @Inject
    private ICartService cartService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        User user = (User) req.getSession().getAttribute("USERMODEL");
        if (user == null) {
            //insert khong co user
            Cart cart = (Cart) req.getSession().getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
                cart.setCartDetailsList(new ArrayList<CartDetails>());
            }
            Stock stock = HTTPUtil.of(req.getReader()).toModel(Stock.class);
            stock = stockService.findOne(stock.getSizeId(), stock.getColorId(), stock.getProductId());
            stock.setColor(productColorService.findOne(stock.getColorId()));
            stock.setSize(productSizeService.findOne(stock.getSizeId()));
            stock.setProduct(productService.findOne(stock.getProductId()));
            if(cart.getCartDetailsList().size() == 0){
                CartDetails cartDetails = new CartDetails();
                cartDetails.setStock(stock);
                cartDetails.setStockId(stock.getId());
                cartDetails.setQuantity(1);
                cart.getCartDetailsList().add(cartDetails);
            }else{
                boolean cons = false;
                for(int i = 0; i < cart.getCartDetailsList().size(); i++){
                    if(cart.getCartDetailsList().get(i).getStockId() == stock.getId())
                    {
                        int quantity = cart.getCartDetailsList().get(i).getQuantity();
                        cart.getCartDetailsList().get(i).setQuantity(quantity + 1);
                        cons = true;
                        break;
                    }
                }
                if(!cons){
                    CartDetails cartDetails = new CartDetails();
                    cartDetails.setStock(stock);
                    cartDetails.setStockId(stock.getId());
                    cartDetails.setQuantity(1);
                    cart.getCartDetailsList().add(cartDetails);
                }
            }
            req.getSession().setAttribute("CART", cart);
        } else {
            //insert co user
            ObjectMapper mapper = new ObjectMapper();
            Cart cart = (Cart) req.getSession().getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
                cart.setUserId(user.getId());
                cart = cartService.insert(cart);
                cart.setCartDetailsList(new ArrayList<CartDetails>());
            }
            Stock stock = HTTPUtil.of(req.getReader()).toModel(Stock.class);
            stock = stockService.findOne(stock.getSizeId(), stock.getColorId(), stock.getProductId());
            CartDetails cartDetails;

            try {
                cartDetails = cartDetailService.findOne(cart.getId(), stock.getId());
            } catch (Exception e) {
                cartDetails = null;
            }

            if (cartDetails == null) {
                cartDetails = new CartDetails();

                cartDetails.setStockId(stock.getId());
                cartDetails.setQuantity(1);
                cartDetails.setCartId(cart.getId());
                try {
                    cartDetails = cartDetailService.insert(cartDetails);
                    //set khoa ngoai
                    stock.setSize(productSizeService.findOne(stock.getSizeId()));
                    stock.setColor(productColorService.findOne(stock.getColorId()));
                    stock.setProduct(productService.findOne(stock.getProductId()));
                    cartDetails.setStock(stock);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            boolean constains = false;
            try {
                for (CartDetails c : cart.getCartDetailsList()) {
                    if (cartDetails.getId() == c.getId()) {
                        c.setQuantity(c.getQuantity() + 1);
                        cartDetailService.update(c);
                        constains = true;
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (!constains) {
                if (cart.getCartDetailsList() != null)
                    cart.getCartDetailsList().add(cartDetails);
                else {
                    cart.setCartDetailsList(new ArrayList<CartDetails>());
                    cart.getCartDetailsList().add(cartDetails);
                }
            }

            req.getSession().setAttribute("CART", cart);
            mapper.writeValue(resp.getOutputStream(), cartDetails);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        User user = (User) req.getSession().getAttribute("USERMODEL");
        if(user == null){
            ObjectMapper mapper = new ObjectMapper();
            CartDetails cartDetails = HTTPUtil.of(req.getReader()).toModel(CartDetails.class);
            //boolean updated = cartDetailService.update(cartDetails);

            Cart cart = (Cart) req.getSession().getAttribute("CART");
            for (CartDetails c : cart.getCartDetailsList()) {
                if (c.getStockId() == cartDetails.getStockId())
                    c.setQuantity(cartDetails.getQuantity());
            }
            //mapper.writeValue(resp.getOutputStream(), updated);
        }else {
            ObjectMapper mapper = new ObjectMapper();
            CartDetails cartDetails = HTTPUtil.of(req.getReader()).toModel(CartDetails.class);
            boolean updated = cartDetailService.update(cartDetails);

            Cart cart = (Cart) req.getSession().getAttribute("CART");
            for (CartDetails c : cart.getCartDetailsList()) {
                if (c.getId() == cartDetails.getId())
                    c.setQuantity(cartDetails.getQuantity());
            }
            mapper.writeValue(resp.getOutputStream(), updated);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        User user = (User) req.getSession().getAttribute("USERMODEL");
        if(user == null){
            ObjectMapper mapper = new ObjectMapper();
            CartDetails cartDetails = HTTPUtil.of(req.getReader()).toModel(CartDetails.class);
            Cart cart = (Cart) req.getSession().getAttribute("CART");
            for (CartDetails c : cart.getCartDetailsList()) {
                if (c.getStockId() == cartDetails.getStockId())
                    cart.getCartDetailsList().remove(c);
            }
            req.getSession().setAttribute("CART", cart);
            mapper.writeValue(resp.getOutputStream(), true);
        }else {
            ObjectMapper mapper = new ObjectMapper();
            CartDetails cartDetails = HTTPUtil.of(req.getReader()).toModel(CartDetails.class);
            boolean deleted = cartDetailService.delete(cartDetails.getId());
            Cart cart = (Cart) req.getSession().getAttribute("CART");
            for (CartDetails c : cart.getCartDetailsList()) {
                if (c.getId() == cartDetails.getId())
                    cart.getCartDetailsList().remove(c);
            }
            req.getSession().setAttribute("CART", cart);
            mapper.writeValue(resp.getOutputStream(), deleted);
        }
    }
}
