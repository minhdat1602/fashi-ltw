<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Câu hỏi thường gặp</title>
</head>
<body>
<input id="flag-index" type="hidden" value=".pages">
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href = "<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Câu hỏi thường gặp</span>
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
            <div class="col-lg-12">
                <div class="faq-accordin">
                    <div class="accordion" id="accordionExample">
                        <div class="card">
                            <div class="card-heading active">
                                <a class="active" data-toggle="collapse" data-target="#collapseOne">
                                    Sản phẩm có được đổi trả không ?
                                </a>
                            </div>
                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                <div class="card-body">
                                    Khách hàng hoàn toàn có thể đổi trả hàng trong vòng 7 ngày
                        kể từ ngày nhận hàng. </br> Tuy nhiên, hàng phải còn nguyên vẹn, không rách, nát, hư hỏng
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-heading">
                                <a data-toggle="collapse" data-target="#collapseTwo">
                                   Sản phẩm có giống với màu và hình ảnh thực tế sản phẩm không ?
                                </a>
                            </div>
                            <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                <div class="card-body">
                                    <p>Fashi cam kết hình ảnh sản phẩm trên website và sản phẩm giao cho khách hàng là giống nhau 100%</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-heading">
                                <a data-toggle="collapse" data-target="#collapseThree">
                                    Đơn hàng online có thể giao hàng đến những tỉnh thành nào ?
                                </a>
                            </div>
                            <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                <div class="card-body">
                                    <p>Fashi hỗ trợ giao hàng ở tất cả các tỉnh thành trên toàn quốc</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-heading">
                                <a data-toggle="collapse" data-target="#collapseFour">
                                   Đặt hàng online có cần đăng ký tài khoản không ?
                                </a>
                            </div>
                            <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                                <div class="card-body">
                                    <p>Để mua được hàng tại Fashi, khách hàng không nhất thiết cần có tài khoản</br>Tuy nhiên nếu trở thành thành viên của Fashi, khách hàng sẽ nhận được nhiều ưu đãi hơn</p>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Faq Section End -->
</body>
</html>