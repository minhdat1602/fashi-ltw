package com.ecommerce.controller.web;

import com.ecommerce.model.Product;
import com.ecommerce.model.ProductGroup;
import com.ecommerce.service.IProductGroupService;
import com.ecommerce.service.IProductService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/trang-chu")
public class HomeController extends HttpServlet {
    @Inject
    private IProductService productService;
    @Inject
    private IProductGroupService productGroupService;

    private List<ProductGroup> groupMen;
    private List<ProductGroup> groupWomen;

    private List<Product> listForMen;
    private List<Product> listForWomen;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        Product pageable = new Product();
        pageable.setLimit(15);
        pageable.setOffset(0);
        Integer isHot = 1;
        Integer isNew = 1;
        Integer level = 1;


        String[] groupNameMenArr = new String[1];
        groupNameMenArr[0] = "Nam";
        pageable.setGroupNameArr(groupNameMenArr);
        listForMen = productService.findAll(pageable, 1, 1, pageable.getGroupNameArr(), pageable.getBrandNameArr(),
                pageable.getCollectionNameArr(), level);


        String[] groupNameWomanArr = new String[1];
        groupNameWomanArr[0] = "Nữ";
        pageable.setGroupNameArr(groupNameWomanArr);
        listForWomen = productService.findAll(pageable, 1, 1, pageable.getGroupNameArr(), pageable.getBrandNameArr(),
                pageable.getCollectionNameArr(), level);



        /*req.setAttribute("men", men);
        req.setAttribute("women", women);*/
        req.setAttribute("listMen", listForMen);
        req.setAttribute("listWomen", listForWomen);
        req.setAttribute("groupMen", groupMen);
        req.setAttribute("groupWomen", groupWomen);

        req.getRequestDispatcher("/view/web/index.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
