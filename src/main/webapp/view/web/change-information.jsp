<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thay đổi thông tin</title>
</head>
<body>

<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Home</a>
                    <span>Thay đổi thông tin</span>
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
                    <h2>THAY ĐỔI THÔNG TIN</h2>
                    <form id="info" action="<c:url value="/capnhat"/>" method="post">
                        <div class="group-input">
                            <label for="fname">Họ *</label>
                            <input type="text" value ='${USERMODEL.firstName}' name="fname"  id="fname">
                            <label style="color:#F00;" for="fname" class="error">
                            </label>
                        </div>
                        <div class="group-input">
                            <label for="lname">Tên *</label>
                            <input type="text" value ='${USERMODEL.lastName}' name="lname"  id="lname">
                            <label style="color:#F00;" for="lname" class="error">
                            </label>
                        </div>
                        <div class="group-input">
                            <label for="email">Địa chỉ email *</label>
                            <input type="email" value ='${USERMODEL.email}' name="email"  id="email">
                            <label style="color:#F00;" for="email" class="error">
                            </label>
                        </div>
                        <div class="group-input">
                            <label for="phone">Số điện thoại</label>
                            <input type="text" value = '${USERMODEL.phone}'  id="phone" name="phone">
                            <label style="color:#F00;" for="phone" class="error">
                            </label>
                        </div>
                        <div  class="group-input"  style="display: inline-flex;
                         margin-bottom: 0px; width: 555px; justify-content: space-between">
                            <div class="group-input" style="width: 420px !important;">
                                <label for="gender">Ngày sinh *</label>
                                <input value = <fmt:formatDate pattern = "yyyy-MM-dd" value ='${USERMODEL.birthday}' />
                                               id="birthday" name="birthday" type="date">
                            </div>

                            <div class="group-input">
                                <label for="gender">Giới tính *</label>
                                <select id="gender" name="gender"
                                    style="width: 112px !important; padding-left: 33px; height: 50px; border: 1px lightgray solid;">
                                    <option <c:if test="${USERMODEL.gender eq 'nam'}"> selected="selected" </c:if>
                                            value="nam">Nam</option>
                                    <option <c:if test="${USERMODEL.gender eq 'nu'}"> selected="selected" </c:if>
                                            value="nu">Nữ</option>
                                    <option <c:if test="${USERMODEL.gender eq 'khac'}"> selected="selected" </c:if>
                                            value="khac">Khác</option>
                                </select>
                            </div>
                        </div>

                        <div class="group-input">
                            <label for="address">Địa chỉ</label>
                            <input value = '${USERMODEL.address}' type="text" id="address" name="address">
                            <label style="color:#F00;" for="address" class="error">
                            </label>
                        </div>
                        <div class="group-input">
                            <label for="password">Xác nhận(Nhập Mật khẩu *)</label>
                            <input type="password" name="password" id="password">
                            <label style="color:#F00;" for="password" class="error" >
                                <%=request.getAttribute("pwd-err") == null ? ""
                                        : request.getAttribute("pwd-err")%>
                            </label>
                        </div>
                        <input name="page" value="info" style="display: none">
                        <button id="infoBtn" type="submit" class="site-btn register-btn">Cập nhật</button>
                    </form>
                    <div class="switch-login">
                        <a href="<c:url value = "/capnhat?page=pwd"/>" class="or-login">Đổi mật khẩu</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Register Form Section End -->
<script>
    $().ready(function (){
        $("#info").validate({
            rules:{
                fname: "required",
                lname: "required",
                email:{
                    email: true
                },
                phone:{
                    number: true
                },
                password:{
                    minlength: 6,
                    maxlength: 20,
                    required: true
                }
            },
            messages:{
                fname: "Vui lòng điền họ",
                lname: "Vui lòng điền tên",
                email:{
                    email:"Email không hợp lệ"
                },
                phone:{
                    number: "Số điện thoại không hợp lệ"
                },
                password: {
                    required: "Mật khẩu không được bỏ trống",
                    minlength: "Độ dài tối thiểu là 6 ký tự",
                    maxlength: "Độ dài tối đa là 20 ký tự"
                }
            }
        })
    })
</script>
</body>
</html>