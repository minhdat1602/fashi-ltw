<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách câu hỏi thường gặp</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
<input type="hidden" id="flag-index" value=".faq-page">
	<h3 class="ml-4 mt-3">Danh sách câu hỏi thường gặp</h3>
	<div class="product-show-option">
		<div class="row">
			<div class="col-lg-7 col-md-7">
				<div class="select-option">
					<select id="sorting" class="sorting">
						<option value="">Tên</option>

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
				<th scope="col">Xóa</th>
					<th scope="col">Cập nhật</th>
					<th scope="col">ID</th>
					<th scope="col">Câu hỏi</th>
					<th scope="col">Câu trả lời</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">

				<tr>
				<td ><input type="checkbox" name="delete"></td>
					<td ><a href=""><i class="fa fa-edit"></i></a></td>
					<th scope="row">1</th>
					<td>Sản phẩm có được đổi trả không ?</td>
					<td>Khách hàng hoàn toàn có thể đổi trả hàng trong vòng 7 ngày
						kể từ ngày nhận hàng. </br> Tuy nhiên, hàng phải còn nguyên vẹn, không rách, nát, hư hỏng</td>
				</tr>
				<tr>
				<td ><input type="checkbox" name="delete"></td>
					<td ><a href=""><i class="fa fa-edit"></i></a></td>
					<th scope="row">2</th>
					<td>Sản phẩm có giống với màu và hình ảnh thực tế sản phẩm không ?</td>
					<td>Fashi cam kết hình ảnh sản phẩm trên website và sản phẩm giao cho khách hàng là giống nhau 100%</td>
				</tr>
				<tr>
				<td ><input type="checkbox" name="delete"></td>
					<td ><a href=""><i class="fa fa-edit"></i></a></td>
					<th scope="row">3</th>
					<td>Đơn hàng online có thể giao hàng đến những tỉnh thành nào ?</td>
					<td>Fashi hỗ trợ giao hàng ở tất cả các tỉnh thành trên toàn quốc</td>
				</tr>
				<tr>
				<td ><input type="checkbox" name="delete"></td>
					<td ><a href=""><i class="fa fa-edit"></i></a></td>
					<th scope="row">4</th>
					<td>Đặt hàng online có cần đăng ký tài khoản không ?</td>
					<td>Để mua được hàng tại Fashi, khách hàng cần có tài khoản để mua hàng</td>
				</tr>
				<tr>
				<td ><input type="checkbox" name="delete"></td>
					<td ><a href=""><i class="fa fa-edit"></i></a></td>
					<th scope="row">5</th>
					<td>Fashi có hỗ trợ chăm sóc khách hàng ?</td>
					<td>Fashi có hỗ trợ chăm sóc khách hàng:</br>
						Email: fashi@gmail.com</br>
						Số điện thoại: 0123456789
					</td>
				</tr>

			</tbody>
		</table>
	</div>

	<div class="btn-control ml-2 mb-2">
		<button type="button" class="btn btn-danger">
			Xóa<i class="fa fa-trash ml-2"></i>
		</button>
		<button type="button" class="btn btn-danger">
			Xóa tất cả<i class="fa fa-trash  ml-2"></i>
		</button>
		<a style="color: white; text-decoration: none;"
			href="<c:url value ="/view/admin/statistical/add-faq.jsp"/>"
			type="button" class="btn btn-info"> Thêm câu hỏi <i
			class="fa fa-plus ml-2"></i>
		</a>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>


</body>
</html>