<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i
                            class="fa fa-home"></i> Trang chủ</a> <span>Đăng ký</span>
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
                <div class="register-form">
                    <h2>Đăng ký</h2>
                    <form id="registry" action="<c:url value="/dang-ky"/> " method="POST">
                        <div class="group-input">
                            <label for="fname">Họ *</label>
                            <input type="text" name="fname" id="fname"
                                   value="<%=request.getAttribute("fname")==null?"":request.getAttribute("fname")%>"/>
                            <label style="color: #F00" class="error" for="fname"></label>
                        </div>
                        <div class="group-input">
                            <label for="lname">Tên *</label>
                            <input type="text" name="lname" id="lname"
                                   value="<%=request.getAttribute("lname")==null?"":request.getAttribute("lname")%>"/>
                            <label style="color: #F00" class="error" for="lname"></label>
                        </div>
                        <div class="group-input">
                            <label for="username">Tên tài khoản *</label>
                            <input type="text" name="username" id="username"/>
                            <label style="color: #F00" class="error" for="username">
                                <%=request.getAttribute("uname-err") == null ? "" :
                                        request.getAttribute("uname-err")%>
                            </label>
                        </div>
                        <div class="group-input">
                            <label for="email">Địa chỉ email *</label>
                            <input type="email" name="email" id="email"
                                   value="<%=request.getAttribute("email")==null?"":request.getAttribute("email")%>">
                            <label style="color: #F00" class="error" for="email"></label>
                        </div>
                        <div class="group-input">
                            <label for="password">Mật khẩu *</label>
                            <input type="password" name="password" id="password">
                            <label style="color: #F00" class="error" for="password"></label>
                        </div>
                        <div class="group-input">
                            <label for="confirmPassword">Nhập lại mật khẩu *</label>
                            <input type="password" name="confirmPassword" id="confirmPassword">
                            <label style="color: #F00" class="error" for="confirmPassword"></label>
                        </div>
                        <button id="registryBtn" type="submit" class="site-btn login-btn">Đăng Ký</button>
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
    $().ready(function () {
        $("#registry").validate({
            rules: {
                fname: {
                    required: true
                },
                lname: {
                    required: true
                },
                username: {
                    required: true,
                    minlength: 6,
                    maxlength: 50
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                confirmPassword: {
                    required: true,
                    equalTo: "#password"
                },
                email: {
                    email: true,
                    required: true
                }
            },
            messages: {
                fname: {
                    required: "Vui lòng điền họ"
                },
                lname: {
                    required: "Vui lòng điền tên"
                },
                username: {
                    required: "Vui lòng điền tên tài khoản",
                    minlength: "Tên tài khoản quá ngắn",
                    maxlength: "Tên tài khoản quá dài"
                },
                password: {
                    required: "Vui lòng điền mật khẩu",
                    minlength: "Mật khẩu quá ngắn",
                    maxlength: "Mật khẩu quá dài"
                },
                confirmPassword: {
                    required: "Vui lòng xác nhận mật khẩu",
                    equalTo: "Mật khẩu không trùng khớp"
                },
                email: {
                    required: "Vui lòng điền địa chỉ email",
                    email: "Địa chỉ email không hợp lệ"
                }
            }
        });
    })
</script>
</body>

</html>