<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.ecommerce.utils.PriceUtils" %>
<%@ include file="/common/taglib.jsp" %>
<c:url var="apiURL" value="/api/danh-gia"></c:url>
<c:url var="newURL" value="/sanpham"></c:url>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
</head>
<body>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i
                            class="fa fa-home"></i> Trang chủ</a> <span>Chi tiết sản phẩm</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<section class="product-shop spad page-details">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="filter-widget">
                    <h4 class="fw-title">Dành cho</h4>
                    <ul class="filter-catagories">
                        <c:forEach var="customer" items="${filterByCustomers}">
                            <li><a href="#">${customer.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="filter-widget">
                    <h4 class="fw-title">Thương hiệu</h4>
                    <ul class="filter-catagories">
                        <c:forEach items="${filterByBrands}" var="brand">
                            <li><a href="#">${brand.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="filter-widget">
                    <h4 class="fw-title">Giá</h4>
                    <div class="filter-range-wrap">
                        <div class="range-slider">
                            <div class="price-input">
                                <div class="input-group mb-3">
                                    <input name="price" type="text" class="form-control"
                                           placeholder="Giá từ">
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="basic-addon2">đ</span>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <input name="price" type="text" class="form-control"
                                           placeholder="Đến">
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="basic-addon1">đ</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <a href="#" class="filter-btn">Lọc</a>
                </div>
                <%--<div class="filter-widget">
                <h4 class="fw-title">Màu Sắc</h4>
                <div class="fw-color-choose">
                    <c:forEach items="${filterByColors}" var="color">
                        <div class="cs-item">
                            <input type="radio" id="cs-${color.code}"> <label
                                class="cs-${color.code}" for="cs-${color.code}"><a href="">${color.name}</a></label>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="filter-widget">
                <h4 class="fw-title">Size</h4>
                <div class="fw-size-choose">
                    <ul id="choose-size">
                        <c:forEach items="${filterBySize}" var="size">
                            <li><a href="">${size.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>--%>
                <div class="filter-widget">
                    <h4 class="fw-title">Tags</h4>
                    <div class="fw-tags">
                        <c:forEach items="${filterByTags}" var="tag">
                            <a href="#">${tag.name}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-pic-zoom">
                            <img class="product-big-img" src="${product.imageUrl}"
                                 alt="product picture">
                            <div class="zoom-icon">
                                <i class="fa fa-search-plus"></i>
                            </div>
                        </div>
                        <div class="product-thumbs">
                            <div class="product-thumbs-track ps-slider owl-carousel">
                                <c:forEach items="${listImageDetails}" var="image">
                                    <div class="pt active">
                                        <img class="imageDetails" src="${image.imageUrl}" alt="product picture detail">
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product-details">
                            <div class="pd-title">
                                <span></span>
                                <h3>${product.name}</h3>
                                <a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
                            </div>
                            <div class="pd-rating">
                                <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star-o"></i> <span>(5)</span>
                            </div>
                            <div class="pd-desc">
                                <p>${product.description}</p>
                                <h4>
                                    <c:if test="${product.sellPrice < product.originPrice}">
                                        ${product.sellPrice} đ<span>${product.originPrice}đ</span>
                                    </c:if>
                                    <c:if test="${product.sellPrice == product.originPrice}">
                                        ${product.sellPrice} đ
                                    </c:if>
                                </h4>
                            </div>
                            <%--   <div class="pd-color-choose">
                               <c:forEach items="${filterByColors}" var="color">
                                   <div class="sc-item">
                                       <input name="colorId" value="${color.id}" type="radio"
                                              id="cc-${color.code}">
                                       <label for="cc-${color.code}">${color.name}</label>
                                   </div>
                               </c:forEach>
                               &lt;%&ndash;<div class="cc-item">
                                   <input type="radio" id="cc-black"> <label
                                       for="cc-black"></label>
                               </div>
                               <div class="cc-item">
                                   <input type="radio" id="cc-yellow"> <label
                                       for="cc-yellow" class="cc-yellow"></label>
                               </div>
                               <div class="cc-item">
                                   <input type="radio" id="cc-violet"> <label
                                       for="cc-violet" class="cc-violet"></label>
                               </div>&ndash;%&gt;
                           </div>--%>
                            <%--</div>--%>
                            <form id="sizecolor">
                                <input name="productId" value="${product.id}" type="hidden">
                                <div class="filter-widget">
                                    <h4 class="fw-title">Màu sắc</h4>
                                    <div class="fw-color-choose">
                                        <c:forEach items="${filterByColors}" var="color">
                                            <div class="sc-item">
                                                <input value="${color.id}" class="colorId" name="colorId"
                                                       type="radio" id="${color.code}-color"> <label
                                                    for="${color.code}-color">${color.name}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div style="color: red; font-size: 16" id="color-errs"></div>
                                <div class="filter-widget">
                                    <h4 class="fw-title">Kích thước</h4>
                                    <div class="fw-size-choose">
                                        <c:forEach items="${filterBySize}" var="size">
                                            <div class="sc-item">
                                                <input value="${size.id}" class="sizeId" name="sizeId"
                                                       type="radio" id="${size.code}-size"> <label
                                                    class="size-id-lb" for="${size.code}-size">${size.name}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div style="color: red; font-size: 16" id="size-errs"></div>
                            </form>

                            <p id="quantity">Còn lại: ${num} sản phẩm</p>
                            <form id="add-cart-form">
                                <input type="hidden" id="size-btn-add" name="sizeId" value="">
                                <input type="hidden" id="color-btn-add" name="colorId" value="">
                                <input type="hidden" name="productId" value="${product.id}">
                                <div class="quantity pro-qty">
                                    <c:if test="${num > 0}">
                                        <button type="button" id="have-btn"
                                                class="primary-btn pd-cart">Thêm vào giỏ
                                        </button>
                                        <h4 style="display: none" id="nothave">Hết hàng</h4>
                                    </c:if>
                                    <c:if test="${num <= 0}">
                                        <button style="display: none" type="button" id="have-btn"
                                                class="primary-btn pd-cart">Thêm vào giỏ
                                        </button>
                                        <h4 id="nothave">Hết hàng</h4>
                                    </c:if>
                                    <%--<a href="#" class="primary-btn pd-cart">Thêm vào giỏ</a>--%>
                                </div>
                            </form>
                            <ul class="pd-tags">
                                <li><span>Loại</span>: ${product.groupProduct}</li>
                                <li><span>TAGS</span>: Quần áo, nữ, kaki</li>
                            </ul>
                            <div class="pd-share">
                                <div class="pd-social">
                                    <a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
                                        class="ti-twitter-alt"></i></a> <a href="#"><i
                                        class="ti-linkedin"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="product-tab">
                    <div class="tab-item">
                        <ul class="nav" role="tablist">
                            <li><a class="active" data-toggle="tab" href="#tab-1"
                                   role="tab">Mô tả</a></li>

                            <li><a data-toggle="tab" href="#tab-3" role="tab">Đánh
                                giá(${listReview.size()})</a></li>
                        </ul>
                    </div>
                    <div class="tab-item-content">
                        <div class="tab-content">
                            <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                <div class="product-content">
                                    <div class="row">
                                        <div class="col-lg-12">${product.description}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                <div class="customer-review-option">
                                    <h4>${listReview.size()} Bình luận</h4>
                                    <div class="comment-option">
                                        <h3 class="mb-3">Đánh giá trung bình : ${product.avgStar}</h3>
                                        <c:forEach items="${listReview}" var="review">
                                            <div class="co-item">
                                                <div class="avatar-text">
                                                    <h5>
                                                            ${review.user.lastName } ${review.user.firstName }
                                                        <span>${review.dateReview }</span>
                                                            ${review.vote} sao
                                                    </h5>
                                                     <p style = "font-weight:500;font-size:18;margin:0px;">${review.comment}</p> 
                                                    <c:if test="${not empty review.reply}"></c:if>
                                                     <span style = "font-weight:600">Fashi:</span> ${review.reply}
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <c:if test="${not empty USERMODEL }">
                                        <form id="review" class="comment-form">
                                            <div class="leave-comment mt-5">
                                                <h6>Đánh giá của bạn</h6>
                                                <div class="rating">
                                                    <select name="vote">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div>
                                                <h4>Bình luận</h4>
                                                <div class="row">
                                                    <div class="col-lg-12">
															<textarea cols="50" name="comment" rows="5"
                                                                      placeholder="Bình luận"></textarea>
                                                        <button id="submit" class="site-btn d-block">Gửi</button>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="productId" id="productId"
                                                       value="${product.id}"> <input type="hidden"
                                                                                     name="commentator"
                                                                                     value="${USERMODEL.id}">
                                            </div>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</section>
<!-- Product Shop Section End -->

<div class="related-products spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm liên quan</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${listRelatedProduct}" var="relate" begin="0" end="4">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <a href="<c:url value="/sanpham?id${relate.id}"/> ">
                                <img
                                        src="${relate.imageUrl}"
                                        alt="">
                            </a>
                            <c:if test="${relate.sellPrice < originPrice}">
                                <div class="sale">Sale</div>
                            </c:if>
                                <%--<div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>--%>
                                <%-- <ul>
                                     <li class="w-icon active"><a href="#"><i
                                             class="icon_bag_alt"></i></a></li>
                                     <li class="quick-view"><a href="#">+ Quick View</a></li>
                                     <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                 </ul>--%>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">relate.groupProduct</div>
                            <a href="<c:url value="/sanpham?id=${relate.id}"/> ">
                                <h5>${relate.name}</h5>
                            </a>
                            <div class="product-price">
                                <c:if test="${relate.sellPrice < relate.originPrice}">
                                    ${relate.sellPrice} đ<span>${relate.originPrice}đ</span>
                                </c:if>
                                <c:if test="${relate.sellPrice == relate.originPrice}">
                                    ${relate.sellPrice} đ
                                </c:if>
                                    <%--$14.00 <span>$35.00</span>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(
        function () {
            /*get stock quantity*/
            var sizeId = 0;
            var colorId = 0;

            $("#submit").click(function () {
                var data = {};
                dataForm = $("#review").serializeArray();
                $.each(dataForm, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                addNew(data)
            })
            $(".imageDetails").click(function () {
                var url = $(this).attr('src');
                $(".zoomImg").attr('src', url);
                $(".product-big-img").attr('src', url);
            })
            $('input[name="sizeId"]').change(function () {
                sizeId = $(this).val();
                $("#size-err").text('');
                if (colorId > 0 && sizeId > 0) {
                    data = {};
                    dataForm = $("#sizecolor").serializeArray();
                    $.each(dataForm, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    getQuantity(data);
                }
            });

            function addNew(data) {
                $.ajax({
                    url: '${apiURL}',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'text',
                    data: JSON.stringify(data),
                    success: function (result) {
                        window.location.href = '${newURL}?id='
                            + $("#productId").val();
                    },
                    error: function (error) {
                        window.location.href = '${newURL}?id='
                            + $("#productId").val();
                    }

                })
            }

            $('input[name="colorId"]').change(function () {
                colorId = $(this).val();
                $("#color-err").text('');

                if (colorId > 0 && sizeId > 0) {
                    data = {};
                    dataForm = $("#sizecolor").serializeArray();
                    $.each(dataForm, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    getQuantity(data);
                }
            });

            function getQuantity(data) {
                $
                    .ajax({
                        url: "<c:url value="/api/stock"/> ",
                        type: "POST",
                        contentType: "application/json",
                        dataType: "text",
                        data: JSON.stringify(data),
                        success: function (result) {
                            if (parseInt(result) > 0) {
                                $("#quantity").text(
                                    "Còn lại: " + result
                                    + " sản phẩm");
                                $('#have-btn').show();
                                $('#nothave').hide();
                            }

                            if (parseInt(result) <= 0) {
                                $("#quantity").text(
                                    "Còn lại: " + result
                                    + " sản phẩm");
                                $('#have-btn').hide();
                                $('#nothave').show();
                            }

                        },
                        error: function (result) {
                            $("#quantity").text("");
                            $('#have-btn').hide();
                            $('#nothave').show();
                        }
                    })
            }


            $("#have-btn").click(function () {
                if (colorId > 0 && sizeId > 0) {
                    $("#size-btn-add").val(sizeId);
                    $("#color-btn-add").val(colorId);
                    data = {};
                    dataForm = $("#add-cart-form").serializeArray();
                    $.each(dataForm, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    addCartDetail(data);
                } else {
                    if (colorId <= 0)
                        $("#color-err").text('Vui lòng chọn màu sắc')
                    if (sizeId <= 0)
                        $("#size-err").text('Vui lòng chọn kích cỡ')
                }
            });

            function addCartDetail(data) {
                $.ajax({
                    url: "<c:url value="/api/sanpham-giohang"/> ",
                    type: "POST",
                    contentType: "application/json",
                    dataType: "text",
                    data: JSON.stringify(data),
                    success: function (result) {
                        setTimeout(function () {
                            alert("Sản phẩm đã được lưu vào giỏ hàng");
                        }, 1);
                        $("#reload").load(location.href+" #reload>*","");
                    },
                    error: function (result) {
                        alert("ERROR")
                    }
                })
            }
        });
</script>

<!-- Related Products Section End -->
</body>
</html>