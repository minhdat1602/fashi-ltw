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
import java.util.List;


@WebServlet(urlPatterns = "/cuahang")
public class ShopController extends HttpServlet {
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
    private List<ProductSize> filterBySize;
    private List<ProductGroup> filterByTags;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("UTF-8");

        String wordsStr = req.getParameter("words");
        if(wordsStr == null){
            wordsStr = "";
        }
        String words = "%" +wordsStr +"%";
        req.setAttribute("words", wordsStr);

        Product pageable = FormUtil.toModel(Product.class, req);

        if (pageable.getPage() == null)
            pageable.setPage(1);

        //level for query
        String levelStr = req.getParameter("level");
        Integer level;
        if(levelStr == null || levelStr.trim().equals(""))
            level = 1;
        else
            level = Integer.parseInt(levelStr);

        req.setAttribute("level", level);
        // price between min and max
        String minStr = req.getParameter("priceMin");
        String maxStr = req.getParameter("priceMax");
        if (minStr == null)
            minStr = "0";
        if (maxStr == null)
            maxStr = "9999999";
        try {
            if (minStr != null && !minStr.equals(""))
                pageable.setPriceMin(Integer.parseInt(minStr));
            if (maxStr != null && !maxStr.equals(""))
                pageable.setPriceMax(Integer.parseInt(maxStr));

            req.setAttribute("priceMin", minStr);
            req.setAttribute("priceMax", maxStr);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String groupNameStr = req.getParameter("groupNameStr");
        String brandNameStr = req.getParameter("brandNameStr");

        if(level == 2) {
            String tag = req.getParameter("tag");
            if (tag != null && !tag.equals("")) {
                String[] groupNameArr = new String[1];
                groupNameArr[0] = tag;
                pageable.setGroupNameArr(groupNameArr);
            }
            req.setAttribute("tag", tag);
        }

        if(level == 1) {
            if (groupNameStr != null && !groupNameStr.equals(""))
                pageable.setGroupNameArr(groupNameStr.split("\\,"));
        }
        if (brandNameStr != null && !brandNameStr.equals(""))
            pageable.setBrandNameArr(brandNameStr.split("\\,"));

        //SORTING FOR PAGE
        pageable.setMaxPageItem(9);
        pageable.setLimit(9);

        Integer isHot = null;
        Integer isNew = null;
        String sorting = req.getParameter("sorting");
        if (sorting == null) {
            sorting = "normal";
        } else {
            if (sorting.equals("isHot")) {
                isHot = 1;
                isNew = null;
                sorting = "isHot";
            }
            if (sorting.equals("isNew")) {
                isNew = 1;
                isHot = null;
                sorting = "isNew";
            }
        }
        req.setAttribute("sorting", sorting);

        //tessssssss sieu ngu
        Integer offset = pageable.getOffset();
        Integer limit = pageable.getLimit();

        pageable.setOffset(0);
        pageable.setLimit(9999);

        List<Product> lcount = productService.findAll(pageable, isHot, isNew, level, words);
        Integer count= lcount == null ? 0: lcount.size();

        pageable.setOffset(offset);

        pageable.setLimit(limit);
        pageable.setTotalItem(count);
        //end test sieu ngu

        pageable.setTotalPage((int) Math.ceil((double) (pageable.getTotalItem() * 9 /
                pageable.getMaxPageItem()) / 9));
        pageable.setOffset((pageable.getPage() - 1) * pageable.getMaxPageItem());


        listProduct = productService.findAll(pageable, isHot, isNew, level, words);

        filterByCustomers = productGroupService.findAll(1);
        filterByBrands = productGroupBrandService.findAll();
        filterByColors = productColorService.findAll();
        filterBySize = productSizeService.findAll();
        filterByTags = productGroupService.findAll(2);

        if (pageable.getGroupNameArr() != null) {
            String afterGroupName = "";

            for (int i = 0; i < pageable.getGroupNameArr().length; i++) {
                if (i == 0)
                    afterGroupName += pageable.getGroupNameArr()[i];
                else
                    afterGroupName += "," + pageable.getGroupNameArr()[i];
            }
            req.setAttribute("groupNameStr", afterGroupName);
        }
        if (pageable.getBrandNameArr() != null) {
            String afterBrandName = "";
            for (int i = 0; i < pageable.getBrandNameArr().length; i++) {
                if (i == 0)
                    afterBrandName += pageable.getBrandNameArr()[i];
                else
                    afterBrandName += "," + pageable.getBrandNameArr()[i];
            }
            req.setAttribute("brandNameStr", afterBrandName);
        }

        req.setAttribute("pageable", pageable);
        req.setAttribute("listProduct", listProduct);
        req.setAttribute("filterByCustomers", filterByCustomers);
        req.setAttribute("filterByBrands", filterByBrands);
        req.setAttribute("filterByColors", filterByColors);
        req.setAttribute("filterBySize", filterBySize);
        req.setAttribute("filterByTags", filterByTags);

        req.getRequestDispatcher("/view/web/shop.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /*listProduct = productService.findAll(pageable, null, null, pageable.getGroupNameArr(), pageable.getBrandNameArr(),
                pageable.getCollectionNameArr(), 3);

        req.setAttribute("pageable", pageable);
        mapper.writeValue(resp.getOutputStream(), pageable);*/
    }

}
