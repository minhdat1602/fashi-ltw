package com.ecommerce.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.model.Order;
import com.ecommerce.model.Product;
import com.ecommerce.model.ProductBrand;
import com.ecommerce.model.ProductColor;
import com.ecommerce.model.ProductGroup;
import com.ecommerce.model.ProductSize;
import com.ecommerce.model.Stock;
import com.ecommerce.service.IOrderService;
import com.ecommerce.service.IProductBrandService;
import com.ecommerce.service.IProductColorService;
import com.ecommerce.service.IProductGroupService;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IProductSizeService;
import com.ecommerce.service.IStockService;
import com.ecommerce.utils.FormUtil;

@WebServlet(urlPatterns = "/admin/search")
public class SearchController extends HttpServlet{
	@Inject
	private IProductService productService;

	@Inject
	private IStockService stockService;
	
	@Inject
	private IOrderService orderService;
	
	private List<Product> listProduct;
	private List<Order> listOrder;
	private Product product;
	private Order order;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String filter = req.getParameter("filter");
		String filterAttr = req.getParameter("filterAttr");
		String key = req.getParameter("key");
		if (filter.equalsIgnoreCase("products")){
			product = FormUtil.toModel(Product.class, req);
			if (filterAttr.equalsIgnoreCase("name")) {
				key = "%" + key + "%";
				listProduct = productService.findAllByKey(filterAttr,key);
				stockService.setIventory(listProduct);
			}else if (filterAttr.equalsIgnoreCase("id")) {
				Integer id = Integer.parseInt(key);
				Product product = productService.findOne(id);
				listProduct = new ArrayList<Product>();
				if (product!=null) {
					listProduct.add(product);
					stockService.setIventory(listProduct);
				}	
			}
			req.setAttribute("listProduct", listProduct);
			req.setAttribute("product", product);
			req.getRequestDispatcher("/view/admin/product/search-product.jsp").forward(req, resp);
		} else if (filter.equalsIgnoreCase("orders")) {
			order =  FormUtil.toModel(Order.class, req);
			if (filterAttr.equalsIgnoreCase("code")) {
				Order od = orderService.findOne(key);
				listOrder = new ArrayList<Order>();
				if (od != null) {
					listOrder.add(od);
				}
				req.setAttribute("order", order);
				req.setAttribute("listOrder",listOrder);
				req.getRequestDispatcher("/view/admin/order/search-order.jsp").forward(req, resp);
			}
		}
	}
}
