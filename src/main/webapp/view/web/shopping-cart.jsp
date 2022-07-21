<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<%@page import="com.ecommerce.utils.PriceUtils" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/trang-chu"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Giỏ hàng</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->


<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <c:if test="${(not empty CART) and (CART.cartDetailsList.size() != 0)}">
                <div class="col-lg-12">
                    <div class="cart-table">

                        <table>
                            <thead>
                            <tr>
                                <th>Hình</th>
                                <th style="text-align: center" class="p-name">Tên Sản Phẩm</th>
                                <th>Kích cỡ</th>
                                <th>Màu sắc</th>
                                <th>Giá Sản Phẩm</th>
                                <th>Số Lượng</th>
                                <th>Tổng Tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%--Items begin--%>
                            <%--<c:if test="${not empty USERMODEL}">
                                <c:forEach var="details" items="${CART.cartDetailsList}">

                                    <tr class="row${details.id}">
                                        <td style="width: 80px;" class="cart-pic first-row">
                                            <img src="<c:url value="${details.stock.product.imageUrl}"/>"
                                                 alt="Ảnh sản phẩm">
                                        </td>
                                        <td class="cart-title first-row" style="text-align: center">
                                            <h5>${details.stock.product.name}</h5>
                                        </td>
                                        <td style="text-align: center"
                                            class="cart-title first-row">${details.stock.size.name}</td>
                                        <td style="text-align: center"
                                            class="cart-title first-row">${details.stock.color.name}</td>
                                        <td class="p-price${details.id} first-row money">
                                                &lt;%&ndash;<fmt:formatNumber
                                                        pattern="###,###,### VNĐ"
                                                        value="${details.stock.product.sellPrice}"/>&ndash;%&gt;
                                                ${details.stock.product.sellPrice}
                                        </td>
                                        <form id="form-detail${details.id}">
                                            <input type="hidden" name="id" value="${details.id}"></input>
                                            <input type="hidden" name="cartId" value="${details.cartId}"></input>
                                            <input type="hidden" name="stockId"
                                                   value="${details.stockId}"></input>
                                            <td class="qua-col first-row">
                                                <div class="quantity">
                                                    <div class="pro-qty">
                                                <span class="dec qtybtn">
                                                        <button type="button"
                                                                detail-id="${details.id}"
                                                                style="border: none; outline: none; background-color: #ffffff;"
                                                                class="subBtn dec qtybtn">-</button>
                                                </span>
                                                        <input id="quan${details.id}" name="quantity" type="text"
                                                               value="${details.quantity}"></input>
                                                        <span class="inc qtybtn">
                                                        <button type="button"
                                                                detail-id="${details.id}"
                                                                style="border: none; outline: none; background-color: #ffffff;"
                                                                class="plusBtn inc qtybtn">+</button>
                                                </span>
                                                    </div>
                                                </div>
                                            </td>
                                        </form>
                                        <td class="total-price${details.id} first-row money">
                                                &lt;%&ndash;<fmt:formatNumber
                                                        pattern="###,###,### VNĐ"
                                                        value="${details.stock.product.sellPrice * details.quantity}"/>&ndash;%&gt;
                                                ${details.stock.product.sellPrice * details.quantity}
                                        </td>
                                        <td class="close-td first-row">
                                            <button detail-id="${details.id}" class="deleteBtn" type="button"
                                                    style="outline: none; border: none;background-color: #fff;">
                                                <i class="ti-close"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>--%>
                            <%--end--%>
                            <%--test cart begin--%>
                                <%--<c:if test="${empty USERMODEL}">--%>
                                    <c:forEach var="details" items="${CART.cartDetailsList}">
                                        <c:if test="${not empty USERMODEL}">
                                        <input type="hidden" name="id" value="${details.id}"></input>
                                        <input type="hidden" name="cartId" value="${details.cartId}"></input>
                                        <input type="hidden" name="stockId"
                                               value="${details.stockId}"></input>
                                        </c:if>
                                        <tr class="row${details.stock.id}">
                                            <td style="width: 80px;" class="cart-pic first-row">
                                                <img src="<c:url value="${details.stock.product.imageUrl}"/>"
                                                     alt="Ảnh sản phẩm">
                                            </td>
                                            <td class="cart-title first-row" style="text-align: center">
                                                <h5>${details.stock.product.name}</h5>
                                            </td>
                                            <td style="text-align: center"
                                                class="cart-title first-row">${details.stock.size.name}</td>
                                            <td style="text-align: center"
                                                class="cart-title first-row">${details.stock.color.name}</td>
                                            <td class="p-price${details.stock.id} first-row money">
                                                    <%--<fmt:formatNumber
                                                            pattern="###,###,### VNĐ"
                                                            value="${details.stock.product.sellPrice}"/>--%>
                                                    ${details.stock.product.sellPrice}
                                            </td>
                                            <form id="form-detail${details.stock.id}">
                                                <c:if test="${not empty USERMODEL}">
                                                    <input type="hidden" name="id" value="${details.id}"></input>
                                                     <input type="hidden" name="cartId" value="${details.cartId}"></input>
                                                </c:if>
                                                <input type="hidden" name="stockId"
                                                       value="${details.stockId}">
                                                <td class="qua-col first-row">
                                                    <div class="quantity">
                                                        <div class="pro-qty">
                                                <span class="dec qtybtn">
                                                        <button type="button"
                                                                detail-id="${details.stock.id}"
                                                                style="border: none; outline: none; background-color: #ffffff;"
                                                                class="subBtn dec qtybtn">-</button>
                                                </span>
                                                            <input id="quan${details.stock.id}"
                                                                   name="quantity" type="text"
                                                                   value="${details.quantity}"></input>
                                                            <span class="inc qtybtn">
                                                        <button type="button"
                                                                detail-id="${details.stock.id}"
                                                                style="border: none; outline: none; background-color: #ffffff;"
                                                                class="plusBtn inc qtybtn">+</button>
                                                </span>
                                                        </div>
                                                    </div>
                                                </td>
                                            </form>
                                            <td class="total-price${details.stock.id} first-row money">
                                                    <%--<fmt:formatNumber
                                                            pattern="###,###,### VNĐ"
                                                            value="${details.stock.product.sellPrice * details.quantity}"/>--%>
                                                    ${details.stock.product.sellPrice * details.quantity}
                                            </td>
                                            <td class="close-td first-row">
                                                <button detail-id="${details.stock.id}" class="deleteBtn" type="button"
                                                        style="outline: none; border: none;background-color: #fff;">
                                                    <i class="ti-close"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                <%--</c:if>--%>
                                <%--test cart end--%>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href="<c:url value="/trang-chu"/> "
                                   class="primary-btn continue-shop">Tiếp Tục Mua Sắm</a>

                            </div>
                                <%--<div class="discount-coupon">
                                    <h6>Mã Giảm Gía</h6>
                                    <form action="#" class="coupon-form">
                                        <input type="text" placeholder="Nhập mã code">
                                        <button type="submit" class="site-btn coupon-btn">Áp dụng</button>
                                    </form>
                                </div>--%>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                        <%--<li class="subtotal"> Tổng<span>590.000đ</span></li>--%>
                                    <li class="cart-total">Tổng giá
                                        <span id="totalAll" class="all-price money">
                                                <%--<fmt:formatNumber
                                                        pattern="###,###,### VNĐ"
                                                        value="${CART.totalPrice()}"/>--%>
                                            ${CART.totalPrice()}
                                        </span>
                                    </li>
                                </ul>
                                <a href="<c:url value="/thanh-toan"/>" class="proceed-btn">THANH TOÁN</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${(empty CART) or (CART.cartDetailsList.size() == 0)}">
                <h2>
                    KHÔNG CÓ SẢN PHẨM NÀO TRONG GIỎ HÀNG.
                </h2>
            </c:if>
        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->

