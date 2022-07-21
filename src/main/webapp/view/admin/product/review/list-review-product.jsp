<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách đánh giá</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
	<input type="hidden" id="flag-index" value=".list-review-page">
	<h3 class="ml-4 mt-3">Danh sách đánh giá sản phẩm</h3>
	<div class="product-show-option">
		<div class="row">
			<div class="col-lg-7 col-md-7">
				<div class="select-option">
					<select id="sorting" class="sorting">
						<option value="">ID</option>
					</select> <label for="sorting" id="labelForSorting">Sắp xếp theo: </label> <select
						id="p-show" class="p-show">
						<option value="">10</option>
						<option value="">15</option>
						<option value="">20</option>
					</select> <label for="p-show" id="labelForTotalItem">Hiển thị:</label>
				</div>
			</div>
		</div>
	</div>
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID Sản phẩm</th>
					<th scope="col">Tên</th>
					<th scope="col">Hình ảnh</th>
					<th scope="col">Phân loại</th>
					<th scope="col">Số lượt đánh giá</th>
					<th scope="col">Số sao trung bình</th>
					<th scope="col">Xem chi tiết</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${listReview}" var="review">
					<tr>
						<th style="line-height: 60px;" scope="row">${review.product.id}</th>
						<td style="line-height: 60px;">${review.product.name}</td>
						<td><img style="width: 60px; height: 60px;" alt=""
							src="<c:url value="/template/admin/images/products/${review.product.imageUrl}"/>"></td>
						<td style="line-height: 60px;">${review.product.groupProduct}</td>
						<td>${review.totalComment}</td>
						<td>${review.averageStar}</td>
						<td><a
							href="<c:url value ="/admin/danh-sach-danh-gia?type=view&id=${review.product.id}"/>">Xem chi tiết</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	

</body>
</html>