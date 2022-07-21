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

import com.ecommerce.model.Images;
import com.ecommerce.model.Product;
import com.ecommerce.model.ProductBrand;
import com.ecommerce.model.ProductColor;
import com.ecommerce.model.ProductGroup;
import com.ecommerce.model.ProductSize;
import com.ecommerce.model.Stock;
import com.ecommerce.service.IImageService;
import com.ecommerce.service.IProductBrandService;
import com.ecommerce.service.IProductColorService;
import com.ecommerce.service.IProductGroupService;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IProductSizeService;
import com.ecommerce.service.IStockService;
import com.ecommerce.utils.FormUtil;

@WebServlet(urlPatterns = "/admin/danh-sach-san-pham")
public class ProductController extends HttpServlet {
	@Inject
	private IProductService productService;
	@Inject
	private IProductBrandService brandService;
	@Inject
	private IProductGroupService groupService;
	@Inject
	private IStockService stockService;
	@Inject
	private IProductColorService productColorService;
	@Inject
	private IProductSizeService productSizeService;
	@Inject
	private IImageService imageService;
	
	private List<Stock> listStock;
	private List<ProductBrand> listProductBrand;
	private List<Product> listProduct;
	private List<ProductGroup> listProductGroup;
	private List<ProductColor> listColor;
	private List<ProductSize>  listSize;
	private Product product;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		Product pageable = FormUtil.toModel(Product.class, req);
		if (!type.equalsIgnoreCase("list")) {
			listProductBrand = brandService.findAll();
			listProductGroup = groupService.findAll(3);
			req.setAttribute("listProductBrand", listProductBrand);
			req.setAttribute("listProductGroup", listProductGroup);
			if (type.equalsIgnoreCase("edit")) {
				String idStr = req.getParameter("id");
				Integer id = Integer.parseInt(idStr);
				List<Images> listImage = new ArrayList<Images>();
				listImage = imageService.findAllByProductId(id);
				product = productService.findOne(id);
				req.setAttribute("product", product);
				req.setAttribute("listImage", listImage);
				req.getRequestDispatcher("/view/admin/product/add-product.jsp").forward(req, resp);
			} else if (type.equalsIgnoreCase("add")) {	
				req.getRequestDispatcher("/view/admin/product/add-product.jsp").forward(req, resp);
			} else if (type.equalsIgnoreCase("import")) {
				String idStr = req.getParameter("id");
				Integer id = Integer.parseInt(idStr);
				product = productService.findOne(id);
				List<Product> list = new ArrayList<Product>();
				list.add(product);
				stockService.setIventory(list);
				product = list.get(0);
				listColor = productColorService.findAll();
				listSize = productSizeService.findAll();
				req.setAttribute("listColor", listColor);
				req.setAttribute("listSize", listSize);
				req.setAttribute("product", product);
				req.getRequestDispatcher("/view/admin/product/import-product.jsp").forward(req, resp);
			}
		} else {
			pageable.setTotalItem(productService.getTotalProduct());
			pageable.setTotalPage((int) Math.ceil( (double) (pageable.getTotalItem() *10 /pageable.getMaxPageItem()) /10 ));
			pageable.setOffset((pageable.getPage()-1) * pageable.getMaxPageItem());
			listProduct = productService.findAll(pageable);
			stockService.setIventory(listProduct);
			Product product = new Product();
			product.setFilter("products");
			product.setFilterAttr("id");
			req.setAttribute("pageable", pageable);
			req.setAttribute("listProduct", listProduct);
			req.setAttribute("product", product);
			req.getRequestDispatcher("/view/admin/product/list-product.jsp").forward(req, resp);
		}
	}
}
