<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhóm sản phẩm</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
	<form action="<c:url value='/admin/danh-sach-nhom-san-pham'/>" method="get"
		id="submitForm">
		<input type="hidden" id="flag-index" value=".list-product-group-page">
		<div class="">
			<table class="table text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Cập nhật</th>
						<th scope="col">Mã</th>
						<th scope="col">Tên nhóm sản phẩm</th>
						<th scope="col">Cấp</th>
						<th scope="col">ID nhóm sản phẩm (cha)</th>
					</tr>
				</thead>
				<tbody class="scrollDiv">
					<c:forEach items="${listProductGroup}" var="group">
						<tr>
							<td>${group.id}</td>
							<td><a
								href='<c:url value ="/admin/danh-sach-nhom-san-pham?type=edit&id=${group.id}"/>'><i
									class="fa fa-edit"></i></a></i></td>
							<td>${group.code}</td>
							<td>${group.name}</td>
							<td>${group.level}</td>
							<td>${group.parentId}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="btn-control ml-2 mb-2">
			<a style="color: white; text-decoration: none;"
				href="<c:url value ="/admin/danh-sach-nhom-san-pham?type=add"/>"
				type="button" class="btn btn-info"> Thêm nhóm sản phẩm <i
				class="fa fa-plus ml-2"></i>
			</a>
		</div>
	</form>

	<script type="text/javascript">
		
	</script>
</body>
</html>