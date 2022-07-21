<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="apiURL" value="/api/search"></c:url>
<c:url var="newURL" value="/admin/danh-sach-san-pham"></c:url>
<!-- Header -->
<header class="main-header " id="header">
	<nav class="navbar navbar-static-top navbar-expand-lg">
		<!-- search form -->
		<form action="<c:url value='/admin/search'/>" id="searchForm">
			<div class="search-form d-none d-lg-inline-block">
				<div class="input-group">
				<input type="hidden" id ="orderOrProduct" value = '<c:if test="${not empty listProduct}">product</c:if>'>
					<select id="filter" name="filter" style="border: none;">
						<option>--Bộ lọc--</option>
						<c:if test="${not empty product or not empty listProduct}">
							<option value="products">Sản phẩm</option>
						</c:if>
						<c:if test="${not empty listOrder or not empty order}">
							<option value="orders">Hóa đơn</option>
						</c:if>
					</select>
					<select id="filterAttr" name="filterAttr" style="border: none;">
						<option>--Lọc theo--</option>
						<c:if test="${not empty product or not empty listProduct}">
							<option value="id">ID</option>
							<option value="name">Tên</option>
						</c:if>
						<c:if test="${not empty listOrder or not empty order}">
							<option value="code">Mã đơn</option>
						</c:if>
					</select> 
					<input type="text" id="search-input"
						class="form-control" placeholder="Tìm kiếm" autofocus
						autocomplete="off" name = "key"/>
					<button type="button" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="mdi mdi-magnify"></i>
					</button>
				</div>
				<div id="search-results-container">
					<ul id="search-results"></ul>
				</div>
			</div>
		</form>
		<div class="navbar-right ">
			<ul class="nav navbar-nav">
				<!-- User Account -->
				<li class="dropdown user-menu">
					<button href="#" class="dropdown-toggle nav-link"
						data-toggle="dropdown">
						<span class="d-none d-lg-inline-block">${USERMODEL.firstName} ${USERMODEL.lastName}</span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right">
						<li class="dropdown-footer"><a href="<c:url value="/dang-nhap?action=logout"/>"> <i
								class="mdi mdi-logout"></i> Đăng xuất
						</a></li>
						<li class="dropdown-footer"><a href="<c:url value="/trang-chu"/>">Trang chủ
						</a></li>
						<li disabled="disabled" class="dropdown-footer"><a> ${USERMODEL.group}
						</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>


	<script type="text/javascript">
		$(function(){
			console.log($('#orderOrProduct').val());
			if ($('#orderOrProduct').val()=="product") {
				$('#filter').val('${product.filter}').attr('selected','selected');
				$('#filterAttr').val('${product.filterAttr}').attr('selected','selected');
				$('#search-input').val('${product.key}');
			} else{
				$('#filter').val('${order.filter}').attr('selected','selected');
				$('#filterAttr').val('${order.filterAttr}').attr('selected','selected');
				$('#search-input').val('${order.key}');
			}
		})
		$("#search-btn").click(function() {
			$('#searchForm').submit();
		})

	</script>

</header>
