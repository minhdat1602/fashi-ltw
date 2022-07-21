<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="apiURL" value="/api/doi-quyen"></c:url>
<c:url var="newURL" value="/admin/thay-doi-quyen"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi quyền</title>
</head>
<body>

	<input type="hidden" id="flag-index" value=".list-product-page">
	<h3 class="ml-4 mt-3">Thay đổi quyền</h3>
	<form action="" id="submitForm">
		<div class="wrap-import" style="padding: 50px;">
			<div class="form-group">
				<label for="exampleFormControlInput1">ID người dùng</label>
				 <input style="user-select:none" type="hidden" class="form-control" name="id" id="id" 
					placeholder="Mã sản phẩm" value="${user.id}">
					<input style="user-select:none" type="text" class="form-control"
					placeholder="Mã sản phẩm" value="${user.id}" disabled="disabled">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">Tên người dùng</label> <input
					type="text" class="form-control"
					placeholder="Tên sản phẩm"
					value="${user.firstName} ${user.lastName}" disabled="disabled">
			</div>

			<div class="form-group">
				<label for="exampleFormControlSelect1">Nhóm người dùng</label> <select
					class="form-control" id="groupId" name="groupId">
					<option>Chọn--</option>
					<c:forEach items="${listProductGroup}" var="group">
						<c:if test="${user.groupId == group.id}">
							<option selected="selected" value="${group.id}">${group.code}</option>
						</c:if>
						<c:if test="${user.groupId != group.id}">
							<option value="${group.id}">${group.code}</option>
						</c:if>
					</c:forEach>

				</select>
			</div>
			<ul>
				<h2>Danh sách các quyền hiện có</h2>
				<c:forEach items="${listPermission}" var="permission">
					<li style="font-size: 20px;">${permission.action}</li>
				</c:forEach>
			</ul>
		</div>
	</form>
	<button id="complete" style="color: white; text-decoration: none; width: 20%;" type="button"
		class="btn btn-info ml-5 mb-3"> Hoàn tất</button>

	<script type="text/javascript">
		$("#complete").click(function() {
			var data = {};
			var dataForm = $("#submitForm").serializeArray();
			$.each(dataForm, function(i, v) {
				data["" + v.name + ""] = v.value;
			})
			updateNew(data);

		})
		function updateNew(data) {
			$.ajax({
				url : '${apiURL}',
				type : 'PUT',
				contentType : 'application/json',
				dataType : 'text',
				data : JSON.stringify(data),
				success : function(result) {
					alert"Cập nhật thành công");
					window.location.href = '${newURL}?id='
							+ $('#id').val()
				},
				error : function(error) {
					alert"Cập nhật thất bại");
					window.location.href = '${newURL}?id='
							+ $('#id').val()

				}
			})
		}
	</script>
</body>
</html>