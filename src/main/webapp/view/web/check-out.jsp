<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href = "<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang Chủ</a>
                   
                    <a href = "<c:url value = "/view/web/shop.jsp"/>">Shop</a>
                    <span>Thanh Toán</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Shopping Cart Section Begin -->
<section class="checkout-section spad">
    <div class="container">
        <form action="<c:url value="/thanh-toan"/> " method="post" id="checkout-form" class="checkout-form">
            <div class="row">
                <div class="col-lg-6">
                    <div class="checkout-content">
                        <a href = "<c:url value = "/view/web/login.html"/>" class="content-btn">Nhấn vào đây để đăng nhập</a>
                    </div>
                    <h4>Thông Tin Thanh Toán</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <label for="firstName">Họ<span>*</span></label>
                            <input type="text" id="firstName" name="firstName"
                                value="<c:if test="${not empty USERMODEL}">${USERMODEL.firstName}</c:if>">
                            <label style="color: red;"  id="fname-error" class="error" for="firstName"></label>
                        </div>
                        <div class="col-lg-6">
                            <label for="lastName">Tên<span>*</span></label>
                            <input type="text" id="lastName" name="lastName"
                                   value="<c:if test="${not empty USERMODEL}">${USERMODEL.lastName}</c:if>">
                            <label style="color: red;"  id="lname-error" class="error" for="lastName"></label>
                        </div>
                        <div class="col-lg-6">
                            <label for="email">Email<span>*</span></label>
                            <input type="email" name="email" id="email"
                                   value="<c:if test="${not empty USERMODEL}">${USERMODEL.email}</c:if>">
                            <label style="color: red;"  id="email-error" class="error" for="email"></label>
                        </div>
                        <div class="col-lg-6">
                            <label for="phone">Số điện thoại<span>*</span></label>
                            <input type="text" id="phone" name="phone"
                                   value="<c:if test="${not empty USERMODEL}">${USERMODEL.phone}</c:if>">
                            <label style="color: red;"  id="phone-error" class="error" for="phone"></label>
                        </div>
                        <div class="col-lg-12">
                            <label for="address">Địa chỉ nhận hàng<span>*</span></label>
                            <input type="text" id="address" name="address" class="street-first"
                                   value="<c:if test="${not empty USERMODEL}">${USERMODEL.address}</c:if>">
                            <label style="color: red;" id="address-error" class="error" for="address"></label>
                        </div>
                        <div class="col-lg-12">
                            <div class="create-item">
                                <label for="acc-create">
                                    <a href = "<c:url value = "/view/web/register.jsp"/>"
                                     class="btn btn-primary">Tạo tài khoản ?</a>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="checkout-content">
                        <input type="text" placeholder="Nhập mã phiếu giảm giá">
                    </div>
                    <div class="place-order">
                        <h4>Đơn Hàng Của Bạn</h4>
                        <div class="order-total">
                            <ul class="order-table">
                                <li>Sản Phẩm <span>Tiền</span></li>
                               <%-- <li class="fw-normal">Áo thun x 1 <span>110.000đ</span></li>--%>
                                <c:forEach var="details" items="${CART.cartDetailsList}">
                                    <li class="fw-normal">${details.stock.product.name} x ${details.quantity}
                                        <span>
                                            <fmt:formatNumber
                                                    pattern="###,###,### VNĐ"
                                                    value="${details.stock.product.sellPrice
                                                    * details.quantity}"/>
                                        </span>
                                    </li>
                                </c:forEach>
                                <li class="total-price">Tổng tiền
                                    <span>
                                        <fmt:formatNumber
                                        pattern="###,###,### đ"
                                        value="${CART.totalOriginPrice()}"/>
                                    </span>
                                </li>
                                <li class="total-price">Giá giảm
                                    <span>
                                        <fmt:formatNumber
                                                pattern="###,###,### đ"
                                                value="${CART.totalDiscount()}"/>
                                    </span>
                                </li>
                                <li class="total-price">Thành tiền
                                    <span>
                                        <fmt:formatNumber
                                                pattern="###,###,### đ"
                                                value="${CART.totalPrice()}"/>
                                    </span>
                                </li>
                            </ul>
                            <div class="payment-check">
                                <div class="pc-item">
                                    <label for="pc-check">
                                        Thanh toán khi nhận hàng
                                        <input checked="checked" type="checkbox" id="pc-check">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                           <%-- <c:if test="${not empty CART}">--%>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">Đặt Hàng</button>
                                </div>
                            <%--</c:if>--%>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Shopping Cart Section End -->
    <script>
        $().ready(function () {
            $("#checkout-form").validate({
                rules: {
                    firstName: {
                        required: true
                    },
                    lastName: {
                        required: true
                    },
                    email: {
                        email: true,
                        required: true
                    },
                    phone:{
                        number:true,
                        required: true
                    },
                    address:{
                        required:true
                    }
                },
                messages: {
                    firstName: {
                        required: "Vui lòng điền họ"
                    },
                    lastName: {
                        required: "Vui lòng điền tên"
                    },
                    email: {
                        required: "Vui lòng điền địa chỉ email",
                        email: "Địa chỉ email không hợp lệ"
                    },
                    phone:{
                        number: "SĐT là chữ số",
                        required: "Vui lòng điền SĐT"
                    },
                    address:{
                        required: "Vui lòng điền Địa chỉ"
                    }
                }
            });
        })
    </script>
</body>
</html>