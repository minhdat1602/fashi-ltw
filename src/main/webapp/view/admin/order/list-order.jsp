<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@page import="com.ecommerce.utils.PriceUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách đơn hàng</title>
</head>
<body>
	<form action="<c:url value='/admin/danh-sach-don-hang'/>" method="get"
		id="submitForm">
		<input type="hidden" id="flag-index" value=".list-order-page">
		<h3 class="ml-4 mt-3">Danh sách đơn hàng</h3>
		<div class="product-show-option">
			<div class="row">
				<div class="col-lg-7 col-md-7">
					<div class="select-option">
						<select id="sorting" name="sorting" class="sorting">
							<option value="">--Chọn--</option>
							<option value="date_sellasc">Ngày mua (sớm nhất)</option>
							<option value="date_selldesc">Ngày mua (muộn nhất)</option>
						</select> <label for="sorting" id="labelForSorting">Sắp xếp theo: </label>
						<select class="p-show" name="maxPageItem" id="maxPageItem"
							value="${pageable.maxPageItem}">
							<option value="">--Chọn--</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
						</select> <label for="p-show" id="labelForTotalItem">Hiển thị:</label>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fuild mt-3"
			style="height: 600px; overflow-y: scroll; overflow-x: hidden;">
			<div class="row">
				<table class="table text-center">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Mã đơn</th>
							<th scope="col">Tổng giá bán</th>
							<th scope="col">Tổng giảm giá</th>
							<th scope="col">Thành tiền</th>
							<th scope="col">Ngày đặt</th>
							<th scope="col">Trạng thái</th>
							<th scope="col">Chi tiết</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listOrder}" var="order">
							<tr>
								<th scope="row">${order.code}</th>
								<td>${order.totalSellPrice}</td>
								<td>${PriceUtils.convert(order.totalDiscount)}đ</td>
								<td>${PriceUtils.convert(order.totalMoney)}đ</td>
								<td>${order.dateSell}</td>
								<td>${order.status}</td>
								<td><a class="btn" style="text-decoration: none;"
									href="<c:url value='/admin/danh-sach-don-hang?id=${order.id}'/>">Xem</a></td>
							</tr>

						</c:forEach>
						<input type="hidden" name="page" id="page" value="${pageable.page}"> 
						<input type="hidden" name="sorting" id="sorting" value="${pageable.sorting}">
						<input type="hidden" name="sortBy" id="sortBy" value="${pageable.sortBy}"> 	
					</tbody>
				</table>
			</div>
		</div>
		<div style="margin-left: 5px;" class="container">
			<nav aria-label="Page navigation">
				<ul class="pagination" id="pagination"></ul>
			</nav>
		</div>
	</form>
	<script type="text/javascript">
		
		$(function() {	
			$('#sorting').on('change', function (e) {
			    var sorting = $('#sorting').val();
			    $('#sorting').val("date_sell");
			    if (sorting=="date_sellasc") {
			    	$('#sortBy').val("asc");
				} else {
					$('#sortBy').val("desc");
				}
			    var totalPages = ${pageable.totalPage};
				var startPage = ${pageable.page};
				var maxPageItem = ${pageable.maxPageItem};
				$('#maxPageItem').val(maxPageItem);
				$('#page').val(startPage);
				$('#submitForm').submit();
			});
			$('#maxPageItem').on('change', function (e) {
			    var sorting = $('#sorting').val();
			    $('#sorting').val("date_sell");
			    if (sorting=="date_sellasc") {
			    	$('#sortBy').val("asc");
				} else {
					$('#sortBy').val("desc");
				}
			    var totalPages = ${pageable.totalPage};
				var startPage = ${pageable.page};
				var maxPageItem = $('#maxPageItem').val();
				$('#maxPageItem').val(maxPageItem);
				$('#page').val(startPage);
				$('#submitForm').submit();
			});
			$('#maxPageItem').val(${pageable.maxPageItem}).attr('selected','selected');
			$('#sorting').val('${pageable.sorting}${pageable.sortBy}').attr('selected','selected');
			var sorting = "${pageable.sorting}";
			var sortBy = "${pageable.sortBy}";
			var totalPages = ${pageable.totalPage};
			var startPage = ${pageable.page};
			var maxPageItem = ${pageable.maxPageItem};
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : startPage,
				onPageClick : function(event, page) {
					if (startPage != page) {
						$('#maxPageItem').val(maxPageItem);
						$('#page').val(page);
						$('#sorting').val(sorting);
						$('#sortBy').val(sortBy);
						$('#submitForm').submit();
					}
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
	</script>
</body>
</html>