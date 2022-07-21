<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><decorator:title></decorator:title></title>
<link
	href="<c:url value="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"/>"
	rel="stylesheet" />
<link
	href="<c:url value="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css"/>"
	rel="stylesheet" />

<!-- PLUGINS CSS STYLE -->
<link
	href="<c:url value="/template/admin/assets/plugins/toaster/toastr.min.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/template/admin/assets/plugins/nprogress/nprogress.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/template/admin/assets/plugins/flag-icons/css/flag-icon.min.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/template/admin/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/template/admin/assets/plugins/ladda/ladda.min.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/template/admin/assets/plugins/select2/css/select2.min.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/template/admin/assets/plugins/daterangepicker/daterangepicker.css"/>"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/template/admin/assets/css/bootstrap.min.css"/>">
<!-- SLEEK CSS -->
<link id="sleek-css" rel="stylesheet"
	href="<c:url value="/template/admin/assets/css/sleek.css"/>" />
<link id="sleek-css" rel="stylesheet"
	href="<c:url value="/template/admin/assets/css/fashi.css"/>" />
<link id="sleek-css" rel="stylesheet"
	href="<c:url value="/template/admin/fontawesome/css/font-awesome.min.css"/>" />

<!-- FAVICON -->
<link href="<c:url value="/template/admin/assets/img/favicon.png"/>"
	rel="shortcut icon" />
<script
	src="<c:url value="/template/admin/assets/plugins/jquery/jquery.min.js" />"></script>
<script
	src="<c:url value="/template/admin/assets/plugins/nprogress/nprogress.js" />"></script>
	<script src="<c:url value='/ckeditor/ckeditor.js'/>" type="text/javascript"></script>
</head>
<body class="sidebar-dark header-light"
	id="body">

	<script>
		NProgress.configure({
			showSpinner : false
		});
		NProgress.start();
	</script>
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">

		<%@ include file="/common/admin/menu.jsp"%>
		<div class="page-wrapper">
			<%@ include file="/common/admin/header.jsp"%>
			<div class="content-wrapper">
				<decorator:body></decorator:body>
			</div>
			<%@ include file="/common/admin/footer.jsp"%>
		</div>
	</div>
	<c:url value=" 
	" />
	<script
		src="<c:url value="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCn8TFXGg17HAUcNpkwtxxyT9Io9B_NcM" />"
		defer></script>

	<script
		src="<c:url value="/template/admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/toaster/toastr.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/slimscrollbar/jquery.slimscroll.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/charts/Chart.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/ladda/spin.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/ladda/ladda.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/jquery-mask-input/jquery.mask.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/select2/js/select2.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/jvectormap/jquery-jvectormap-world-mill.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/daterangepicker/moment.min.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/daterangepicker/daterangepicker.js" />"></script>
	<script
		src="<c:url value="/template/admin/assets/plugins/jekyll-search.min.js" />"></script>
	<script src="<c:url value="/template/admin/assets/js/sleek.js" />"></script>
	<script src="<c:url value="/template/admin/assets/js/fashi.js" />"></script>
	<script src="<c:url value="/template/admin/assets/js/chart.js" />"></script>
	<script src="<c:url value="/template/admin/assets/js/date-range.js" />"></script>
	<script src="<c:url value="/template/admin/assets/js/map.js" />"></script>
	<script src="<c:url value="/template/admin/assets/js/custom.js" />"></script>
	<script
		src="<c:url value="/template/pagination/jquery.twbsPagination.js" />"></script>
</body>
</html>