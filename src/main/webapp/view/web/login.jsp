<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Đăng nhập</span>
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
                    <input type="hidden" id="message" value="${message}">
                    <script type="text/javascript">
                        $().ready(function () {
                            if ($('#message').val() != "") {
                                alert($('#message').val());
                            }
                        })
                    </script>
                    <h2>Đăng Nhập</h2>

                    <form id="login" action="<c:url value="/dang-nhap"/> " method="POST">
                        <div class="group-input">
                            <label for="username">Tên tài khoản *</label>
                            <input type="text" name="username" id="username"
                                   value="<%= request.getAttribute("username") == null
                                   ? "" : request.getAttribute("username") %>">
                            <label style="color:#F00;" for="username" class="error" id="">
                                <%=request.getAttribute("uname-err") == null ? ""
                                        : request.getAttribute("uname-err")%>
                            </label>

                        </div>
                        <div class="group-input">
                            <label for="password">Mật khẩu *</label>
                            <input type="password" name="password" id="password">
                            <label style="color:#F00;" for="password" class="error">
                                <%=request.getAttribute("pwd-err") == null ? ""
                                        : request.getAttribute("pwd-err")%>
                            </label>
                        </div>
                        <div class="group-input gi-check">
                            <div class="gi-more">
                                <label for="save-pass">
                                    Lưu Mật Khẩu
                                    <input type="checkbox" checked="checked" id="save-pass">
                                    <span class="checkmark"></span>
                                </label>
                                <a href="<c:url value="quen-mat-khau"/> " class="forget-pass">Quên Mật Khẩu</a>
                            </div>
                        </div>

                        <div class="g-recaptcha" data-sitekey="6LeWAD4aAAAAANPHjKDcdFsscu27bjNcvKmPGPUL"
                        <%--data-callback='onSubmit'--%>>
                            <%--Submit--%>
                        </div>
                        <%--<div style="color:#F00;" for="password" class="error">
                            <%=request.getAttribute("err-captcha") == null ? ""
                                    : request.getAttribute("err-captcha")%>
                        </div>--%>
                        <button id="loginBtn" type="button" class="site-btn login-btn">Đăng Nhập</button>
                        <a id="facebook" href="https://www.facebook.com/dialog/oauth?client_id=798415874362188&redirect_uri=http://localhost:8080/ecommerce/dang-nhap/facebook"/><i class="fa fa-facebook"></i></a>
                    </form>

                    <div class="switch-login">
                        <a href="<c:url value="/dang-ky"/>" class="or-login">Hoặc Tạo Tài Khoản</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Register Form Section End -->
<script>
    $().ready(function () {
        $("#login").validate({
            rules: {
                username: "required",
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                }
            },
            messages: {
                password: {
                    required: "Mật khẩu không được bỏ trống!",
                    minlength: "Mật khẩu tối thiểu 6 ký tự",
                    maxlength: "Mật khẩu tối đa 20 ký tự"
                },
                username: "Tên tài khoản không được bỏ trống"
            }
        });
    })
    $("#loginBtn").click(function () {
        var response = grecaptcha.getResponse();

        if (response.length == 0){
            alert("Vui lòng xác nhận captcha")
        }
        else{
            $("#login").submit();
        }
    })
</script>

</body>
</html>