package com.ecommerce.model;

import java.sql.Time;
import java.sql.Timestamp;

/*
	productGroupId: loại sản phẩm được giảm giá
	productId: sản phảm nào không được giảm giá, vd: sản phẩm hot + new là không giảm trong group sản phẩm đó.
	new: chắc là có chương trình giảm giá riêng.
	hot: bán đắt vậy giảm giá chi má.
 */
// =>
public class Coupon extends AbstractModel{
	private String code;
	private Double value;
	private Integer productId;
	private Integer productGroupId;
	private Integer type;	// 1 == type -> giam so tien, // 2 == type -> giam %
	private Timestamp dateBegin;
	private Timestamp dateEnd;
}

