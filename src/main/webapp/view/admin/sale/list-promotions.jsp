<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách chương trình khuyến mãi</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
<input type="hidden" id="flag-index" value=".list-promotion-page">
	<h3 class="ml-4 mt-3">Danh sách chương trình khuyến mãi</h3>
	<div class="product-show-option">
		<div class="row">
			<div class="col-lg-7 col-md-7">
				<div class="select-option">
					<select id="sorting" class="sorting">
						<option value="">Ngày kết thúc</option>
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
					<th scope="col">ID</th>
					<th scope="col">Mã</th>
					<th scope="col">Tên chương trình</th>
					<th scope="col">Giảm giá</th>
					<th scope="col">Bắt đầu</th>
					<th scope="col">Kết thúc</th>
					<th scope="col">Xem chi tiết</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
			<c:forEach items="${listPromotion}" var="promotion">
			
					<tr>
						<th scope="row">${promotion.id}</th>
						<td>${promotion.code}</td>
						<td>${promotion.name}</td>
						<td>${promotion.value}%</td>
						<td>${promotion.dateBegin}</td>
						<td>${promotion.dateEnd}</td>
						<td><a href="<c:url value ="/admin/danh-sach-khuyen-mai?type=edit&id=${promotion.id}"/>">Xem</a></td>
					</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div>
	<div class="btn-control ml-2 mb-2">
		<a style="color: white; text-decoration: none;"
			href="<c:url value ="/admin/danh-sach-khuyen-mai?type=add"/>"
			type="button" class="btn btn-info"> Thêm chương trình <i
			class="fa fa-plus ml-2"></i>
		</a>
	</div>


</body>
</html>