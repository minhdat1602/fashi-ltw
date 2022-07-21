<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.ecommerce.utils.PriceUtils" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
</head>
<body>
<input id="flag-index" type="hidden" value=".index-page">
<!-- Hero Section Begin -->
<section class="hero-section">
    <div class="hero-items owl-carousel">
        <c:forEach items="${listPromotion}" var="promotion">
            <div class="single-hero-items set-bg"
                 data-setbg="<c:url value="/template/img/sale/${promotion.imageUrl}"/>">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>${promotion.header}</span>
                            <h1 class="text-left">${promotion.name}</h1>
                            <p>${promotion.descriptions}</p>
                            <a href="<c:url value="/sale?${promotion.id}"/> " class="primary-btn">Mua sắm
                                ngay</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>
                            Sale <span>${promotion.value}%</span>
                        </h2>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
<!-- Hero Section End -->

<!-- Banner Section Begin -->
<div class="banner-section spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4">
                <div class="single-banner">
                    <img src="<c:url value="/template/img/banner-1.jpg"/>" alt="">
                    <div class="inner-text">
                        <h4>Nam</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="single-banner">
                    <img src="<c:url value="/template/img/banner-2.jpg"/>" alt="">
                    <div class="inner-text">
                        <h4>Nữ</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="single-banner">
                    <img src="<c:url value="/template/img/banner-3.jpg"/>" alt="">
                    <div class="inner-text">
                        <h4>Trẻ Em</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->

<%--<!-- Women Banner Section Begin -->
<section class="women-banner spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                <div class="product-large set-bg"
                     data-setbg="<c:url value="/template/img/products/women-large.jpg"/>">
                    <h2>Thời Trang Nữ</h2>
                    <a href="<c:url value="/cuahang?groupNameStr=Nữ"/>">Xem Ngay</a>
                </div>
            </div>
            <div class="col-lg-8 offset-lg-1">
                &lt;%&ndash;<div class="filter-control">
                    <ul>
                        <c:forEach items="${groupWomen}" var="wo">
                            <a href="<c:url value="/trang-chu?men=${men}&&women=${wo.name}"/> "
                               style="padding-right: 30px;">
                                <li  <c:if test="${women eq wo.name}">
                                    class = "active" </c:if>>
                                        ${wo.name}
                                </li>
                            </a>
                        </c:forEach>
                    </ul>
                </div>&ndash;%&gt;
                <div class="product-slider owl-carousel" style="padding-top: 130px;">
                    <c:forEach items="${listWomen}" var="wo">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="<c:url value="/sanpham?id=${wo.id}"/>">
                                    <img src="${wo.imageUrl}" alt="product picture">
                                </a>
                                <c:if test="${wo.originPrice - wo.sellPrice > 0}">
                                    <div class="sale">SALE</div>
                                </c:if>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${aonu.groupProduct}</div>
                                <a>
                                    <h5>${wo.name}</h5>
                                </a>
                                <div class="product-price">
                                    <c:if test="${wo.sellPrice < wo.originPrice}">
                                        ${PriceUtils.convert(wo.sellPrice)} đ<span>${PriceUtils.convert(wo.originPrice)}đ</span>
                                    </c:if>
                                    <c:if test="${wo.sellPrice >= wo.originPrice}">
                                        ${PriceUtils.convert(wo.sellPrice)} đ
                                    </c:if>
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
<!-- Women Banner Section End -->--%>

<!-- Women Banner Section Begin -->
<section class="women-banner spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                <div class="product-large set-bg"
                     data-setbg="<c:url value="/template/img/products/women-large.jpg"/> ">
                    <h2>Thời Trang Nữ</h2>
                    <a href="<c:url value="/cuahang?groupNameStr=Nữ"/>">Xem Ngay</a>
                </div>
            </div>
            <div class="col-lg-8 offset-lg-1">
                <div class="filter-control">
                    <ul>
                        <li class="active"></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
                <div class="product-slider owl-carousel">
                    <c:forEach items="${listWomen}" var="wo">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="<c:url value="/sanpham?id=${wo.id}"/>">
                                    <img src="${wo.imageUrl}" alt="product picture">
                                </a>
                                <c:if test="${wo.originPrice - wo.sellPrice > 0}">
                                    <div class="sale">SALE</div>
                                </c:if>
                                    <%--<div class="icon">
                                        <i class="icon_heart_alt"></i>
                                    </div>
                                    <ul>
                                        <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                        <li class="quick-view"><a href="#">+ Quick View</a></li>
                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                    </ul>--%>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${wo.groupProduct}</div>
                                <a>
                                    <h5>${wo.name}</h5>
                                </a>
                                <div class="product-price">
                                    <c:if test="${wo.sellPrice < wo.originPrice}">
                                        ${PriceUtils.convert(wo.sellPrice)} đ<span>${PriceUtils.convert(wo.originPrice)}đ</span>
                                    </c:if>
                                    <c:if test="${wo.sellPrice >= wo.originPrice}">
                                        ${PriceUtils.convert(wo.sellPrice)} đ
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Women Banner Section End -->


