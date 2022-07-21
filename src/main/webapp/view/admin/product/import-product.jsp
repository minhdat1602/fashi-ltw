<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="apiURL" value="/api/nhap-san-pham"></c:url>
<c:url var="newURL" value="/admin/danh-sach-san-pham"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhập hàng</title>
</head>
<body>
	<input type="hidden" id="flag-index" value=".list-product-page">
	<h3 class="ml-4 mt-3">Nhập hàng</h3>
	<div class="wrap-import" style="padding:50px;">
		
		<input type="hidden" name= "id" id="id" value = "${product.id}">
		<div class="form-group">
			<label for="exampleFormControlInput1">Mã sản phẩm</label> <input
				type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Mã sản phẩm" value="${product.code}"
				disabled="disabled">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Tên sản phẩm</label> <input
				type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Tên sản phẩm" value="${product.name}"
				disabled="disabled">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Hình ảnh sản phẩm</label> <input
				type="text" class="form-control" id="exampleFormControlInput1"
				placeholder="Hình ảnh sản phẩm" value="${product.imageUrl}"
				disabled="disabled"> <img alt="" src="${product.imageUrl}">
		</div>

		<div class="form-group" id="attribute">
			<label for="exampleFormControlSelect2" style="margin-right: 120px;">Kích
				cỡ, Màu sắc, Số lượng</label>
			<ul id="listStock">
				<c:forEach items="${product.listStock}" var="stock">
					<form id="formSubmitUpdate${stock.id}">
						<li id="oneStock">
							<div class="form-group">
								<select class="form-control" name="sizeId">
									<c:forEach items="${listSize}" var="size">
										<c:if test="${stock.sizeId == size.id}">
											<option selected="selected" value="${size.id}">${size.name}</option>
										</c:if>
										<c:if test="${stock.sizeId != size.id}">
											<option value="${size.id}">${size.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<select class="form-control" name="colorId">
									<c:forEach items="${listColor}" var="color">
										<c:if test="${stock.colorId == color.id}">
											<option selected="selected" value="${color.id}">${color.name}</option>
										</c:if>
										<c:if test="${stock.colorId != color.id}">
											<option value="${color.id}">${color.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
									id="exampleFormControlInput1" placeholder=""
									value="${stock.quantity}"  name="quantity">
							</div>
							<input type="hidden" name= "id" id="stockId" value = "${stock.id}">
							<button data-stock="${stock.id}" type="button" class="btnUpdate btn btn-danger">
								Cập nhật</button>
								<input type="hidden" id="stt" value = "${stock.id}">
						</li>
					</form>
				</c:forEach>
				<form id="formSubmitAdd" style="margin-top:15px;">
					<li id="oneStock">
						<div class="form-group">
							<select class="form-control" name="sizeId">
								<option value="err">--Chọn--</option>
								<c:forEach items="${listSize}" var="size">
									<option value="${size.id}">${size.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<select class="form-control" name="colorId">
								<option value="err">--Chọn--</option>
								<c:forEach items="${listColor}" var="color">
									<option value="${color.id}">${color.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								id="exampleFormControlInput1" placeholder=""
								value="" name ="quantity">
						</div>
						<input type="hidden" name= "productId" id="productId" value = "${product.id}">
						<button id="btnAdd" type="button" class="btn btn-primary">
							Thêm</button>
						
					</li>
				</form>
			</ul>
		</div>
		
	</div>
	<a style="color: white; text-decoration: none; width: 20%;"
		href="<c:url value ="/admin/danh-sach-san-pham?type=list&page=1&maxPageItem=10&sorting=id&sortBy=asc"/>" type="button"
		class="btn btn-info ml-5 mb-3"> Hoàn tất</a>
		
	<script type="text/javascript">
		$(".btnUpdate").click(function() {
			var data = {};
			var stt = $(this).attr('data-stock');
			var dataForm = $("#formSubmitUpdate"+stt).serializeArray();
			$.each(dataForm, function(i, v) {
				data["" + v.name + ""] = v.value;
			})
			updateNew(data);
			
		})
		$("#btnAdd").click(function() {
			var data = {};
			var dataForm = $("#formSubmitAdd").serializeArray();
			$.each(dataForm, function(i, v) {
				data["" + v.name + ""] = v.value;
			})
			addNew(data);
			
		})
		function addNew(data) {
			$.ajax({
				url : '${apiURL}',
				type : 'POST',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(data),
				success : function(result) {
					alert("Thêm sản phẩm thành công");
					window.location.href = '${newURL}?type=import&id=' + $('#id').val()
				},
				error : function(error) {
					alert("Thêm sản phẩm thất bại");
					window.location.href = '${newURL}?type=import&id=' + $('#id').val()
				}

			})
		}

		function updateNew(data) {
			$.ajax({
				url : '${apiURL}',
				type : 'PUT',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(data),
				success : function(result) {
					alert("Cập nhật thành công");
					window.location.href = '${newURL}?type=import&id=' + $('#id').val()
				},
				error : function(error) {
					alert("Cập nhật thất bại");
					window.location.href = '${newURL}?type=import&id=' + $('#id').val()
							
				}
			})
		}
	</script>
</body>
</html>