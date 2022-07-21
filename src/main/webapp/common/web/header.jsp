<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


<!-- Header Section Begin -->
<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="ht-left">
				<div class="mail-service">
					<i class=" fa fa-envelope"></i> fashi@gmail.com
				</div>
				<div class="phone-service">
					<i class=" fa fa-phone"></i> +84359996543
				</div>
			</div>
			<div class="ht-right">
				<c:if test="${empty USERMODEL}">
					<a href="<c:url value = "/dang-ky"/>" class="register-panel">Đăng
						ký</a>
					<a style="padding-right: 20px" href="<c:url value = "/dang-nhap"/>"
						class="register-panel">Đăng nhập</a>
				</c:if>
				<c:if test="${not empty USERMODEL}">
					<a style="width: 170px"
						href="<c:url value = "/capnhat?page=info"/>" class="login-panel">
						<i class="fa fa-user"></i> ${USERMODEL.firstName}
						${USERMODEL.lastName}
					</a>
					<ul class="dropdown" id="userOption">
						<c:if test="${not empty USERMODEL && USERMODEL.isAdmin()}">
							<li><a
								href="<c:url value = "/admin/danh-sach-san-pham?type=list&page=1&maxPageItem=10&sorting=id&sortBy=asc"/>">Trang
									quản trị</a></li>
						</c:if> 
						<li><a href="<c:url value = "/capnhat?page=info"/>">Đổi
								thông tin</a></li>
						<li><a href="<c:url value = "/danh-sach-don-hang"/>">Đơn
								hàng</a></li>
						<li><a href="<c:url value="/dang-nhap?action=logout"/>">Đăng
								xuất</a></li>
					</ul>
				</c:if>
				<div class="lan-selector">
					<select class="language_drop" name="countries" id="countries"
						style="width: 300px;">
						<option value='yt'
							data-image="<c:url value="/template/img/flag-1.jpg"/>"
							data-imagecss="flag yt" data-title="Việt Nam">VietNam</option>
						<option value='yu'
							data-image="<c:url value="/template/img/flag-2.jpg"/>"
							data-imagecss="flag yu" data-title="English">English</option>
					</select>
				</div>
				<div class="top-social">
					<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
						class="ti-twitter-alt"></i></a> <a href="#"><i class="ti-linkedin"></i></a>
					<a href="#"><i class="ti-pinterest"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="inner-header">
			<div class="row">
				<div class="col-lg-2 col-md-2">
					<div class="logo">
						<a href="<c:url value = "/trang-chu"/>"> <img
							src="<c:url value="/template/img/logo.png "/>" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<form id="search-form" method="get"
						action="<c:url  value="/cuahang"/> ">
						<div class="advanced-search">
							<button type="button" class="category-btn">Tìm kiếm</button>
							<div class="input-group">
								<input id="search-"
									<c:if test="${not empty words}">value="${words}"</c:if>
									name="words" type="text" placeholder="" style="color: black;">
								<%--<a style="color: black;" href="<c:url value = "/tiemkiem"/>">--%>
								<button type="button" id="search-btn">
									<i class="ti-search"></i>
								</button>


								<%--</a>--%>
							</div>
						</div>
					</form>
				</div>
				<script>
					$(document).ready(
							function() {
								$("#search-btn").click(
										function() {
											if ($("#search-").val() != null
													&& $("#search-").val()
															.trim() != "") {
												$("#search-form").submit();
											}
										})
							})
				</script>
				<div class="col-lg-3 text-right col-md-3" id="reload">
					<ul class="nav-right">
						<%--<li class="heart-icon"><a
                                href="<c:url value = "/view/web/favorite-products.jsp"/>"> <i
                                class="icon_heart_alt"></i> <span>3</span>
                        </a>
                        </li>--%>
						<li class="cart-icon"><a href="<c:url value = "/gio-hang"/>">
								<i class="icon_bag_alt"></i> <span class="qty"> <c:if
										test="${(empty CART) or (CART.cartDetailsList.size() == 0)}">
                            0
                        </c:if> <c:if
										test="${(not empty CART) and (CART.cartDetailsList.size() != 0)}">
                            ${CART.cartDetailsList.size()}
                        </c:if>
							</span>
						</a> <c:if
								test="${(not empty CART) and (CART.cartDetailsList.size() != 0)}">
								<div class="cart-hover">
									<div class="select-items">
										<table>
											<tbody>
												<c:forEach items="${CART.cartDetailsList}" var="details">
													<tr class="row${details.stock.id}">
														<td class="si-pic" style="width: 80px;"><img
															src="<c:url value="${details.stock.product.imageUrl}"/>"
															alt="Picture"></td>
														<td class="si-text">
															<div class="product-selected">
																<div style="font-size: 15px">
																	<fmt:formatNumber pattern="###,###,###"
																		value="${details.stock.product.sellPrice}" />
																	x <span id="quan2${details.stock.id}">
																		${details.quantity}</span>
																</div>
																<h6>${details.stock.product.name}</h6>
															</div>
														</td>
														<%-- <td class="close-td first-row">
                                                             <button detail-id="${details.stock.id}" class="deleteBtn" type="button"
                                                                     style="outline: none; border: none;background-color: #fff;">
                                                                 <i class="ti-close"></i>
                                                             </button>
                                                         </td>--%>
														<td class="si-close">
															<button detail-id="${details.stock.id}" class="deleteBtn"
																type="button"
																style="outline: none; border: none; background-color: #fff;">
																<i class="ti-close"></i>
															</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="select-total">
										<span>Tổng:</span>
										<h5 class="money all-price">${CART.totalPrice()}</h5>
									</div>
									<div class="select-button">
										<a href="<c:url value="/gio-hang"/>"
											class="primary-btn view-card">Giỏ hàng</a> <a
											href="<c:url value="/thanh-toan"/> "
											class="primary-btn checkout-btn">Thanh toán</a>
									</div>
								</div>
							</c:if> <%--</c:if>--%></li>
						<c:if test="${(CART.cartDetailsList.size() != 0) || (empty CART)}">
							<li class="cart-price all-price money">${CART.totalPrice()}
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="nav-item">
		<div class="container">
			<div class="nav-depart">
				<div class="depart-btn">
					<i class="ti-menu"></i> <span>TẤT CẢ SẢN PHẨM</span>
					<ul class="depart-hover">
						<c:forEach items="${lv1}" var="lv1">
							<li><a
								href="<c:url value="/cuahang?groupNameStr=${lv1.name}"/>">${lv1.name}
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<nav class="nav-menu mobile-menu">
				<ul>
					<li class="index-page"><a href="<c:url value = "/trang-chu"/>">Trang
							Chủ</a></li>
					<li class="shop-page"><a href="<c:url value = "/cuahang"/>">Cửa
							hàng</a></li>
					<li class="collection-page"><a
						href="<c:url value = "/collection"/>">Bộ Sưu Tập</a>
						<ul class="dropdown">
							<c:forEach items="${CL}" var="cl">
								<li class="collection-page"><a
									href="<c:url value = "/collection?id=${cl.id}"/>">
										${cl.name}</a></li>
							</c:forEach>

							<%--<li class="collection-page"><a href="<c:url value = "/view/web/collection-details.jsp"/>">Mùa
                                Hè</a></li>--%>
						</ul></li>
					<li class="sale-page"><a href="<c:url value = "/sale"/>">SALE</a>
						<ul class="dropdown">
							<c:forEach items="${listPromotion}" var="promotion">
								<li class="sale-page"><a
									href="<c:url value = "/sale?id=${promotion.id}"/>">
										${promotion.name}</a></li>
							</c:forEach>

