<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.ecommerce.utils.PriceUtils" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cửa hàng</title>
    <style>
    </style>
</head>
<body>
<input id="flag-index" type="hidden" value=".shop-page">
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i
                            class="fa fa-home"></i> Trang chủ</a> <span>Cửa hàng</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Product Shop Section Begin -->
<form action="<c:url value="/cuahang"/>" method="get"
      id="submitForm">
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <%--<div class="filter-widget">
                        <h4 class="fw-title">Dành Cho</h4>
                        <ul class="filter-catagories">
                            <c:forEach items="${filterByCustomers}" var="group">
                                <li><a href="#">${group.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>--%>
                    <div class="filter-widget">
                        <h4 class="fw-title">Dành cho</h4>
                        <div class="fw-brand-check">
                            <c:forEach items="${filterByCustomers}" var="group">
                                <div class="bc-item">
                                    <label for="gr-${group.id}">
                                            ${group.name}
                                        <input
                                        <c:if test="${fn:contains(groupNameStr, group.name)}">
                                                checked='checked'
                                        </c:if>
                                                class="group-name" value="${group.name}" name="groupName"
                                                type="checkbox" id="gr-${group.id}">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">Thương hiệu</h4>
                        <div class="fw-brand-check">
                            <c:forEach items="${filterByBrands}" var="brand">
                                <div class="bc-item">
                                    <label for="bc-${brand.id}">
                                            ${brand.name}
                                        <input
                                        <c:if test="${fn:contains(brandNameStr, brand.name)}">
                                                checked='checked'
                                        </c:if>
                                                class="brand-name" name="brandName" value="${brand.name}"
                                                type="checkbox" id="bc-${brand.id}">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <%--<div class="filter-widget">
                        <h4 class="fw-title">Giá</h4>
                        <div class="filter-range-wrap">
                            <div class="range-slider">
                                <div class="price-input">
                                    <input name="priceMin" value="${priceMin}" type="text" id="minamount">
                                    <input name="priceMax" value="${priceMax}" type="text" id="maxamount">
                                </div>
                            </div>
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                 data-min="33" data-max="98">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                        </div>
                        <a href="#" class="filter-btn">Lọc</a>
                    </div>--%>
                    <div class="filter-widget">
                        <h4 class="fw-title">Giá</h4>
                        <div class="filter-range-wrap">
                            <div class="range-slider">
                                <div class="price-input">
                                    <div class="input-group mb-3">
                                        <input id="priceMin" name="priceMin" value="${priceMin}" type="text"
                                               class="form-control"
                                               placeholder="Giá từ">
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="basic-addon2">đ</span>
                                        </div>
                                    </div>
                                    <div class="input-group mb-3">
                                        <input id="priceMax" name="priceMax" value="${priceMax}" type="text"
                                               class="form-control"
                                               placeholder="Đến">
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="basic-addon1">đ</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <a id="filter-btn" style="cursor: pointer" class="filter-btn">Lọc</a>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">Tags</h4>
                        <div class="fw-tags">
                            <c:forEach items="${filterByTags}" var="t">
                                <c:choose>
                                    <c:when test="${t.name eq tag && level == 2}">
                                        <a class="tag-btn"
                                           tag-data="${t.name}" style="cursor: pointer;
                                            background-color: #0d3f2f; color: #ffffff;">${t.name}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="tag-btn"
                                           tag-data="${t.name}" style="cursor: pointer;">${t.name}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <input id="tag-value" type="hidden" name="tag" value="${tag}">
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 col-md-7">
                                <div class="select-option">
                                    <select id="sorting" name="sorting" class="sorting">
                                        <option
                                                <c:if test="${sorting eq 'normal'}">selected="selected"</c:if>
                                                value="normal">Bình thường
                                        </option>
                                        <option
                                                <c:if test="${sorting eq 'isNew'}">selected="selected"</c:if>
                                                value="isNew">Sản phẩm mới
                                        </option>
                                        <
                                        <option
                                                <c:if test="${sorting eq 'isHot'}">selected="selected"</c:if>
                                                value="isHot">Sản phẩm hot
                                        </option>
                                    </select>
                                    <%--<select class="p-show">
                                        <option value="">Show:</option>
                                    </select>--%>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-5 text-right">
                                <c:if test="${pageable.totalItem == 0}">
                                    <p>Không có sản phẩm nào</p>
                                </c:if>
                                <c:if test="${pageable.totalItem >= ((pageable.page)*pageable.maxPageItem)}">
                                    <p>Hiển thị ${(pageable.page - 1)*pageable.maxPageItem + 1}
                                        - ${(pageable.page)*pageable.maxPageItem}
                                        của ${pageable.totalItem} Sản phẩm</p>
                                </c:if>
                                <c:if test="${(((pageable.page)*pageable.maxPageItem) > pageable.totalItem)
                                && pageable.totalItem != 0}">
                                    <p>Hiển thị ${(pageable.page - 1)*pageable.maxPageItem+1}
                                        - ${pageable.totalItem}
                                        của ${pageable.totalItem} Sản phẩm</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row">
                            <c:forEach items="${listProduct}" var="product">
                                <div class="col-lg-4 col-sm-6">
                                    <div class="product-item">
                                        <div class="pi-pic">
                                            <a href="<c:url value="/sanpham?id=${product.id}"/> ">
                                                <img src="${product.imageUrl}" alt="product picture"/>
                                            </a>
                                            <c:if test="${product.originPrice > product.sellPrice}">
                                                <div class="sale pp-sale">
                                                    Sale
                                                </div>
                                            </c:if>
                                                <%--HINH TRAI TIM (SP YEU THICH)--%>
                                                <%--<div class="icon">
                                                    <i class="icon_heart_alt"></i>
                                                </div>--%>

                                                <%--<ul>
                                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                                    <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                                </ul>--%>
                                        </div>
                                        <div class="pi-text">
                                            <div class="catagory-name">${product.groupProduct}</div>
                                            <a href="<c:url value="/sanpham?id=${product.id}"/> ">
                                                <h5>${product.name}</h5>
                                            </a>
                                            <div class="product-price">
                                                <c:if test="${product.originPrice > product.sellPrice}">
                                                    ${PriceUtils.convert(product.sellPrice)} đ
                                                    <span>${PriceUtils.convert(product.originPrice)} đ</span>
                                                </c:if>
                                                <c:if test="${product.originPrice <= product.sellPrice}">
                                                    ${PriceUtils.convert(product.originPrice)} đ
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <input type="hidden" name="page" id="page" value="${pageable.page}">
                    <input type="hidden" name="maxPageItem" id="maxPageItem" value="${pageable.maxPageItem}">
                    <input type="hidden" name="groupNameStr" id="groupNameStr" value="${groupNameStr}">
                    <input type="hidden" name="brandNameStr" id="brandNameStr" value="${brandNameStr}">
                    <input type="hidden" name="level" id="level" value="${level}">
                    <input type="hidden" name="words" id="words" value="${words}">

                    <%--pagination--%>
                    <div class="container">
                        <nav aria-label="Page navigation">
                            <ul class="pagination" id="pagination"></ul>
                        </nav>
                    </div>

                    <%--<div class="loading-more">
                        <i class="icon_loading"></i>
                        <a href="#">
                            Loading More
                        </a>
                    </div>--%>

                </div>
            </div>
        </div>
    </section>
