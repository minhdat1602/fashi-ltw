<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách hóa đơn</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Danh sách hóa đơn</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Register Section Begin -->
<div class="register-login-section spad">
    <div class="container">
        <div class="row">
            <table class="table text-center">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Mã đơn</th>
                   <%-- <th scope="col">Sản phẩm</th>
                    <th scope="col">Số lượng sản phẩm</th>--%>
                    <th scope="col">Tổng giá bán</th>
                    <th scope="col">Tổng giá giảm</th>
                    <th scope="col">Thành tiền</th>
                    <th scope="col">Ngày đặt</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Chi tiết</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listOrder}" varStatus="in" var="order">
                    <tr>
                        <th scope="row">#${order.code}</th>
                        <td class="money">${order.totalSellPrice}</td>
                        <td class="money">${order.totalDiscount}</td>
                        <td class="money">${order.totalMoney}</td>
                        <td><fmt:formatDate pattern="dd-MM-yyyy"
                                            value="${order.dateSell}"/></td>
                        <td>
                            <div class="btn btn-primary">${order.status}</div>
                        </td>
                        <td><a class="btn" style="text-decoration: none;"
                               href="<c:url value='/donhang?id=${order.id}'/>">Xem</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Register Form Section End -->
</body>
</html>