<<<<<<< HEAD
						</ul></li>
					<li class="contact-page"><a
						href="<c:url value = "/view/web/contact.jsp"/>">Liên Hệ</a></li>
					<li class="pages"><a>Trang</a>
						<ul class="dropdown">
							<li class="pages"><a
								href="<c:url value = "/view/web/faq.jsp"/>">Câu hỏi</a></li>
							<li class="pages"><a
								href="<c:url value = "/view/web/about.jsp"/>">Giới thiệu</a></li>
							<li class="pages"><a href="#">Góp ý</a></li>
						</ul></li>
				</ul>
			</nav>
			<div id="mobile-menu-wrap"></div>
		</div>
	</div>
=======
                        </ul>
                    </li>
                    <li class="contact-page"><a
                            href="<c:url value = "/view/web/contact.jsp"/>">Liên Hệ</a></li>
                    <li class="pages"><a>Trang</a>
                        <ul class="dropdown">
                            <li class="pages"><a
                                    href="<c:url value = "/view/web/faq.jsp"/>">Câu hỏi</a></li>
                            <li class="pages"><a
                                    href="<c:url value = "/view/web/about.jsp"/>">Giới thiệu</a></li>
                            <li class="pages"><a href="<c:url value = "/gop-y"/>">Góp ý</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
        </div>
    </div>
>>>>>>> parent of 5a06246... comit
</header>
<!-- Header End -->

