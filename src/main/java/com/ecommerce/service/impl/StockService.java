package com.ecommerce.service.impl;

import com.ecommerce.dao.IStockDAO;
import com.ecommerce.model.Product;
import com.ecommerce.model.Stock;
import com.ecommerce.service.IProductColorService;
import com.ecommerce.service.IProductService;
import com.ecommerce.service.IProductSizeService;
import com.ecommerce.service.IStockService;

import java.util.List;

import javax.inject.Inject;

public class StockService implements IStockService {

    @Inject
    private IStockDAO stockDAO;
    @Inject
    private IProductColorService productColorService;
    @Inject
    private IProductSizeService productSizeService;
    @Inject
    private IProductService productService;

    @Override
    public Stock findOne(Integer id) {
        Stock stock = stockDAO.findOne(id);
        stock.setSize(productSizeService.findOne(stock.getSizeId()));
        stock.setColor(productColorService.findOne(stock.getColorId()));
        stock.setProduct(productService.findOne(stock.getProductId()));
        return stock;
    }
    

	@Override
	public void setIventory(List<Product> listProduct) {
		for (Product product : listProduct) {
			product.setListStock(stockDAO.findAllByProductId(product.getId()));
			int ivent = 0;
			for (Stock stock : product.getListStock()) {
				ivent += stock.getQuantity();
			}
			product.setTotalInventory(ivent);
		}
	}

	@Override
    public Stock findOne(Integer size, Integer color, Integer productId) {
        return stockDAO.findOne(size, color, productId);
    }


	@Override
	public boolean update(Stock stock) {
		return stockDAO.update(stock);
	}


	@Override
	public Integer save(Stock stock) {
		return stockDAO.save(stock);
	}

	//dat ngay 19
	@Override
	public List<Stock> findAllByProductId(Integer id) {
		List<Stock> stocks = stockDAO.findAllByProductId(id);
		for (Stock s: stocks
		) {
			s.setSize(productSizeService.findOne(s.getSizeId()));
			s.setColor(productColorService.findOne(s.getColorId()));
		}
		return stockDAO.findAllByProductId(id);
	}
}
