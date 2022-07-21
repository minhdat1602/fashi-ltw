<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- Footer Section Begin -->
<footer class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="footer-left">
                    <div class="footer-logo">
                        <a href="#"><img src="<c:url value="/template/img/footer-logo.png"/>" alt=""></a>
                    </div>
                    <ul>
                        <li>Địa Chỉ:113 Đường 120, Tân Phú Q9, THPCM</li>
                        <li>Phone: +84 123456789</li>
                        <li>Email: fashi@gmail.com</li>
                    </ul>
                    <div class="footer-social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1">
                <div class="footer-widget">
                    <h5>Thông Tin Fashi</h5>
                    <ul>
                        <li><a href = "<c:url value = "/view/web/about.jsp"/>">Giới thiệu</a></li>
                        <li><a href = "<c:url value = "/view/web/contact.jsp"/>">Thông tin liên hệ</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2.5">
                <div class="footer-widget">
                    <h5>Chính Sách Khách Hàng</h5>
                    <ul>
                        <li><a href = "<c:url value = "/view/web/exchange-policy.jsp"/>">Chính Sách Đổi Trả</a></li>
                        <li><a href = "<c:url value = "/view/web/warranty-policy.jsp"/>">Chính Sách Bảo Hành</a></li>
                        <li><a href = "<c:url value = "/view/web/faq.jsp"/>">Câu Hỏi Thường Gặp</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-reserved">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="copyright-text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Đồ án Thương mại điện tử <i class="fa fa-heart-o" aria-hidden="true"></i> nhóm <a href="https://colorlib.com" target="_blank">LDH</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                    <div class="payment-pic">
                        <img src="<c:url value="/template/img/payment-method.png"/>" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->