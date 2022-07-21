<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chọn nhóm sản phẩm áp dụng mã giảm giá</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
<input type="hidden" id="flag-index" value=".list-sale-page">
	<h3 class="ml-4 mt-3 mb-3 d-inline">Nhóm sản phẩm</h3>
	<a style="text-decoration: none;"
		href="<c:url value ="/view/admin/product/add-coupon.jsp"/>"
		type="button" class="btn btn-info"> Lưu tất cả <i
		class="fa fa-plus ml-2"></i>
	</a>
	<h4 class="ml-4 mt-5 mb-2">Đối tượng Khách Hàng (Nhóm sản phẩm Bậc
		1)</h4>
	<div class="">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Thêm</th>
					<th scope="col">Tên nhóm khách hàng</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Nam</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>

					<td>Nữ</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>

					<td>Trẻ em</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="btn-control ml-2 mb-2">
		<button type="button" class="btn btn-success">
			Lưu<i class=" ml-2"></i>
		</button>
		<button type="button" class="btn btn-primary">
			Thêm tất cả<i class="fa fa-plus  ml-2"></i>
		</button>
	</div>




	<h4 class="ml-4 mt-5 mb-2">Danh mục sản phẩm (Nhóm sản phẩm Bậc 2)</h4>
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Thêm</th>
					<th scope="col">Tên nhóm danh mục</th>
					<th scope="col">Tên nhóm khách hàng</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<tr>
					<td><input type="checkbox" name="add"></td>

					<td>Quần</td>
					<td>Nam</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					
					<td>Áo</td>
					<td>Nam</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Phụ kiện</td>
					<td>Nam</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>

					<td>Quần</td>
					<td>Nữ</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					
					<td>Áo</td>
					<td>Nữ</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>

					<td>Phụ kiện</td>
					<td>Nữ</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>			
					<td>Quần</td>
					<td>Trẻ em</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Áo</td>
					<td>Trẻ em</td>

				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-control ml-2 mb-2">
		<button type="button" class="btn btn-success">
			Lưu<i class="ml-2"></i>
		</button>
		<button type="button" class="btn btn-primary">
			Thêm tất cả<i class="fa fa-plus  ml-2"></i>
		</button>
	</div>

	<h4 class="ml-4 mt-5 mb-2">Loại sản phẩm (Nhóm sản phẩm Bậc 3)</h4>
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Thêm</th>
					<th scope="col">Tên nhóm loại</th>
					<th scope="col">Tên nhóm danh mục</th>
					<th scope="col">Tên nhóm khách hàng</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Quần kaki</td>
					<td>Quần</td>
					<td>Nam</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Quần tây</td>
					<td>Quần</td>
					<td>Nam</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Áo thun</td>
					<td>Áo</td>
					<td>Nam</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Áo sơ mi</td>
					<td>Áo</td>
					<td>Nam</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Ví</td>
					<td>Phụ kiện</td>
					<td>Nam</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Thắt lưng</td>
					<td>Phụ kiện</td>
					<td>Nam</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>

					<td>Quần kaki</td>
					<td>Quần</td>
					<td>Nữ</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Quần tây</td>
					<td>Quần</td>
					<td>Nữ</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Áo thun</td>
					<td>Áo</td>
					<td>Nữ</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Áo sơ mi</td>
					<td>Áo</td>
					<td>Nữ</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Ví</td>
					<td>Phụ kiện</td>
					<td>Nữ</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Khăn</td>
					<td>Phụ kiện</td>
					<td>Nữ</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Quần kaki</td>
					<td>Quần</td>
					<td>Trẻ em</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Quần tây</td>
					<td>Quần</td>
					<td>Trẻ em</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Áo thun</td>
					<td>Áo</td>
					<td>Trẻ em</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="add"></td>
					<td>Áo sơ mi</td>
					<td>Áo</td>
					<td>Trẻ em</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn-control ml-2 mb-2">
		<button type="button" class="btn btn-success">
			Lưu<i class=" ml-2"></i>
		</button>
		<button type="button" class="btn btn-primary">
			Thêm tất cả<i class="fa fa-plus  ml-2"></i>
		</button>
	</div>



</body>
</html>