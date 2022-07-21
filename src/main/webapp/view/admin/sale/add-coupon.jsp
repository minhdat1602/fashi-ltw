<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm mã giảm giá</title>
</head>
<body>
<input type="hidden" id="flag-index" value=".list-coupon-page">
	<h3 class="ml-4 mt-3">Thêm mã giảm giá</h3>
	<form action="" class="p-5">
		<div class="form-group">
			<label for="exampleFormControlInput1">Mã giảm giá</label> <input
				type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Mã chương trình">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Giảm giá</label> <input
				type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Tên chương trình">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1" class=" d-block">Mô tả</label>
			<textarea rows="10" cols="90" class="p-2"></textarea>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Bắt đầu</label> <input
				type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Bắt đầu">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Kết thúc</label> <input
				type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Kết thúc">
		</div>
		<div class="form-group" id="attribute">
			<label for="exampleFormControlSelect2" style="display: block;">Thêm
				sản phẩm áp dụng mã giảm giá</label>

			<div class="scrollDiv" style="height: 200px;">
				<table class="table text-center">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Xóa</th>
							<th scope="col">Cập nhật</th>
							<th scope="col">ID</th>
							<th scope="col">Tên</th>
							<th scope="col">Hình ảnh</th>
							<th scope="col"><select id="category"
								style="cursor: pointer;">
									<option>Phân loại</option>
									<optgroup label="Quần">
										<option>Tất cả Quần</option>
										<option>Kaki</option>
										<option>Tây</option>
									</optgroup>
									<optgroup label="Áo">
										<option>Tất cả Áo</option>
										<option>Thun</option>
										<option>Khoác</option>
										<option>Sơ mi</option>
									</optgroup>
									<optgroup label="Phụ kiện">
										<option>Tất cả PK</option>
										<option>Thắt lưng</option>
										<option>Ví</option>
										<option>Tất</option>
									</optgroup>
							</select></th>
							<th scope="col"><select id="for" style="cursor: pointer;">
									<option>Dành cho</option>
									<option>Nam</option>
									<option>Nữ</option>
									<option>Trẻ em</option>
							</select></th>
							<th scope="col">Gía bán</th>
							<th scope="col">Gía niêm yết</th>
							<th scope="col"><select id="status" style="cursor: pointer;">
									<option>Trạng thái</option>
									<option>Thông thường</option>
									<option>Hàng mới</option>
									<option>Nổi bật</option>
									<option>Khuyến mãi</option>
							</select></th>
							<th scope="col">Tồn kho</th>
						</tr>
					</thead>
					<tbody class="scrollDiv">
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="delete"></td>
							<td style="line-height: 60px;"><a href=""><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">1</td>
							<td style="line-height: 60px;">Áo len</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="/template/admin/images/products/product-1.jpg"/>"></td>
							<td style="line-height: 60px;">Áo</td>
							<td style="line-height: 60px;">Nữ</td>
							<td style="line-height: 60px;">100.000</td>
							<td style="line-height: 60px;">200.000</td>
							<td style="line-height: 60px;">Khuyến mãi</td>
							<td style="line-height: 60px;">158</td>
						</tr>
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="delete"></td>
							<td style="line-height: 60px;"><a href=""><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">2</td>
							<td style="line-height: 60px;">Áo len croptop</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="/template/admin/images/products/product-2.jpg"/>"></td>
							<td style="line-height: 60px;">Áo</td>
							<td style="line-height: 60px;">Nữ</td>
							<td style="line-height: 60px;">150.000</td>
							<td style="line-height: 60px;">200.000</td>
							<td style="line-height: 60px;">Khuyến mãi</td>
							<td style="line-height: 60px;">98</td>
						</tr>
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="delete"></td>
							<td style="line-height: 60px;"><a href=""><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">3</td>
							<td style="line-height: 60px;">Áo khoác kaki</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="/template/admin/images/products/product-3.jpg"/>"></td>
							<td style="line-height: 60px;">Áo</td>
							<td style="line-height: 60px;">Nam</td>
							<td style="line-height: 60px;">220.000</td>
							<td style="line-height: 60px;">220.000</td>
							<td style="line-height: 60px;">Hàng mới</td>
							<td style="line-height: 60px;">35</td>
						</tr>
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="delete"></td>
							<td style="line-height: 60px;"><a href=""><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">4</td>
							<td style="line-height: 60px;">Khăn choàng cổ</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="/template/admin/images/products/product-4.jpg"/>"></td>
							<td style="line-height: 60px;">Phụ kiện</td>
							<td style="line-height: 60px;">Nữ</td>
							<td style="line-height: 60px;">100.000</td>
							<td style="line-height: 60px;">100.000</td>
							<td style="line-height: 60px;">Hàng mới</td>
							<td style="line-height: 60px;">45</td>
						</tr>
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="delete"></td>
							<td style="line-height: 60px;"><a href=""><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">5</td>
							<td style="line-height: 60px;">Nón lưỡi trai</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="/template/admin/images/products/product-5.jpg"/>"></td>
							<td style="line-height: 60px;">Phụ kiện</td>
							<td style="line-height: 60px;">Nữ</td>
							<td style="line-height: 60px;">80.000</td>
							<td style="line-height: 60px;">80.000</td>
							<td style="line-height: 60px;">Hàng mới</td>
							<td style="line-height: 60px;">33</td>
						</tr>
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="delete"></td>
							<td style="line-height: 60px;"><a href=""><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">6</td>
							<td style="line-height: 60px;">Áo len tay dài</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="/template/admin/images/products/product-6.jpg"/>"></td>
							<td style="line-height: 60px;">Áo</td>
							<td style="line-height: 60px;">Nữ</td>
							<td style="line-height: 60px;">190.000</td>
							<td style="line-height: 60px;">190.000</td>
							<td style="line-height: 60px;">Hàng mới</td>
							<td style="line-height: 60px;">61</td>
						</tr>
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="delete"></td>
							<td style="line-height: 60px;"><a href=""><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">7</td>
							<td style="line-height: 60px;">Ba lô</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="/template/admin/images/products/product-7.jpg"/>"></td>
							<td style="line-height: 60px;">Phụ kiện</td>
							<td style="line-height: 60px;">Nam</td>
							<td style="line-height: 60px;">120.000</td>
							<td style="line-height: 60px;">120.000</td>
							<td style="line-height: 60px;">Hàng mới</td>
							<td style="line-height: 60px;">71</td>
						</tr>
						<tr>
							<td style="line-height: 60px;"><input type="checkbox"
								name="delete"></td>
							<td style="line-height: 60px;"><a href=""><i
									class="fa fa-edit"></i></a></td>
							<td style="line-height: 60px;" scope="row">8</td>
							<td style="line-height: 60px;">Áo khoác dù</td>
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="/template/admin/images/products/product-8.jpg"/>"></td>
							<td style="line-height: 60px;">Áo</td>
							<td style="line-height: 60px;">Nam</td>
							<td style="line-height: 60px;">250.000</td>
							<td style="line-height: 60px;">250.000</td>
							<td style="line-height: 60px;">Hàng mới</td>
							<td style="line-height: 60px;">78</td>
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
					href="<c:url value ="/view/admin/sale/add-product-coupon.jsp"/>"
					type="button" class="btn btn-info"> Thêm sản phẩm<i
					class="fa fa-plus ml-2"></i>
				</a>
			</div>
		</div>
		<div class="form-group" id="attribute">
			<label for="exampleFormControlSelect2" style="display: block;">Thêm
				nhóm sản phẩm áp dụng mã giảm giá</label>

			<div class="scrollDiv" style="height: 200px;">
				<table class="table text-center">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Xóa</th>
							<th scope="col">Cập nhật</th>
							<th scope="col">Tên nhóm sản phẩm</th>
						</tr>
					</thead>
					<tbody class="scrollDiv">
						<tr>
							<td><input type="checkbox" name="delete"></td>
							<td><a href=""><i class="fa fa-edit"></i></a></i></td>
							<td>Nam</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>

		<div class="btn-control ml-2 mb-2">
			<button type="button" class="btn btn-danger">
				Xóa<i class="fa fa-trash ml-2"></i>
			</button>
			<button type="button" class="btn btn-danger">
				Xóa tất cả<i class="fa fa-trash  ml-2"></i>
			</button>
			<a style="color: white; text-decoration: none;"
				href="<c:url value ="/view/admin/sale/add-group-coupon.jsp"/>"
				type="button" class="btn btn-info"> Thêm nhóm sản phẩm<i
				class="fa fa-plus ml-2"></i>
			</a>
		</div>
	</form>

	<a style="color: white; text-decoration: none; width: 20%;"
		href="<c:url value ="/view/admin/add-product.jsp"/>" type="button"
		class="btn btn-info ml-5 mb-3"> Thêm </a>
</body>
</html>