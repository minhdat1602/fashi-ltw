package com.ecommerce.controller.web.api;

import com.ecommerce.model.*;
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
import java.util.List;

@WebServlet(urlPatterns = "/api/cuahang")
public class ShopAPI extends HttpServlet {
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
    private IStockService stockService;

    private List<Product> listProduct;
    private List<ProductGroup> filterByCustomers;
    private List<ProductBrand> filterByBrands;
    private List<ProductColor> filterByColors;
    private List<ProductSize>  filterBySize;
    private List<ProductGroup> filterByTags;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();

        Product pageable = HTTPUtil.of(req.getReader()).toModel(Product.class);

        if(pageable.getPage() == null)
            pageable.setPage(1);

        pageable.setMaxPageItem(9);
        pageable.setTotalItem(productService.getTotalProduct());
        pageable.setTotalPage((int) Math.ceil( (double) (pageable.getTotalItem() *9 /
                pageable.getMaxPageItem()) /9 ));
        pageable.setOffset((pageable.getPage()-1) * pageable.getMaxPageItem());
        pageable.setLimit(9);
        listProduct = productService.findAll(pageable, null,null, pageable.getGroupNameArr(),  pageable.getBrandNameArr(),
                pageable.getCollectionNameArr(), 1);
        /*stockService.setIventory(listProduct);*/
        filterByCustomers = productGroupService.findAll(1);
        filterByBrands = productGroupBrandService.findAll();
        filterByColors = productColorService.findAll();
        filterBySize = productSizeService.findAll();
        filterByTags = productGroupService.findAll(2,3);

        req.setAttribute("pageable", pageable);
        req.setAttribute("listProduct", listProduct);
        req.setAttribute("filterByCustomers", filterByCustomers);
        req.setAttribute("filterByBrands", filterByBrands);
        req.setAttribute("filterByColors", filterByColors);
        req.setAttribute("filterBySize", filterBySize);
        req.setAttribute("filterByTags", filterByTags);

        mapper.writeValue(resp.getOutputStream(), pageable);
    }
}
