<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giới thiệu</title>
</head>
<body>
<input id="flag-index" type="hidden" value=".pages">
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href = "<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang Chủ</a>
                    <span>Giới thiệu</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Blog Details Section Begin -->
<section class="blog-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="blog-details-inner">
                    <div class="blog-detail-title">
                        <h2>FASHI</h2>
                        <p>Website Thương mại điện tử <span>HK1 2020-2021</span></p>
                    </div>
                    <div class="blog-large-pic">
                        <img src="<c:url value="/template/web/img/blog/blog-detail.jpg"/>" alt="">
                    </div>
                    <div class="blog-detail-desc">
                        <p>Đây là trang Web được xây dựng bởi nhóm LDH bao gồm 3 thành viên: Thành Long, Minh Đạt, Phi Hùng, và cũng là đồ án môn Lập trình Web được hướng dẫn bởi giảng viên: Phan Đình Long
                        </p>
                    </div>
                    <div class="blog-quote">
                        <p><span>-- Hình ảnh hoạt động của nhóm</span></p>
                    </div>
                    <div class="blog-more">
                        <div class="row">
                            <div class="col-sm-4">
                                <img src="<c:url value="/template/web/img/blog/blog-detail-1.jpg"/>" alt="">
                            </div>
                            <div class="col-sm-4">
                                <img src="<c:url value="/template/web/img/blog/blog-detail-2.jpg"/>" alt="">
                            </div>
                            <div class="col-sm-4">
                                <img src="<c:url value="/template/web/img/blog/blog-detail-3.jpg"/>" alt="">
                            </div>
                        </div>
                    </div>
              
                    
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Details Section End -->
</body>
</html>