<!-- Partner Logo Section Begin -->
<div class="partner-logo">
    <div class="container">
        <div class="logo-carousel owl-carousel">
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-1.png"/>" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-2.png"/>" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-3.png"/>" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-4.png"/>" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-5.png"/>" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Partner Logo Section End -->

<!-- Partner Logo Section Begin -->
<div class="partner-logo">
    <div class="container">
        <div class="logo-carousel owl-carousel">
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-1.png"/>" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-2.png"/>" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-3.png"/>" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-4.png"/>" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="<c:url value="/template/web/img/logo-carousel/logo-5.png"/>" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".subBtn").click(function () {
            var id = $(this).attr('detail-id');
            var old = $("#quan" + id).val();
            if (parseInt(old) > 1) {
                $("#quan" + id).val(parseInt(old) - 1);
                $("#quan2" + id).text(parseInt(old) - 1);
                var data = {};
                var dataForm = $("#form-detail" + id).serializeArray();
                $.each(dataForm, function (i, v) {
                    data["" + v.name + ""] = v.value;
                })

                var price = $(".p-price" + id).text().replace(/\D/g, '');
                var totalPrice = $(".total-price" + id).text().replace(/\D/g, '');
                var totalAll = $("#totalAll").text().replace(/\D/g, '');

                var numVND = new Intl.NumberFormat("it-IT", {
                    style: "currency",
                    currency: "VND"
                })

                $(".total-price" + id).text(numVND.format(parseInt(totalPrice) - parseInt(price)));
                $(".all-price").text(numVND.format(parseInt(totalAll) - parseInt(price)))

                update(data);
            }
        })

        $(".plusBtn").click(function () {
            var id = $(this).attr('detail-id');
            var old = $("#quan" + id).val();
            $("#quan" + id).val(1 + parseInt(old));
            $("#quan2" + id).text(1 + parseInt(old));
            var data = {};
            var dataForm = $("#form-detail" + id).serializeArray();
            $.each(dataForm, function (i, v) {
                data["" + v.name + ""] = v.value;
            })

            var price = $(".p-price" + id).text().replace(/\D/g, '');
            var totalPrice = $(".total-price" + id).text().replace(/\D/g, '');
            var totalAll = $("#totalAll").text().replace(/\D/g, '');

            var numVND = new Intl.NumberFormat("it-IT", {
                style: "currency",
                currency: "VND"
            })

            $(".total-price" + id).text(numVND.format(parseInt(totalPrice) + parseInt(price)));
            $(".all-price").text(numVND.format(parseInt(totalAll) + parseInt(price)))

            update(data);
        })

        $(".deleteBtn").click(function () {
            var id = $(this).attr('detail-id');
            var data = {};
            var dataForm = $("#form-detail" + id).serializeArray();
            $.each(dataForm, function (i, v) {
                data["" + v.name + ""] = v.value;
            })

            var totalPrice = $(".total-price" + id).text().replace(/\D/g, '');
            var totalAll = $("#totalAll").text().replace(/\D/g, '');

            var numVND = new Intl.NumberFormat("it-IT", {
                style: "currency",
                currency: "VND"
            })

            $(".all-price").text(numVND.format(parseInt(totalAll) - parseInt(totalPrice)))

            remove(data);

            $(".row" + id).remove();
            var qty = $('.qty').text();
            $('.qty').text(parseInt(qty) - 1)
        })

        function update(data) {
            $.ajax({
                url: "<c:url value="/api/sanpham-giohang"/>  ",
                type: "PUT",
                contentType: "application/json",
                dataType: "text",
                data: JSON.stringify(data),
                success: function (result) {
                    console.log('updated quantity success')
                },
                error: function (result) {
                    console.log("updated quantity error")
                },

            })
        }

        function remove(data) {
            $.ajax({
                url: "<c:url value="/api/sanpham-giohang"/> ",
                type: "DELETE",
                contentType: "application/json",
                dataType: "text",
                data: JSON.stringify(data),
                success: function (result) {
                    console.log('Delete quantity success')
                },
                error: function (result) {
                    console.log("delete quantity error")
                },
            })
        }
    })
</script>
<!-- Partner Logo Section End -->
</body>
</html>