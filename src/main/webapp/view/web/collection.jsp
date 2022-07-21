<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Các bộ sưu tập</title>
</head>
<body>
<input id="flag-index" type="hidden" value=".collection-page">
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href = "<c:url value = "/trang-chu"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Các bộ sưu tập</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Blog Section Begin -->
<section class="blog-section spad">
    <div class="container">
        <div class="row">
            <h3 class="d-block w-100 mb-3 text-center">Các bộ sưu tập nổi bật</h3>
            <div class="col-lg-12 order-1 order-lg-2">
                <div class="row">
						<c:forEach items="${listCollection}" var="collection">
							<a href="<c:url value = "/collection?id=${collection.id}"/>">
								<div class="col-lg-6 col-sm-6">
									<div class="blog-item">
										<div class="bi-pic">
											<img
												src="${collection.imageUrl}"
												alt="">
										</div>
										<div class="bi-text">
											<a href="<c:url value = "/collection?id=${collection.id}"/>">
												<h4>${collection.name}</h4>
											</a>
											<p class="mt-2">${collection.description}</p>
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->
</body>
</html>