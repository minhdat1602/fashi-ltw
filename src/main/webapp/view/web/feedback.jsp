<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Phản hồi</title>
</head>
<body>
<input id="flag-index" type="hidden" value=".pages">
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Góp ý</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Faq Section Begin -->
<div class="faq-section spad">
    <div class="container">
        <div class="row">
            <div style="margin-left: 350px;" class="blog-details-inner col-6">
                <div class="leave-comment">
                    <h4>Góp ý</h4>
                    <form id="feedback-form" action="<c:url value="/gop-y"/>" method="post" class="comment-form">
                        <%--<c:if test="${not empty USERMODEL}">
                            <input type="hidden" name="userId" value="${USERMODEL.id}">
                        </c:if>--%>
                        <select id="feedback" name="problem" class="mb-2" style="border: 1px lightgray solid;">
                            <option>Về vấn đề--</option>
                            <option>Sản phẩm</option>
                            <option>Chính sách</option>
                            <option>Giao diện</option>
                            <option>Khác</option>
                        </select>
                        <div class="row">
                            <div class="col-lg-12">
                                <textarea name="content" placeholder="Lời góp ý"></textarea>
                                <button id="fb-btn" class="site-btn">Gửi Góp ý</button>
                            </div>
                        </div>
                        <div id="msg"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Faq Section End -->
<script>
    $(document).ready(function () {
        $("#feedback-form").validate({
            rules: {
                content: required
            },
            messages: {
                password: {
                    content: "Vui lòng nhập nội dung bạn muốn góp ý"
                }
            }
        })
        $("#fb-btn").click(function () {
            var data = {};
            var dataForm = $("#form-detail" + id).serializeArray();
            $.each(dataForm, function (i, v) {
                data["" + v.name + ""] = v.value;
            })
            insert(data);
        })

        function insert(data) {
            $.ajax({
                url: "<c:url value="/gop-y"/>  ",
                type: "POST",
                contentType: "application/json",
                dataType: "text",
                data: JSON.stringify(data),
                success: function (result) {
                    $("#msg").text("Cảm ơn bạn đã góp ý, chúng tôi sẽ tiếp nhận lời góp ý của bạn để phát triền")
                },
                error: function (result) {
                    console.log("error")
                }
            })
        }
    })
</script>
</body>
</html>