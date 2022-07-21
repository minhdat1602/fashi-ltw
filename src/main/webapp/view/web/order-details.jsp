<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Chi tiết hóa đơn</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Register Section Begin -->
<form id="order-detail">
    <input type="hidden" name="id" value="${order.id}">
    <input type="hidden" id="status" name="status" value="${order.status}">
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="content-wrapper">
                    <div class="content">
                        <div class="invoice-wrapper rounded border bg-white py-5 px-3 px-md-4 px-lg-5">
                            <div class="d-flex justify-content-between">
                                <h2 class="text-dark font-weight-medium">Hóa đơn #${order.code}</h2>
                            </div>
                            <div class="row pt-5">
                                <div class="col-xl-6 col-lg-6">
                                    <p class="text-dark mb-2">Gửi đến:</p>
                                    <address>
                                        Họ tên: ${user.firstName} ${user.lastName}
                                        <br>Địa chỉ: ${user.address}
                                        <br> Số điện thoại: +84 ${user.phone}
                                    </address>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <p class="text-dark mb-2">Chi tiết</p>
                                    <address>
                                        Mã hóa đơn:
                                        <span class="text-dark">#${order.code}</span>
                                        <br> Ngày : <fmt:formatDate pattern="dd-MM-yyyy"
                                                                    value="${order.dateSell}"/>
                                    </address>
                                </div>
                            </div>
                            <table style="width:100%">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th style="text-align: center;">Sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Giảm giá</th>
                                    <th>Tổng giá</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${order.listOrderDetails}" varStatus="a" var="details">
                                    <tr>
                                        <td>${a.index + 1 }</td>
                                        <td style="text-align: center;">${details.stock.product.name}</td>
                                        <td style="padding-left: 30px">${details.quantity}</td>
                                        <td class="money">${details.price}</td>
                                        <td class="money">${details.discount}</td>
                                        <td class="money">${details.price - details.discount}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="row justify-content-end">
                                <div class="col-lg-5 col-xl-4 col-xl-3 ml-sm-auto">
                                    <ul class="list-unstyled mt-4">
                                        <li class="mid pb-3 text-dark"> TỔNG SỐ TIỀN
                                            <span class="money d-inline-block float-right text-default">${order.totalSellPrice}
                                            </span>
                                        </li>
                                        <li class="mid pb-3 text-dark"> GIẢM GIÁ
                                            <span class="money d-inline-block float-right text-default">${order.totalDiscount}</span>
                                        </li>
                                        <li class="mid pb-3 text-dark"> THÀNH TIỀN
                                            <span class="money d-inline-block float-right text-default">${order.totalMoney}</span>
                                        </li>
                                    </ul>
                                    <a href="#" id="huy" class="btn btn-block mt-2 btn-lg btn-danger btn-pill">${order.status}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<!-- Register Form Section End -->
<script>
    $('#huy').click(function () {
        if ($("#status").val() == 'Chờ xác nhận') {
            if (confirm("Bạn chắc chắn muốn hủy đơn hàng này")) {
                console.log($("#status").val())
                $("#status").val("Đã hủy");
                var data = {};
                var dataForm = $("#order-detail").serializeArray();
                $.each(dataForm, function (i, v) {
                    data["" + v.name + ""] = v.value;
                })
                cancel(data);
            }
        }
        else{
            alert("bạn đã hủy đơn hàng này")
        }
    })

    function cancel(data) {
        $.ajax({
            url: "<c:url value="/api/donhang"/>  ",
            type: "PUT",
            contentType: "application/json",
            dataType: "text",
            data: JSON.stringify(data),
            success: function (result) {
                console.log('success')
                $("#huy").text("Đã hủy");
            },
            error: function (result) {
                console.log("error")
            },

        })
    }

</script>
</body>
</html>