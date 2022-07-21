<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách góp ý</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
	<input type="hidden" id="flag-index" value=".feedback-page">
	<h3 class="ml-4 mt-3 mb-5">Danh sách góp ý</h3>
	
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Vấn đề</th>
					<th scope="col">Góp ý</th>
					<th scope="col">ID Người dùng</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">
				<c:forEach items="${listFeedback}" var="feedback">
					<tr>
						<th scope="row">${feedback.id}</th>
						<td>${feedback.problem}</td>
						<td>${feedback.content}</td>
						<td>${feedback.userId}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

</body>
</html>