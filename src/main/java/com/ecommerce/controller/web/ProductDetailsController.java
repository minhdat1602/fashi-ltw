package com.ecommerce.controller.web;

import com.ecommerce.model.*;
import com.ecommerce.service.*;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/sanpham")
public class ProductDetailsController extends HttpServlet {
    @Inject
    private IProductService productService;
    @Inject
    private IProductGroupService productGroupService;
    @Inject
    private IProductBrandService productGroupBrandService;
    @Inject
    private IProductColorService productColorService;
    @Inject
    private IProductSizeService productSizeService;
    @Inject
    private IImageService imageService;
    @Inject
    private IStockService stockService;
    @Inject
    private IReviewService reviewService;
    
    private List<ProductGroup> filterByCustomers;
    private List<ProductBrand> filterByBrands;
    private List<ProductColor> filterByColors;
    private List<ProductSize> filterBySize;
    private List<ProductGroup> filterByTags;
    private Product product;
    private List<Images> listImageDetails;
    private List<Product> listRelatedProduct;
    private List<Review> listReview;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        filterByCustomers = productGroupService.findAll(1);
        filterByBrands = productGroupBrandService.findAll();
        filterByColors = productColorService.findAll();
        filterBySize = productSizeService.findAll();
        filterByTags = productGroupService.findAll(2);
        Integer id = Integer.parseInt(req.getParameter("id"));
        product = productService.findOne(id);
        product.setAvgStar(reviewService.avgStarByProductId(id));
        listReview = reviewService.findAllByProductId(id);
        ArrayList list = new ArrayList<>();
        list.add(product);
        stockService.setIventory(list);

        req.setAttribute("num", product.getTotalInventory());

        listImageDetails = imageService.findAllByProductId(id);
        listRelatedProduct = productService.findRelatedProduct(product.getGroupId());
        req.setAttribute("listReview", listReview);
        req.setAttribute("filterByCustomers", filterByCustomers);
        req.setAttribute("filterByBrands", filterByBrands);
        req.setAttribute("filterByColors", filterByColors);
        req.setAttribute("filterBySize", filterBySize);
        req.setAttribute("filterByTags", filterByTags);
        req.setAttribute("product", product);
        req.setAttribute("listImageDetails", listImageDetails);
        req.setAttribute("listRelatedProduct", listRelatedProduct);
        req.getRequestDispatcher("/view/web/product-details.jsp").forward(req, resp);
    }
}
