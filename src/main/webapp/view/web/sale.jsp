<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Các chương trình giảm giá</title>
</head>
<body>
	<input id="flag-index" type="hidden" value=".sale-page">
	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="<c:url value = "/view/web/index.jsp"/>"><i
							class="fa fa-home"></i> Trang chủ</a> <span>Chương trình giảm
							giá</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->
	<section class="blog-section spad">
		<div class="container">
			<div class="row">
				<h3 class="d-block w-100 mb-3 text-center">Các chương trình
					khuyến mãi đang diễn ra</h3>
				<div class="col-lg-12 order-1 order-lg-2">
					<div class="row">
						<c:forEach items="${listPromotions}" var="promotion">
							<div class="col-lg-6 col-sm-6">
								<a href="<c:url value="/sale?id=${promotion.id}"/>">

									<div class="blog-item">
										<div class="bi-pic">
											<img
												src="<c:url value="/template/web/img/sale/${promotion.imageUrl}"/>"
												alt="">
										</div>
										<div class="bi-text">

											<h4>${promotion.name}</h4>

											<p>
												<span>${promotion.dateBegin} - ${promotion.dateEnd}</span>
											</p>
											<h3 class="mt-3">GIẢM GIÁ ${promotion.value}%</h3>
											<p class="mt-2">${promotion.descriptions}</p>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

</body>
</html>