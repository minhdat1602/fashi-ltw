<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href = "<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Quên mật khẩu</span>
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
                    <form action="<c:url value="/quen-mat-khau"/>" method="post" id="fogotPwd">
                        <div class="group-input">
                            <div class="group-input" style="font-size: 20px; text-align: center">
                                Vui lòng nhập địa chỉ email và chúng tôi sẽ gửi mã xác nhận vào email của bạn.
                            </div>
                            <label for="email">Địa chỉ email *</label>
                            <input type="email" id="email" name="email">
                            <label style="color:#FF0000;"  class="error" for="email">
                                <%=request.getAttribute("email-err")==null?"":request.getAttribute("email-err")%>
                            </label>
                        </div>
                        <input style="display: none" value="send" name="action">
                        <button type="submit" class="site-btn login-btn">Gửi</button>
                    </form>
                    <div class="switch-login">
                        <a href="<c:url value="/dang-nhap"/>" class="or-login">Hoặc Đăng Nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Register Form Section End -->
<script>
    $().ready(function (){
        $("#fogotPwd").validate({
            rules:{
                email:{
                    email: true,
                    required: true,
                }
            },
            messages:{
                email:{
                    email: "Địa chỉ email không hợp lệ",
                    required: "Vui lòng điền địa chỉ email",
                }
            }
        })
    })
</script>
</body>
</html>