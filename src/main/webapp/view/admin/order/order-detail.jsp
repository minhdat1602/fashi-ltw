<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.ecommerce.utils.PriceUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết đơn hàng</title>
</head>
<body>
	<input type="hidden" id="flag-index" value=".list-order-page">
	<h3 class="ml-4 mt-3">Chi tiết đơn hàng</h3>
	<div class="content">
		<div
			class="invoice-wrapper rounded border bg-white py-5 px-3 px-md-4 px-lg-5">
			<div class="d-flex justify-content-between">
				<h2 class="text-dark font-weight-medium">Hóa đơn #${order.code}</h2>
				<div class="btn-group">
					<button class="btn btn-sm btn-secondary">
						<i class="mdi mdi-content-save"></i> Lưu
					</button>
					<button class="btn btn-sm btn-secondary">
						<i class="mdi mdi-printer"></i> Print
					</button>
				</div>
			</div>
			<div class="row pt-5">
				<div class="col-xl-6 col-lg-6">
					<p class="text-dark mb-2">Gửi đến:</p>
					<address>
						${order.user.lastName} ${order.user.firstName}<br>
						${order.user.address} <br> Số điện thoại: ${order.user.phone}
					</address>
				</div>
				<div class="col-xl-6 col-lg-6">
					<p class="text-dark mb-2">Chi tiết</p>
					<address>
						Mã hóa đơn: <span class="text-dark">#${order.code}</span> <br>${order.dateSell}
					</address>
				</div>
			</div>
			<table style="width: 100%">
				<thead>
					<tr>
						<th>Sản phẩm</th>
						<th>Màu sắc</th>
						<th>Size</th>
						<th>Đơn giá</th>
						<th>Số lượng</th>
						<th>Giảm giá</th>
						<th>Tổng giá</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order.listOrderDetails}" var="details">
						<tr>
							<td>${details.product}</td>
							<td>${details.color}</td>
							<td>${details.size}</td>
							<td>${PriceUtils.convert(details.price)} đ</td>
							<td>${details.quantity}</td>
							<td>${PriceUtils.convert(details.discount)} đ</td>
							<td>${PriceUtils.convert(details.totalPrice)} đ</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row justify-content-end">
				<div class="col-lg-5 col-xl-4 col-xl-3 ml-sm-auto">
					<ul class="list-unstyled mt-4">
						<li class="mid pb-3 text-dark">TỔNG SỐ TIỀN <span
							class="d-inline-block float-right text-default">${PriceUtils.convert(order.totalSellPrice)} đ</span>
						</li>
						<li class="mid pb-3 text-dark">GIẢM GIÁ<span
							class="d-inline-block float-right text-default">${PriceUtils.convert(order.totalDiscount)} đ</span>
						</li>
						<li class="mid pb-3 text-dark">THÀNH TIỀN <span
							class="d-inline-block float-right text-default">${PriceUtils.convert(order.totalMoney)} đ</span>
						</li>
					</ul>
					<a href="#" class="btn btn-block mt-2 btn-lg btn-primary btn-pill">TIẾP NHẬN</a> 
					<a href="#" class="btn btn-block mt-2 btn-lg btn-danger btn-pill">HỦY ĐƠN HÀNG</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>