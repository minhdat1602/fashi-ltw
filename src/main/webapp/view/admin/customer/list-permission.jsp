<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách người dùng</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
<form action="<c:url value='/admin/danh-sach-quyen'/>" method="get" id="submitForm">
	<input type="hidden" id="flag-index" value=".list-permission-page">
	<h3 class="ml-4 mt-3">Danh sách quyền</h3>
	
	<div class="product-show-option">
			<div class="row">
				<div class="col-lg-7 col-md-7">
					<div class="select-option">
						<select id="sorting" name="sorting" class="sorting">
							<option value="">--Chọn--</option>
							<c:forEach items="${listGroup}"  var="group">
								<option value="${group.code}">${group.name}</option>
							</c:forEach>
						</select> <label for="sorting" id="labelForSorting">Hiển thị theo: </label>
					</div>
				</div>
			</div>
		</div>
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Tên</th>
					<th scope="col">Hành động</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${listPermission}" var="permission">
					<tr>
						<th scope="row">${permission.id}</th>
						<td>${permission.name}</td>
						<td>${permission.action}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		<input type="hidden" name="type" id="type" value="">
		
</form>
	
<script type="text/javascript">
		
		$(function() {	
			$('#sorting').on('change', function (e) {
				$('#type').val("list");
				$('#submitForm').submit();
			});
			
			$('#sorting').val('${pageable.sorting}').attr('selected','selected');
			
		});
	</script>
</body>
</html>