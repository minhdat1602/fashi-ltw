<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết hoạt động</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
<input type="hidden" id="flag-index" value=".list-customer-page">
	<h3 class="ml-4 mt-3">Chi tiết hoạt động</h3>
	<h4 class="ml-4 mt-3 mb-2">Lượt mua hàng</h4>
	<div class="container-fuild mt-3"
			style="height: 450px; overflow-y: scroll; overflow-x: hidden;">
			<div class="row">
				<table class="table text-center">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Mã đơn</th>
							<th scope="col">Tổng giá bán</th>
							<th scope="col">Tổng giảm giá</th>
							<th scope="col">Thành tiền</th>
							<th scope="col">Ngày đặt</th>
							<th scope="col">Trạng thái</th>
							<th scope="col">Chi tiết</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listOrder}" var="order">
							<tr>
								<th scope="row">${order.code}</th>
								<td>${order.totalSellPrice}</td>
								<td>${PriceUtils.convert(order.totalDiscount)}đ</td>
								<td>${PriceUtils.convert(order.totalMoney)}đ</td>
								<td>${order.dateSell}</td>
								<td>${order.status}</td>
								<td><a class="btn" style="text-decoration: none;"
									href="<c:url value='/admin/danh-sach-don-hang?id=${order.id}'/>">Xem</a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


</body>
</html>