<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lượt mua hàng</title>
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
</head>
<body>
	<form action="<c:url value='/admin/luot-mua-hang'/>" method="get"
		id="submitForm">
		<input type="hidden" id="flag-index" value=".buy-time-page">
		<h3 class="ml-4 mt-3">Lượt mua hàng</h3>
		<div class="product-show-option">
			<div class="row">
				<div class="col-lg-7 col-md-7">
					<div class="select-option">
						<select id="sorting" name="sorting" class="sorting">
							<option value="">--Chọn--</option>
							<option value="idasc">ID (tăng dần)</option>
							<option value="iddesc">ID (giảm dần)</option>

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

		<div class="scrollDiv">
			<table class="table text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Tên</th>
						<th scope="col">Hình ảnh</th>
						<th scope="col">Phân loại</th>
						<th scope="col">Lượt mua</th>
						<th scope="col">Xem sản phẩm</th>
					</tr>
				</thead>
				<tbody class="scrollDiv">
					<c:forEach items="${listProduct}" var="product">
						<tr>

							<td style="line-height: 60px;" scope="row">${product.id}</td>
							<td style="line-height: 60px;" scope="row">${product.name}</td>	
							<td><img style="width: 60px; height: 60px;" alt=""
								src="<c:url value="${product.imageUrl}"/>"></td>
							<td style="line-height: 60px;">${product.groupProduct}</td>
							<td style="line-height: 60px;">${product.buyTimes}</td>
							<td style="line-height: 60px;">
								<a href="<c:url value="/admin/danh-sach-san-pham?type=edit&id=${product.id}" />">Xem</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
 		<input type="hidden" name="page" id="page" value="${pageable.page}">
		<input type="hidden" name="sorting" id="sorting" value="${pageable.sorting}">
		<input type="hidden" name="sortBy" id="sortBy" value="${pageable.sortBy}">
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
			    $('#sorting').val("id");
			    if (sorting=="idasc") {
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
			    $('#sorting').val("id");
			    if (sorting=="idasc") {
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