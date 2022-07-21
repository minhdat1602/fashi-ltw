package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Product;
import com.ecommerce.model.ProductBrand;
import com.ecommerce.model.ProductColor;
import com.ecommerce.model.ProductGroup;
import com.ecommerce.model.ProductSize;
import com.ecommerce.model.Promotion;
import com.ecommerce.model.Stock;
import com.ecommerce.service.IImageService;
import com.ecommerce.service.IProductBrandService;
import com.ecommerce.service.IProductColorService;
import com.ecommerce.service.IProductGroupService;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IProductSizeService;
import com.ecommerce.service.IPromotionService;
import com.ecommerce.service.IStockService;
import com.ecommerce.utils.FormUtil;

@WebServlet(urlPatterns = "/admin/them-san-pham-khuyen-mai")
public class PromotionProductController extends HttpServlet{
	@Inject
	private IProductService productService;
	@Inject
	private IPromotionService promotionService;
	@Inject
	private IStockService stockService;

	private List<Product> listProduct;

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Product pageable = FormUtil.toModel(Product.class, req);
		pageable.setTotalItem(productService.getTotalProduct());
		pageable.setTotalPage((int) Math.ceil( (double) (pageable.getTotalItem() *10 /pageable.getMaxPageItem()) /10 ));
		pageable.setOffset((pageable.getPage()-1) * pageable.getMaxPageItem());
		listProduct = productService.findAllNotInPromotionId(pageable,Integer.parseInt(req.getParameter("id")));	
		stockService.setIventory(listProduct);
		Product product = new Product();
		product.setFilter("products");
		product.setFilterAttr("id");
		Promotion promotion = promotionService.findOneById(Integer.parseInt(req.getParameter("id")));
		req.setAttribute("pageable", pageable);
		req.setAttribute("listProduct", listProduct);
		req.setAttribute("promotion", promotion);
		req.setAttribute("product", product);
		req.getRequestDispatcher("/view/admin/sale/add-product-promotions.jsp").forward(req, resp);
	}	
}
