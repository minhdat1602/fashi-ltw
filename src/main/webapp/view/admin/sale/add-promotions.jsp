<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.ecommerce.utils.PriceUtils"%>
<c:url var="apiURL" value="/api/san-pham-khuyen-mai"></c:url>
<c:url var="apiPromotionURL" value="/api/khuyen-mai"></c:url>
<c:url var="newURL" value="/admin/danh-sach-khuyen-mai"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm chương trình khuyến mãi</title>
</head>
<body>
	<input type="hidden" id="flag-index" value=".list-promotion-page">
	<h3 class="ml-4 mt-3">
		<c:if test="${promotion == null}">
			Thêm chương trình khuyến mãi
		</c:if>
		<c:if test="${promotion != null}">
			Chỉnh sửa chương trình khuyến mãi
		</c:if>
	</h3>
	<form id="formSubmit" action="" class="p-5">

		<div class="form-group">
			<label for="exampleFormControlInput1">Mã chương trình khuyến
				mãi</label>
			<c:if test="${promotion != null}">
				<input type="text" class="form-control" id="code" name="code"
					placeholder="Mã sản phẩm" value="${promotion.code}">
			</c:if>
			<c:if test="${promotion == null}">
				<input type="text" class="form-control" id="code" name="code"
					placeholder="Mã chương trình khuyến mãi" value="">
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Tiêu đề</label>
			<c:if test="${promotion != null}">
				<input type="text" class="form-control" id="header" name="header"
					placeholder="Nhập giá trị" value="${promotion.header}">
			</c:if>
			<c:if test="${promotion == null}">
				<input type="text" class="form-control" id="header" name="header"
					placeholder="Nhập tiêu đề">
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Tên chương trình khuyến
				mãi</label>
			<c:if test="${promotion != null}">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="Tên sản phẩm" value="${promotion.name}">
			</c:if>
			<c:if test="${promotion == null}">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="Tên chương trình khuyến mãi" value="">
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1" class="d-block">Mô tả
				chương trình khuyến mãi</label>
			<c:if test="${promotion != null}">
				<textarea id="descriptions" name="descriptions" rows="5" cols="50"
					value="">${promotion.descriptions}</textarea>
			</c:if>
			<c:if test="${promotion == null}">
				<textarea id="descriptions" name="descriptions" rows="5" cols="50"
					 value=""></textarea>
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Hình ảnh chương trình
				khuyến mãi</label>
			<c:if test="${promotion != null}">
				<input type="text" class="form-control" id="imageUrl"
					name="imageUrl" placeholder="Link" value="${promotion.imageUrl}">
				<img alt="" src="${promotion.imageUrl}">
			</c:if>
			<c:if test="${promotion == null}">
				<input type="text" class="form-control" id="imageUrl"
					name="imageUrl" placeholder="Link" value="">
			</c:if>
		</div>

		<div class="form-group">
			<label for="exampleFormControlInput1">Giảm giá %</label>
			<c:if test="${promotion != null}">
				<input type="text" class="form-control" id="value" name="value"
					placeholder="Nhập giá trị" value="${promotion.value}">
			</c:if>
			<c:if test="${promotion == null}">
				<input type="text" class="form-control" id="value"
					name="value" placeholder="Nhập giá trị">
			</c:if>
		</div>

		<div class="form-group">
			<label for="exampleFormControlInput1">Ngày bắt đầu</label>
			<c:if test="${promotion != null}">
				<input type="date" class="form-control" id="dateBegin"
					name="dateBegin" placeholder="Nhập giá trị"
					value="${promotion.dateBegin}">
			</c:if>
			<c:if test="${promotion == null}">
				<input type="date" class="form-control" id="dateBegin"
					name="dateBegin" placeholder="Chọn ngày bắt đầu">
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Ngày kết thúc</label>
			<c:if test="${promotion != null}">
				<input type="date" class="form-control" id="dateEnd"
					name="dateEnd" placeholder="Nhập giá trị"
					value="${promotion.dateEnd}">
			</c:if>
			<c:if test="${promotion == null}">
				<input type="date" class="form-control" id="dateEnd" name="dateEnd"
					placeholder="Chọn ngày bắt đầu">
			</c:if>
		</div>

		<label style="font-size: 25px;" for="exampleFormControlInput1">Danh
			sách sản phẩm trong chương trình</label>
		<div class="scrollDiv">
			<table class="table text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Chọn</th>
						<th scope="col">ID</th>
						<th scope="col">Tên</th>
						<th scope="col">Hình ảnh</th>
						<th scope="col">Phân loại</th>
						<th scope="col">Gía bán</th>
						<th scope="col">Gía niêm yết</th>
						<th scope="col">Tồn kho</th>
						<th scope="col">Nhập hàng</th>
					</tr>
				</thead>
				<tbody class="scrollDiv">
					<c:if test="${not empty listProduct}">
						<c:forEach items="${listProduct}" var="product">
							<tr>
								<td style="line-height: 60px;"><input type="checkbox"
								name="checkbox" id="checkbox_${product.id}"
								value="${product.id}"></td>
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
							</tr>

						</c:forEach>
					</c:if>
				</tbody>

			</table>

		</div>
		<div class="btn-control ml-2 mb-2">
			<button id="checkAll" type="button" class="btn btn-secondary">
				Chọn tất cả</button>
			<button id="btnDelete" type="button" class="btn btn-danger">
				Xóa<i class="fa fa-trash ml-2"></i>
			</button>
			<a
				href="<c:url value ="/admin/them-san-pham-khuyen-mai?id=${promotion.id}&page=1&maxPageItem=10&sorting=id&sortBy=asc"/>"
				style="color: white; text-decoration: none; width: 20%;"
				type="button" class="btn btn-danger ml-5 mb-3" id=updateProduct>
				Thêm sản phẩm </a>
		</div>
		<input type="hidden" name="id" id="id" value="${promotion.id}" />
	</form>
	<a style="color: white; text-decoration: none; width: 20%;"
		type="button" class="btn btn-info ml-5 mb-3" id='btnAddOrUpdate'>
		<c:if test="${empty promotion}">
			Thêm chương trình khuyến mãi
		</c:if> <c:if test="${not empty promotion}">
			Cập nhật chương trình khuyến mãi
		</c:if>
	</a>
	<script type="text/javascript">
		var ckeditor = "";
		$(document).ready(function() {
			ckeditor = CKEDITOR.replace('descriptions');
		})
		
		$("#btnDelete").click(function (){
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function (){
				return $(this).val();
			}).get();
			var id = $('#id').val();
			if (ids.length == 0) {
				alert("Chọn sản phẩm muốn xóa")
			} else{
				if (confirm("Bạn chắc chắn muốn xóa sản phầm này?")) {
					if (confirm("Xác nhận xóa")) {
						data['ids'] = ids;
						data["id"] = id;
						deleteNew(data);
					}
				  } 
			}
		})
		function deleteNew(data) {
			$.ajax({
				url: '${apiURL}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function (result){
					alert("Xóa thành công");
					window.location.href = '${newURL}?type=edit&id=' + $('#id').val()
				},
				error: function (error){
					alert("Xóa thất bại");
					window.location.href = '${newURL}?type=edit&id=' + $('#id').val()
				}
			})
		}
		 $("#btnAddOrUpdate").click(function (){
				var data = {};
				var dataForm = $("#formSubmit").serializeArray();
				$.each(dataForm, function (i, v){
					data[""+v.name+""] = v.value;
				})
				data["descriptions"] = ckeditor.getData();
				if ($("#id").val() == ""){
					addNew(data);
				} else {
					updateNew(data);
				}
			})
			function addNew(data) {
				$.ajax({
					url: '${apiPromotionURL}',
					type: 'POST',
					contentType: 'application/json',
					dataType: 'text',
					data: JSON.stringify(data),
					success: function (result){
						alert("Thêm chương trình thành công");
						window.location.href = '${newURL}?type=edit&id=' + result
					},
					error: function (error){
						alert("Thêm chương trình thất bại");
						window.location.href = '${newURL}?type=add'
					}
	
				})
			}
	
			function updateNew(data) {
				$.ajax({
					url: '${apiPromotionURL}',
					type: 'PUT',
					contentType: 'application/json',
					dataType: 'text',
					data: JSON.stringify(data),
					success: function (result){
						alert("Cập nhật chương trình thành công");
						window.location.href = '${newURL}?type=edit&id=' +  $("#id").val()
					},
					error: function (error){
						alert("Cập nhật chương trình thất bại");
						window.location.href = '${newURL}?type=edit&id=' + $("#id").val()
					}
				})
			}
	</script>
</body>
</html>