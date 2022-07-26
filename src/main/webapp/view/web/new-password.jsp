<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mật khẩu mới</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href = "<c:url value = "/trang-chu"/>"><i class="fa fa-home"></i>Trang chủ</a>
                    <span>Quên mật khẩu</span>
                    <span style="padding-left: 27px">Mã xác nhận</span>
                    <span style="padding-left: 27px">Mật khẩu mới</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Form Section Begin -->

<!-- Register Section Begin -->
<div class="register-login-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="register-form">
                    <h2>Mật khẩu mới</h2>
                    <form id="pwd" action="<c:url value="/quen-mat-khau"/> " method="post">
                        <div class="group-input">
                            <label for="newPassword">Mật khẩu mới</label>
                            <input name="newPassword" type="password" id="newPassword">
                            <label style="color:#F00;" for="newPassword" class="error" >
                            </label>
                        </div>
                        <div class="group-input">
                            <label for="confirmNewPassword">Nhập lại mật khẩu mới*</label>
                            <input name="confirmNewPassword" type="password" id="confirmNewPassword">
                            <label style="color:#F00;" for="confirmNewPassword" class="error" >
                            </label>
                        </div>
                        <input style="display: none" value="newPwd" name="action">
                        <button type="submit" class="site-btn register-btn">Cập nhật</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Register Form Section End -->
<script>
    $().ready(function (){
        $("#pwd").validate({
            rules:{
                newPassword:{
                    minlength: 6,
                    maxlength: 20,
                    required: true
                },
                confirmNewPassword:{
                    equalTo: "#newPassword"
                }
            },
            messages:{
                newPassword:{
                    required: "Mật khẩu không được bỏ trống",
                    minlength: "Độ dài tối thiểu là 6 ký tự",
                    maxlength: "Độ dài tối đa là 20 ký tự"
                },
                confirmNewPassword:{
                    equalTo: "Mật khẩu không trùng khớp"
                }
            }
        })
    })
</script>
</body>
</html>