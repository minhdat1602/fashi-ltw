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
<c:if test="${product == null}">
	<title>Thêm sản phẩm</title>
</c:if>
<c:if test="${product != null}">
	<title>Chỉnh sửa sản phẩm</title>
</c:if>
</head>
<body>
	<input type="hidden" id="flag-index" value=".list-product-page">
	<h3 class="ml-4 mt-3">
		<c:if test="${product == null}">
			Thêm sản phẩm
		</c:if>
		<c:if test="${product != null}">
			Chỉnh sửa sản phẩm
		</c:if>
	</h3>
	<form id="formSubmit" action="" class="p-5">
		
		<div class="form-group">
			<label for="exampleFormControlInput1">Mã sản phẩm</label>
			<c:if test="${product != null}">
				<input type="text" class="form-control"
					id="code" name="code" placeholder="Mã sản phẩm"
					value="${product.code}">
					<input type="hidden" class="form-control"
					id="id" name="id" value="${product.id}">
			</c:if>
			<c:if test="${product == null}">
				<input type="text" class="form-control"
					id="code" name="code" placeholder="Mã sản phẩm" value="">
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Tên sản phẩm</label>
			<c:if test="${product != null}">
				<input type="text" class="form-control"
					id="name" name="name" placeholder="Tên sản phẩm"
					value="${product.name}">
			</c:if>
			<c:if test="${product == null}">
				<input type="text" class="form-control"
					id="name" name="name" placeholder="Tên sản phẩm" value="">
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1" class="d-block">Mô tả
				sản phẩm</label>
			<c:if test="${product != null}">
				<textarea id="description" name = "description" rows="5" cols="50" name="description"
					value="">${product.description}</textarea>
			</c:if>
			<c:if test="${product == null}">
				<textarea id="description" name = "description" rows="5" cols="50" name="description" value=""></textarea>
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Hình ảnh sản phẩm</label>
			<c:if test="${product != null}">
				<input type="text" class="form-control"
					id="imageUrl" name="imageUrl" placeholder="Link"
					value="${product.imageUrl}">
					<img alt="" src="${product.imageUrl}">
			</c:if>
			<c:if test="${product == null}">
				<input type="text" class="form-control"
					id="imageUrl" name="imageUrl" placeholder="Link" value="">
			</c:if>
		</div>
		<div class="form-group" id="imageDetails">
			<label for="exampleFormControlInput1">Hình ảnh chi tiết</label>
			<c:if test="${product != null}">
				<c:forEach items="${listImage}" var="image">
					<div class="oneImage">
						<input type="text" class="imageType form-control"
							name="imageDetails" placeholder="Link"
							value="${image.imageUrl}">
							<img id="imagedetails" alt="" src="${image.imageUrl}">
					</div>
					<button style="color: white; text-decoration: none; width: 10%;margin-left:85px;" type="button"
					 class="deleteImage btn btn-danger ml-5 mb-3"> Xóa ảnh</button>
				</c:forEach>		
				
			</c:if>
		</div>
		
		
		<button style="color: white; text-decoration: none; width: 20%;display:block;margin-top:25px;" type="button"
					class="btn btn-info ml-5 mb-3" id='addImage'> Thêm ảnh
		</button>
		<div class="form-group">
			<label for="exampleFormControlSelect1">Phân loại</label> <select
				class="form-control" id="groupId" name ="groupId">
				<option>Chọn--</option>
				<c:if test="${empty product}">
					<c:forEach items="${listProductGroup}" var="group">
						<option value="${group.id}">${group.code}</option>
					</c:forEach>
				</c:if>
				<c:if test="${not empty product}">
					<c:forEach items="${listProductGroup}" var="group">
						<c:if test="${product.groupId == group.id}">
							<option selected="selected" value="${group.id}">${group.code}</option>
						</c:if>
						<c:if test="${product.groupId != group.id}">
							<option value="${group.id}">${group.code}</option>
						</c:if>

					</c:forEach>
				</c:if>
			</select>
		</div>

		
		<div class="form-group">
			<label for="exampleFormControlSelect3">Thương hiệu</label> <select
				class="form-control" id="brandId" name="brandId">
				<c:if test="${empty product}">
					<c:forEach items="${listProductBrand}" var="brand">
						<option value="${brand.id}">${brand.name}</option>
					</c:forEach>
				</c:if>
				<c:if test="${not empty product}">
					<c:forEach items="${listProductBrand}" var="brand">
						<c:if test="${product.brandId == brand.id}">
							<option selected="selected" value="${brand.id}">${brand.name}</option>
						</c:if>
						<c:if test="${product.brandId != brand.id}">
							<option value="${brand.id}">${brand.name}</option>
						</c:if>

					</c:forEach>
				</c:if>
			</select>
		</div>
		
		<div class="form-group">
			<label for="exampleFormControlInput1">Gía niêm yết</label>
			<c:if test="${product != null}">
				<input type="text" class="form-control"
					id="originPrice" name = "originPrice" placeholder="Nhập giá niêm yết"
					value="${product.originPrice}">
			</c:if>
			<c:if test="${product == null}">
				<input type="text" class="form-control"
					id="originPrice" name = "originPrice" placeholder="Nhập giá niêm yết">
			</c:if>
		</div>
		
		<div class="form-group">
			<label for="exampleFormControlInput1">Gía bán</label>
			<c:if test="${product != null}">
				<input type="text" class="form-control"
					id="sellPrice" name = "sellPrice"  placeholder="Nhập giá bán"
					value="${product.sellPrice}">
			</c:if>
			<c:if test="${product == null}">
				<input type="text" class="form-control"
					id="sellPrice" name = "sellPrice"  placeholder="Nhập giá niêm yết">
			</c:if>
		</div>
		<input type="hidden" name="id" id="id" value="${product.id}"/>
	</form>
	<a style="color: white; text-decoration: none; width: 20%;" type="button"
		class="btn btn-info ml-5 mb-3" id='btnAddOrUpdate'> 
		<c:if test="${empty product}">
			Thêm sản phẩm
		</c:if>
		<c:if test="${not empty product}">
			Cập nhật sản phẩm
		</c:if>
	 </a>

		<script type="text/javascript">
		 	var ckeditor = "";
	        $(document).ready(function (){
	            ckeditor = CKEDITOR.replace('description');
	        })
	        $("#addImage").click(function (){
	        	$("#imageDetails").append('<div class="oneImage"><input type="text" class="imageType form-control" name="imageDetails" placeholder="Link" value=""></div><button style="color: white; text-decoration: none; width: 10%;margin-left:85px;" type="button" class="deleteImage btn btn-danger ml-5 mb-3"> Xóa ảnh</button>');
	        	 $(".deleteImage").click(function (){
	        		 if (confirm("Xóa ảnh ?")) {
			        	 ($(this).prev(".oneImage")).remove();
			        	 $(this).remove();
	        		 }
		        })
	        })
	        
	        
	         $(".deleteImage").click(function (){
	        	 if (confirm("Xóa ảnh ?")) {
	        		 ($(this).prev(".oneImage")).remove();
		        	 $(this).remove();
				}
	        })
	        $("#btnAddOrUpdate").click(function (){
				var data = {};
				 var imageDetails =  $('.imageType').map(function (){
						return $(this).val();
					}).get();
				var dataForm = $("#formSubmit").serializeArray();
				$.each(dataForm, function (i, v){
					if (!(v.name == "imageDetails")) {
						data[""+v.name+""] = v.value;
					}
				})
				data["listImage"] = imageDetails;
				data["description"] = ckeditor.getData();

				if ($("#id").val() == ""){
					addNew(data);
				} else {
					updateNew(data);
				}
			})
			function addNew(data) {
				$.ajax({
					url: '${apiURL}',
					type: 'POST',
					contentType: 'application/json',
					dataType: 'text',
					data: JSON.stringify(data),
					success: function (result){
						alert("Thêm sản phẩm thành công");
						window.location.href = '${newURL}?type=edit&id=' + result
					},
					error: function (error){
						alert("Thêm sản phẩm thất bại");
						window.location.href = '${newURL}?type=add'
					}
	
				})
			}
	
			function updateNew(data) {
				$.ajax({
					url: '${apiURL}',
					type: 'PUT',
					contentType: 'application/json',
					dataType: 'text',
					data: JSON.stringify(data),
					success: function (result){
						alert("Cập nhật sản phẩm thành công");
						window.location.href = '${newURL}?type=edit&id=' +  $("#id").val()
					},
					error: function (error){
						alert("Cập nhật sản phẩm thất bại");
						window.location.href = '${newURL}?type=edit&id=' + $("#id").val()
					}
				})
			}
        </script>
</body>
</html>