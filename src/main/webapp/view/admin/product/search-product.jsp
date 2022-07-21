<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ecommerce.utils.PriceUtils"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="apiURL" value="/api/san-pham"></c:url>
<c:url var="newURL" value="/admin/danh-sach-san-pham"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
<style type="text/css">
.scrollDiv .table.text-center img {
	width: 60px;
	height: 60px;
}

.scrollDiv .table.text-center  td {
	line-height: 60px;
}
</style>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
	<form action="<c:url value='/admin/danh-sach-san-pham'/>" method="get"
		id="submitForm">
		<input type="hidden" id="flag-index" value=".list-product-page">
		<h3 class="ml-4 mt-3">
			Kết quả tìm kiếm: Sản phẩm có
			<c:if test="${product.filterAttr== 'name'}">
			tên
		</c:if>
			<c:if test="${product.filterAttr== 'id'}">
			id
		</c:if>
			: ${product.key}
		</h3>
		<div class="scrollDiv">
			<table class="table text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Xóa</th>
						<th scope="col">Cập nhật</th>
						<th scope="col">ID</th>
						<th scope="col">Tên</th>
						<th scope="col">Hình ảnh</th>
						<th scope="col">Phân loại</th>
						<th scope="col">Gía bán</th>
						<th scope="col">Gía niêm yết</th>
						<th scope="col">Tồn kho</th>
						<th scope="col">Nhập hàng</th>
						<th scope="col">Đánh giá</th>
					</tr>
				</thead>
				<tbody class="scrollDiv">
					<c:forEach items="${listProduct}" var="product">
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="checkbox" id="checkbox_${product.id}"
								value="${product.id}"></td>
							<td style="line-height: 60px;"><a
								href="<c:url value ="/admin/danh-sach-san-pham?type=edit&id=${product.id}"/>"><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">${product.id}</td>
							<td style="line-height: 60px;">${product.name}</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="${product.imageUrl}"></td>
							<td style="line-height: 60px;">${product.groupProduct}</td>
							<td style="line-height: 60px;">${PriceUtils.convert(product.sellPrice)}</td>
							<td style="line-height: 60px;">${PriceUtils.convert(product.originPrice)}</td>
							<td style="line-height: 60px;">${product.totalInventory}</td>
							<td style="line-height: 60px;"><a
								href="<c:url value ="/admin/danh-sach-san-pham?type=import&id=${product.id}"/>">Nhập</a></td>
							<td style="line-height: 60px;"><a
								href="<c:url value ="/admin/danh-sach-danh-gia?type=view&id=${product.id}"/>">Xem</a></td>
						</tr>

					</c:forEach>

				</tbody>

			</table>


		</div>

		<div class="btn-control ml-2 mb-2">
			<button id="checkAll" type="button" class="btn btn-secondary">
				Chọn tất cả</button>
			<button id="btnDelete" type="button" class="btn btn-danger">
				Xóa<i class="fa fa-trash ml-2"></i>
			</button>
			<a style="color: white; text-decoration: none;"
				href="<c:url value ="/admin/danh-sach-san-pham?type=add"/>"
				type="button" class="btn btn-info"> Thêm sản phẩm <i
				class="fa fa-plus ml-2"></i>
			</a>
		</div>
		<div style="margin-left: 5px;" class="container">
			<nav aria-label="Page navigation">
				<ul class="pagination" id="pagination"></ul>
			</nav>
		</div>


	</form>

	<script type="text/javascript">
		$("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function() {
				return $(this).val();
			}).get();
			if (ids.length == 0) {
				alert("Chọn sản phẩm muốn xóa")
			} else {
				if (confirm("Bạn chắc chắn muốn xóa sản phầm này?")) {
					if (confirm("Xác nhận xóa")) {
						data['ids'] = ids;
						deleteNew(data);
					}

				}
			}

		})
		function deleteNew(data) {
			$.ajax({
				url : '${apiURL}',
				type : 'DELETE',
				contentType : 'application/json',
				data : JSON.stringify(data),
				success : function(result) {
					alert("Xóa thành công");
					window.location.href = '${newURL}?type=list&page='
							+ $('#page').val() + '&maxPageItem='
							+ $('#maxPageItem').val()
				},
				error : function(error) {
					alert("Xóa thất bại");
					window.location.href = '${newURL}?type=list&page='
							+ $('#page').val() + '&maxPageItem='
							+ $('#maxPageItem').val()
				}
			})
		}
	</script>


</body>
</html>