<!-- Man Banner Section Begin -->
<section class="man-banner spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="filter-control">
                    <ul>
                        <li class="active"></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
                <div class="product-slider owl-carousel">
                    <c:forEach begin="0" end="5" items="${listMen}" var="men">
                        <div class="product-item">
                            <div class="pi-pic">
                                <a href="<c:url value="/sanpham?id=${men.id}"/>" style="padding-left: 20px;">
                                    <img src="${men.imageUrl}" alt="">
                                </a>
                                <c:if test="${men.originPrice - men.sellPrice > 0}">
                                    <div class="sale">SALE</div>
                                </c:if>
                                    <%--<div class="icon">
                                        <i class="icon_heart_alt"></i>
                                    </div>
                                    <ul>
                                        <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                        <li class="quick-view"><a href="#">+ Quick View</a></li>
                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                    </ul>--%>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${men.groupProduct}</div>
                                <a>
                                    <h5>${men.name}</h5>
                                </a>
                                <div class="product-price">
                                    <c:if test="${men.sellPrice < men.originPrice}">
                                        ${PriceUtils.convert(men.sellPrice)}
                                        <span>${PriceUtils.convert(men.originPrice)}</span>
                                    </c:if>
                                    <c:if test="${men.sellPrice >= men.originPrice}">
                                        ${PriceUtils.convert(men.sellPrice)}
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1">
                <div class="product-large set-bg m-large"
                     data-setbg="<c:url value="/template/img/products/man-large.jpg"/> ">
                    <h2>Thời Trang Nam</h2>
                    <a href="<c:url value="/cuahang?groupNameStr=Nam"/>">Xem Ngay</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Man Banner Section End -->

<%--
<!-- Man Banner Section Begin -->
<section class="man-banner spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                &lt;%&ndash;<div class="filter-control">
                    <ul>
                        <c:forEach items="${groupMen}" var="m">
                            <a href="<c:url value="/trang-chu?men=${m.name}&&women=${women}"/> "
                               style="padding-left: 30px;">
                                <li id="${m.id}" <c:if test="${(m.name eq 'Áo nam' and man == null) or m.name eq man }">
                                    class = "active" </c:if>>
                                        ${m.name}
                                </li>
                            </a>
                        </c:forEach>
                    </ul>
                </div>&ndash;%&gt;

                <div class="product-slider owl-carousel" style="padding-top: 90px">
                    <c:forEach begin="0" end="5" items="${listMen}" var="men">
                        <div class="product-item">
                            <a href="<c:url value="/sanpham?id=${men.id}"/>"
                               style="padding-left: 20px;">
                                <div class="pi-pic">
                                    <img
                                            src="${men.imageUrl}"
                                            alt="product picture">

                                    <c:if test="${men.originPrice - men.sellPrice > 0}">
                                        <div class="sale">SALE</div>
                                    </c:if>

                                    <div class="icon">
                                        <i class="icon_heart_alt"></i>
                                    </div>
                                </div>
                                <div class="pi-text">
                                    <div class="catagory-name">${men.groupProduct}</div>
                                    <a>
                                        <h5>${men.name}</h5>
                                    </a>
                                    <div class="product-price">
                                        <c:if test="${men.sellPrice < men.originPrice}">
                                            ${PriceUtils.convert(men.sellPrice)}
                                            <span>${PriceUtils.convert(men.originPrice)}</span>
                                        </c:if>
                                        <c:if test="${men.sellPrice >= men.originPrice}">
                                            ${PriceUtils.convert(men.sellPrice)}
                                        </c:if>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>


            </div>
            <div class="col-lg-3 offset-lg-1">
                <div class="product-large set-bg m-large"
                     data-setbg="<c:url value="/template/img/products/man-large.jpg"/>">
                    <h2>Thời Trang Nam</h2>
                    <a href="<c:url value="/cuahang?groupNameStr=Nam"/>">Xem Ngay</a>
                </div>
            </div>
        </div>
    </div>
</section>--%>
<!-- Man Banner Section End -->


<!-- Instagram Section Begin -->
<div class="instagram-photo">

    <div class="insta-item set-bg"
         data-setbg="<c:url value="/template/img/insta-1.jpg"/>">

        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5>
                <a href="#">Bộ sưu tập</a>
            </h5>
        </div>
    </div>
    <div class="insta-item set-bg"
         data-setbg="<c:url value="/template/img/insta-2.jpg"/>">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5>
                <a href="#">Bộ sưu tập</a>
            </h5>
        </div>
    </div>
    <div class="insta-item set-bg"
         data-setbg="<c:url value="/template/img/insta-3.jpg"/>">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5>
                <a href="#">Bộ sưu tập</a>
            </h5>
        </div>
    </div>
    <div class="insta-item set-bg"
         data-setbg="<c:url value="/template/img/insta-4.jpg"/>">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5>
                <a href="#">Bộ sưu tập</a>
            </h5>
        </div>
    </div>
    <div class="insta-item set-bg"
         data-setbg="<c:url value="/template/img/insta-5.jpg"/>">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5>
                <a href="#">Bộ sưu tập</a>
            </h5>
        </div>
    </div>
    <div class="insta-item set-bg"
         data-setbg="<c:url value="/template/img/insta-6.jpg"/>">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5>
                <a href="#">Bộ sưu tập</a>
            </h5>
        </div>
    </div>
</div>
<!-- Instagram Section End -->
</body>

</html>