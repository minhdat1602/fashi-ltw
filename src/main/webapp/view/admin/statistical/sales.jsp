<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.ecommerce.utils.PriceUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doanh số</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
	<input type="hidden" id="flag-index" value=".sales-page">
	<h3 class="ml-4 mt-3">Doanh số</h3>
	<form action="<c:url value='/admin/doanh-so'/>" id="submitForm" method="get">
		<div class="product-show-option">
			<div class="row">
				<div class="col-lg-7 col-md-7">
					<div class="select-option">
						<select id="sorting" class="sorting" name="filter">
							<option value="CURRENT_DATE">Trong ngày</option>
							<option value="WEEK(CURRENT_DATE())">Trong tuần</option>
							<option value="MONTH(CURRENT_DATE())">Tháng này</option>
							<option value="YEAR(CURRENT_DATE())">Năm này</option>
							<option value="ALLTIME">Tất cả</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="scrollDiv">
		<table class="table text-center">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Nhóm sản phẩm</th>
					<th scope="col">Lượt bán</th>
					<th scope="col">Tổng doanh số</th>
					<th scope="col">% Doanh số</th>
				</tr>
			</thead>
			<tbody class="scrollDiv">

				<c:forEach items="${listProductGroup}" var="group">
					<tr>
						<td style="font-weight: 700;">${group.name}</td>
						<td>${group.buyTimes}</td>
						<td>${PriceUtils.convert(group.sales)}đ</td>
						<td>${group.percentSales}%</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#sorting').val( "${filter}").attr('selected','selected');
			$('#sorting').on('change', function(e) {
				
				$('#sorting').val($('#sorting').val());
				$("#submitForm").submit();
			});
		});
	</script>
</body>
</html>