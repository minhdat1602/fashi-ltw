<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mã xác nhận</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Quên mật khẩu</span>
                    <span style="padding-left: 27px">Mã xác nhận</span>
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
            <div class="col-lg-6 offset-lg-3">
                <div class="login-form">
                    <h2>Quên mật khẩu</h2>
                    <form id="otpForm" action="<c:url value="/quen-mat-khau"/>" method="post">
                        <div class="group-input">
                            <div class="group-input" style="font-size: 20px; text-align: center">
                                Mã xác nhận đã được gửi vào địa chỉ email của bạn.
                            </div>
                            <label for="otp">Mã xác nhận *</label>
                            <input type="text" id="otp" name="otp">
                            <label style="color:#FF0000;" class="error" for="otp">
                                <%=request.getAttribute("otp-err") == null ? "" : request.getAttribute("otp-err")%>
                            </label>
                        </div>
                        <input style="display: none" value="verify" name="action">
                        <button type="submit" class="site-btn login-btn">Xác nhận</button>
                    </form>
                    <form action="<c:url value="/quen-mat-khau"/>" method="post">
                        <input style="display: none" value="send" name="action">
                        <input style="display: none" value="${authcode.email}" name="email">
                        <button type="submit" class="site-btn login-btn">Gửi lại</button>
                    </form>
                    <div class="switch-login">
                        <a href="<c:url value="/quen-mat-khau"/>" class="or-login">Thay đổi email</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Register Form Section End -->
<script>
    $().ready(function () {
        $("#otpForm").validate({
            rules: {
                otp: {
                    number: true,
                    maxlength: 6,
                    required: true,
                    minlength: 6
                }
            },
            messages: {
                newPassword: {
                    required: "Mã xác nhận gồm 6 số",
                    minlength: "Mã xác nhận gồm 6 số",
                    maxlength: "Mã xác nhận gồm 6 số",
                    number: "Mã xác nhận gồm 6 số"
                }
            }
        })
    })
</script>
</body>
</html>