<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="apiURL" value="/api/nhom-san-pham"></c:url>
<c:url var="newURL" value="/admin/danh-sach-nhom-san-pham"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm nhóm sản phẩm</title>
</head>
<body>
	<input type="hidden" id="flag-index" value=".list-product-group-page">
	<h3 class="ml-4 mt-3">
		<c:if test="${group == null}">
			Thêm nhóm sản phẩm
		</c:if>
		<c:if test="${group != null}">
			Chỉnh sửa nhóm sản phẩm
		</c:if>
	</h3>
	<form id="formSubmit" action="" class="p-5">

		<div class="form-group">
			<label for="exampleFormControlInput1">Mã sản phẩm</label>
			<c:if test="${group != null}">
				<input type="text" class="form-control" id="code" name="code"
					placeholder="Mã sản phẩm" value="${group.code}">
			</c:if>
			<c:if test="${group == null}">
				<input type="text" class="form-control" id="code" name="code"
					placeholder="Mã nhóm sản phẩm" value="">
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Tên nhóm sản phẩm</label>
			<c:if test="${group != null}">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="Tên sản phẩm" value="${group.name}">
			</c:if>
			<c:if test="${group == null}">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="Tên nhóm sản phẩm" value="">
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleFormControlSelect1">Bậc</label> <select
				class="form-control" id="level" name ="level">
				<option>Chọn--</option>
				<c:if test="${empty group}">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</c:if>
				<c:if test="${not empty group}">
						<c:if test="${group.level == 1}">
							<option selected="selected" value="1">1</option>
						</c:if>
						<c:if test="${group.level == 2}">
							<option selected="selected" value="2">2</option>
						</c:if>
						<c:if test="${group.level == 3}">
							<option selected="selected" value="3">3</option>
						</c:if>
				</c:if>
			</select>
		</div>
		<div class="form-group">
			<label for="exampleFormControlSelect1">Nhóm sản phẩm cha</label> <select
				class="form-control" id="parentId" name ="parentId">
				<option>Chọn--</option>
				<c:if test="${empty group}">
					<c:forEach items="${listProductGroup}" var="gr">
						<option value="${gr.id}">${gr.code}</option>
					</c:forEach>
				</c:if>
				<c:if test="${not empty group}">
					<c:forEach items="${listProductGroup}" var="gr">
						<c:if test="${group.parentId == gr.id}">
							<option selected="selected" value="${gr.id}">${gr.code}</option>
						</c:if>
						<c:if test="${group.parentId != gr.id}">
							<option value="${gr.id}">${gr.code}</option>
						</c:if>

					</c:forEach>
				</c:if>
			</select>
		</div>
		
		<input type="hidden" name="id" id="id" value="${group.id}"/>
	</form>
	<a style="color: white; text-decoration: none; width: 20%;"
		type="button" class="btn btn-info ml-5 mb-3" id='btnAddOrUpdate'>
		<c:if test="${empty group}">
			Thêm nhóm sản phẩm
		</c:if> <c:if test="${not empty group}">
			Cập nhật nhóm sản phẩm
		</c:if>
	</a>
	<script type="text/javascript">
		$("#btnAddOrUpdate").click(function() {
			var data = {};
			var dataForm = $("#formSubmit").serializeArray();
			$.each(dataForm, function(i, v) {
				if (!(v.name == "imageDetails")) {
					data["" + v.name + ""] = v.value;
				}
			})
			if ($("#id").val() == "") {
				addNew(data);
			} else {
				updateNew(data);
			}
		})
		function addNew(data) {
			$.ajax({
				url : '${apiURL}',
				type : 'POST',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(data),
				success : function(result) {
					alert("Thêm nhóm sản phẩm thành công");
					window.location.href = '${newURL}?type=edit&id=' + result
				},
				error : function(error) {
					alert("Thêm sản phẩm thất bại");
					window.location.href = '${newURL}?type=add'
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
					alert("Cập nhật nhóm sản phẩm thành công");
					window.location.href = '${newURL}?type=edit&id='
							+ $("#id").val()
				},
				error : function(error) {
					alert("Cập nhật nhóm sản phẩm thất bại");
					window.location.href = '${newURL}?type=edit&id='
							+ $("#id").val()
				}
			})
		}
	</script>
</body>
</html>