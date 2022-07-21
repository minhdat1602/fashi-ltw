<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản phẩm yêu thích</title>
</head>
<body>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href = "<c:url value = "/view/web/index.jsp"/>"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Sản phẩm yêu thích</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section End -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-table">
                    <table>
                        <thead>
                        <tr>
                            <th>Hình</th>
                            <th class="p-name">Tên Sản Phẩm</th>
                            <th>Giá Sản Phẩm </th>
      
                    
                            <th><i class="ti-close"></i></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="cart-pic first-row"><img src="<c:url value="/template/web/img/cart-page/product-1.jpg"/>" alt=""></td>
                            <td class="cart-title first-row">
                                <h5>Áo kaki</h5>
                            </td>
                            <td class="p-price first-row">160.000 đ</td>
                            
                        
                            <td class="close-td first-row"><i class="ti-close"></i></td>
                        </tr>
                        <tr>
                            <td class="cart-pic"><img src="<c:url value="/template/web/img/cart-page/product-2.jpg"/>" alt=""></td>
                            <td class="cart-title">
                                <h5>Áo len tay dài</h5>
                            </td>
                            <td class="p-price">260.000 đ</td>
  
          
                            <td class="close-td"><i class="ti-close"></i></td>
                        </tr>
                        <tr>
                            <td class="cart-pic"><img src="<c:url value="/template/web/img/cart-page/product-3.jpg"/>" alt=""></td>
                            <td class="cart-title">
                                <h5>Áo sweater</h5>
                            </td>
                            <td class="p-price">170.000 đ</td>
                   
          
                     
                            <td class="close-td"><i class="ti-close"></i></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
             
           
            </div>
        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->
</body>
</html>