</form>

<!-- Product Shop Section End -->

<!-- Partner Logo Section Begin -->
<div class="partner-logo">
    <div class="container">
        <div class="logo-carousel owl-carousel">
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img
                            src="<c:url value="/template/web/img/logo-carousel/logo-1.png"/>"
                            alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img
                            src="<c:url value="/template/web/img/logo-carousel/logo-2.png"/>"
                            alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img
                            src="<c:url value="/template/web/img/logo-carousel/logo-3.png"/>"
                            alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img
                            src="<c:url value="/template/web/img/logo-carousel/logo-4.png"/>"
                            alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img
                            src="<c:url value="/template/web/img/logo-carousel/logo-5.png"/>"
                            alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Partner Logo Section End -->

<script type="text/javascript">

    $(".tag-btn").click(function () {
        var value = $(this).attr('tag-data');
        $("#tag-value").val(value);
        $('#page').val(1);
        $("#level").val(2);
        $("#submitForm").submit();
    })

    $("#sorting").change(function () {
        var value = $(this).attr('tag-data');
        if (value != null && !value.equals("")) {
            $("#tag-value").val(value);
        }

        $('#page').val(1);

        $("#submitForm").submit();
    })

    $("#filter-btn").click(function (e) {
        var data = {};
        var groupNameStr = $(".group-name:checked").map(function () {
            return $(this).val();
        }).get();
        var brandNameStr = $(".brand-name:checked").map(function () {
            return $(this).val();
        }).get();

        $("#groupNameStr").val(groupNameStr);
        $("#brandNameStr").val(brandNameStr);


        console.log($("#groupNameStr").val());
        if ($("#groupNameStr").val() != null && $("#groupNameStr").val().trim() != "") {
            $("#level").val(1);
        }

        var oldMin = $("#priceMin").val();
        $("#priceMin").val(oldMin);
        var oldMax = $("#priceMax").val();
        $("#priceMax").val(oldMax);

        $('#page').val(1);
        $("#submitForm").submit();
    })

    $(function () {
        var totalPages = ${pageable.totalPage};
        var startPage = ${pageable.page};
        var maxPageItem = ${pageable.maxPageItem};
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: maxPageItem,
            startPage: startPage,
            onPageClick: function (event, page) {
                if (startPage != page) {
                    $('#maxPageItem').val(maxPageItem);
                    $('#page').val(page);
                   /* $("#words").val(${words})*/
                    $('#submitForm').submit();
                }
            }
        }).on('page', function (event, page) {
            console.info(page + ' (from event listening)');
        });
    });
</script>
</body>
</html>