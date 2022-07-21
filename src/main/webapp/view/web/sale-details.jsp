<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ecommerce.utils.PriceUtils"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết chương trình</title>
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
							class="fa fa-home"></i> Trang chủ</a> <span>Chi tiết chương
							trình</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section End -->


	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog-details-inner">
						<div class="blog-detail-title">
							<h2>${promotion.name}</h2>
							<p>
								<span>${promotion.dateBegin} - ${promotion.dateEnd}</span>
							</p>
							<h3 class="mt-3">GIẢM GIÁ ${promotion.value}%</h3>
						</div>
					</div>
					<div class="col-lg-12 order-1 order-lg-2">
						
						<div class="product-list">
							<div class="row">
								<c:forEach var="product" items="${listProduct}">
									<div class="col-lg-3 col-sm-6">
										<div class="product-item">
											<a href="<c:url value="/sanpham?id=${product.id}"/>">
												<div class="pi-pic">
													<img
														src="<c:url value="/template/img/products/${product.imageUrl}"/>"
														alt="">
													<c:if test="${product.sellPrice < product.originPrice}">
														<div class="sale pp-sale">SALE</div>
													</c:if>
													<div class="icon">
														<i class="icon_heart_alt"></i>
													</div>
												</div>
												<div class="pi-text">
													<div class="catagory-name">${product.groupProduct}</div>
													<a>
														<h5>${product.name}</h5>
													</a>
													<div class="product-price">
														<c:if test="${product.sellPrice < product.originPrice}">
															${PriceUtils.convert(product.sellPrice)} đ  
															<span>${PriceUtils.convert(product.originPrice)} đ</span>
														</c:if>
														<c:if test="${product.sellPrice == product.originPrice}">
															${PriceUtils.convert(product.sellPrice)} đ
													</c:if>

													</div>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->
</body>
</html>