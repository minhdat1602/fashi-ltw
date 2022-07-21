<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liên hệ</title>
</head>
<body>
<input id="flag-index" type="hidden" value=".contact-page">
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href = "<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Liên hệ</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Contact Section Begin -->
<section class="contact-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="contact-title">
                    <h4>Liên Hệ Hỗ Trợ</h4>
                    <p>Khách hàng cần giải đáp thắc mắc xin hãy liên hệ qua các liên hệ dưới đây, chúng tôi sẽ đáp ứng nhu cầu khác hàng 24/7.</p>
                </div>
                <div class="contact-widget">
                    <div class="cw-item">
                        <div class="ci-icon">
                            <i class="ti-location-pin"></i>
                        </div>
                        <div class="ci-text">
                            <span>Địa Chỉ:</span>
                            <p>113 Đường 120, Tân Phú Q9, THPCM</p>
                        </div>
                    </div>
                    <div class="cw-item">
                        <div class="ci-icon">
                            <i class="ti-mobile"></i>
                        </div>
                        <div class="ci-text">
                            <span>Phone:</span>
                            <p>+84 123456789</p>
                        </div>
                    </div>
                    <div class="cw-item">
                        <div class="ci-icon">
                            <i class="ti-email"></i>
                        </div>
                        <div class="ci-text">
                            <span>Email:</span>
                            <p>fashi@gmail.com</p>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</section>
<!-- Contact Section End -->
</body>
</html>